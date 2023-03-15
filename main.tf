module "s3bucket" {
  source = "./s3bucket"

}
output "module_random" {
    value = module.s3bucket.random_number
  
}

output "aws_kms_key" {
  value = module.s3bucket.aws_kms_key
}