version 1.0

workflow hello_concat_workflow {
  input {
    String first
    String second
  }

  call concat_echo {
    input:
      first = first,
      second = second
  }
}

task concat_echo {
  input {
    String first
    String second
  }

  command {
    echo "${first}${second}"
  }

  output {
    String out = read_string(stdout())
  }

  runtime {
    docker: "ubuntu:latest"
  }
}