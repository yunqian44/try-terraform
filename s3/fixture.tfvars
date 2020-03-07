region = "ap-east-1"

namespace = ""

stage = "test"

name = "yang-temp"

acl = "private"

force_destroy = true

versioning_enabled = false

allow_encrypted_uploads_only = false 

allowed_bucket_actions = ["s3:PutObject", "s3:PutObjectAcl", "s3:GetObject", "s3:DeleteObject", "s3:ListBucket", "s3:ListBucketMultipartUploads", "s3:GetBucketLocation", "s3:AbortMultipartUpload"]