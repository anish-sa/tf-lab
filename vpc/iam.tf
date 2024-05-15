resource "aws_iam_role" "ec2_s3_access_role" {
  name = "ec2_s3_access_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : ["s3:ListBucket"],
        "Resource" : ["arn:aws:s3:::${var.bucket_name}"]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ],
        "Resource" : ["arn:aws:s3:::${var.bucket_name}/*"]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_s3_access_policy_attachment" {
#   for_each = toset([
#     "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier",
#     "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier",
#     "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker",
#   ])

  policy_arn = aws_iam_policy.s3_access_policy.arn
  role       = aws_iam_role.ec2_s3_access_role.name
}

resource "aws_iam_instance_profile" "beanstalk_ec2_profile" {
  name = "ec2_s3_access_instance_profile"
  role = aws_iam_role.ec2_s3_access_role.name
}
