# resource "aws_route53_zone" "main" {
#   name = "nguyentancaonguyen.com"
# }

# # Route 53 Alias Record pointing to the S3 Website Endpoint
# resource "aws_route53_record" "website_alias" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = "nguyentancaonguyen.com"
#   type    = "A"

#   alias {
#     name                   = aws_s3_bucket_website_configuration.example.website_domain
#     zone_id                = aws_s3_bucket.website.hosted_zone_id
#     evaluate_target_health = false
#   }
# }