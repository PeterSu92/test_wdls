version 1.0

workflow hello_concat_workflow {
  input {
    String first
    String second
    String docker_image = "535002863113.dkr.ecr.us-east-1.amazonaws.com/yp/ubuntu:latest"
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
    docker: docker_image
  }
}