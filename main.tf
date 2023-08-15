provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "lambda" {  
  name = "backstage-example-component-lambda-role"  
  
  assume_role_policy = jsonencode({  
    Version = "2012-10-17"  
    Statement = [  
      {  
        Action = "sts:AssumeRole"  
        Effect = "Allow"  
        Principal = {  
          Service = "lambda.amazonaws.com"  
        }  
      }  
    ]  
  })  
}  
  
resource "aws_iam_role_policy" "lambda" {  
  name = "backstage-example-component--lambda-policy"  
  role = aws_iam_role.lambda.id  
  
  policy = jsonencode({  
    Version = "2012-10-17"  
    Statement = [  
      {  
        Action = [  
          "logs:CreateLogGroup",  
          "logs:CreateLogStream",  
          "logs:PutLogEvents"  
        ]  
        Effect   = "Allow"  
        Resource = "arn:aws:logs:*:*:*"  
      }
    ]
  })  
}  

resource "aws_lambda_function" "this" {  
  function_name = "backstage-example-component-"
  runtime       = "python3.9"
  handler       = "lambda_function.lambda_handler"
  role          = aws_iam_role.lambda.arn
  timeout       = var.timeout  
  memory_size   = var.memory  
  filename      = "src/src.zip"
  
  
}  
