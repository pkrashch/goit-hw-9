output "environment_url" {
  value = "http://${aws_elastic_beanstalk_environment.env.cname}"
}

output "platform" {
  value = data.aws_elastic_beanstalk_solution_stack.python.name
}
