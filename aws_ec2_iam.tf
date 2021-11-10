# -----------------------------------------------------------------------------
# IAM Instance Profile
# -----------------------------------------------------------------------------
resource "aws_iam_instance_profile" "default" {
  name = join("", [local.node_alias, "-ec2-instance-profile"])
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role" "ec2_role" {
  name = join("", [local.node_alias, "-ec2-instance-role"])
  path = "/ec2/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["ec2.amazonaws.com"]
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "ec2_ebs_policy" {
  name = join("", [local.node_alias, "-ebs-full-access"])

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "ec2:AttachVolume",
              "ec2:CreateVolume",
              "ec2:CreateSnapshot",
              "ec2:CreateTags",
              "ec2:DeleteVolume",
              "ec2:DeleteSnapshot",
              "ec2:DescribeAvailabilityZones",
              "ec2:DescribeInstances",
              "ec2:DescribeVolumes",
              "ec2:DescribeVolumeAttribute",
              "ec2:DescribeVolumeStatus",
              "ec2:DescribeSnapshots",
              "ec2:CopySnapshot",
              "ec2:DescribeSnapshotAttribute",
              "ec2:DetachVolume",
              "ec2:ModifySnapshotAttribute",
              "ec2:ModifyVolumeAttribute",
              "ec2:DescribeTags"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2_container_service_policy_attachment" {
  role       = aws_iam_role.ec2_role.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "ec2_ssm_policy_attachment" {
  role       = aws_iam_role.ec2_role.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ec2_ebs_policy_attachment" {
  policy_arn = aws_iam_policy.ec2_ebs_policy.arn
  role       = aws_iam_role.ec2_role.id
}
