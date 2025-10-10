module "stackgen_38569800-b96d-4b43-8ce6-82301333d82b" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_d36199"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup899fc29e26775b9c98ac294474dba63e0\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_899fc29e-2677-5b9c-98ac-294474dba63e.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup899fc29e26775b9c98ac294474dba63e1\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"${module.stackgen_899fc29e-2677-5b9c-98ac-294474dba63e.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = module.stackgen_b9e830af-209d-5317-9d9f-1eae1a50d304.name
  role_type = "Writer"
}

module "stackgen_899fc29e-2677-5b9c-98ac-294474dba63e" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_ed990d-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_a970d31a-0c80-55c5-ab40-22449ce6b3ed" {
  source                = "./modules/aws_lambda"
  architecture          = "x86_64"
  authorization_type    = "NONE"
  cors                  = []
  create_function_url   = false
  description           = null
  environment_variables = null
  event_source_arn      = null
  event_source_mapping  = []
  filename              = null
  function_name         = "stackgen_ed990d-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = module.stackgen_899fc29e-2677-5b9c-98ac-294474dba63e.name
  memory_size           = 128
  role                  = module.stackgen_b9e830af-209d-5317-9d9f-1eae1a50d304.arn
  runtime               = "python3.8"
  s3_bucket             = null
  s3_key                = null
  s3_object_version     = null
  system_log_level      = null
  tags                  = null
  timeout               = 3
}

module "stackgen_b9e830af-209d-5317-9d9f-1eae1a50d304" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_ed990d-role"
  path                  = null
  permissions_boundary  = null
  tags                  = null
}

