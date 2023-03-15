resource "aws_kms_key" "joetechkey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 30
}
resource "random_integer" "random_number" {

  min = 1
  max = 9999

}

resource "aws_s3_bucket" "joetech" {
  depends_on = [
    random_integer.random_number
  ]
   acl = "private"
   bucket = "bootcamp30-${random_integer.random_number.result}-joseph"
    object_lock_enabled = true
    
     versioning {
    enabled = true
  }
    
    # tags = {
    #   "Name" = bootcamp30-${ra}
    # }
  
}
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.joetech.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.joetechkey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

#kms key can be inputed by running  terraform import aws_kms_key.a arnnumber