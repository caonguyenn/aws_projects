resource "aws_route53_record" "website" {
  zone_id = "Z0679184C0DA0F2XUPKB"
  name    = "nguyentancaonguyen.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.Site_Access.domain_name
    zone_id                = aws_cloudfront_distribution.Site_Access.hosted_zone_id
    evaluate_target_health = false
  }
}