
resource "aws_s3_bucket" "website" {
  bucket = "nguyentancaonguyen.com"
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "origin" {
  depends_on = [
    aws_cloudfront_distribution.Site_Access
  ]
  bucket = aws_s3_bucket.website.id
  policy = data.aws_iam_policy_document.origin.json
}

module "template_files" {
  source = "hashicorp/dir/template"

  base_dir = "${path.module}/web-files"
}

resource "aws_s3_object" "Bucket_files" {
  bucket = aws_s3_bucket.website.id # ID of the S3 bucket

  for_each     = module.template_files.files
  key          = each.key
  content_type = each.value.content_type

  source  = each.value.source_path
  content = each.value.content

  # ETag of the S3 object
  etag = each.value.digests.md5
}