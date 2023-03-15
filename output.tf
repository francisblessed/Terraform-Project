output "aws_kms_key" {
  value = aws_kms_key.joetechkey.arn
}

output "random_number" {
    value = random_integer.random_number.result

}