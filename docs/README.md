# Homework 9: AWS Elastic Beanstalk (Single instance)

Terraform code that creates the Elastic Beanstalk environment from the assignment.

## What is created

| Requirement | Terraform |
|-------------|-----------|
| Application `my-app` | `aws_elastic_beanstalk_application.app` |
| Web server environment `my-app-env` | `aws_elastic_beanstalk_environment.env` (`tier = "WebServer"`) |
| Python platform, recommended version | `data.aws_elastic_beanstalk_solution_stack.python` picks the newest Amazon Linux 2023 Python stack |
| Sample application | no application version is set, so the platform's built-in sample is deployed |
| Single instance | `EnvironmentType = SingleInstance` |
| t3.micro | `aws:ec2:instances / InstanceTypes = t3.micro` |
| Min = Max = 1 | `aws:autoscaling:asg / MinSize = 1, MaxSize = 1` |
| EC2 role `aws-elasticbeanstalk-ec2-role` with `AWSElasticBeanstalkWebTier` | `aws_iam_role.ec2` + instance profile |
| Service role | `aws_iam_role.service` (EnhancedHealth + ManagedUpdates policies) |
| Monitoring and Environment health | enhanced health reporting enabled |

## Deploy

```bash
cd terraform
export AWS_PROFILE=<your profile>
terraform init
terraform apply
terraform output environment_url
```
Creation takes about 5-10 minutes. Open the URL: the Elastic Beanstalk sample page must load.

## Clean up

```bash
terraform destroy
```

## Screenshots for the submission (`ДЗ9_ПІБ`)

Screenshots must be taken in the AWS Console, because the assignment checks what is visible there.

| # | Where | What must be visible |
|---|-------|----------------------|
| 1 | Elastic Beanstalk -> Applications | `my-app` and `my-app-env` |
| 2 | my-app-env -> Configuration -> Instance traffic and scaling | Instance types: `t3.micro` |
| 3 | my-app-env -> Monitoring | CPUUtilization, NetworkIn, NetworkOut, Environment health |
| 4 | my-app-env -> Configuration -> Instance traffic and scaling | Environment type: Single instance (Min/Max/Desired = 1) |
| 5 | Browser, environment URL | Sample application page |

Notes:
- If the Monitoring page shows empty graphs, wait 5-10 minutes after creation and refresh. If a metric is missing, use "Add widget" or set the time range to 1 hour.
- In Single instance mode, the console may show capacity fields as not editable. This is expected.
- If Terraform created the environment, the console still shows it normally, because it is the same resource.
