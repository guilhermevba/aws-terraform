resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "developers_readonly" {
  group      = aws_iam_group.developers.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_user" "example_user" {
  name = "example-developer"
  path = "/users/"
}

resource "aws_iam_user_group_membership" "example_user_membership" {
  user = aws_iam_user.example_user.name

  groups = [
    aws_iam_group.developers.name,
  ]
}
