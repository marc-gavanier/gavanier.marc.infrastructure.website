resource "aws_s3_bucket" "website" {
  bucket        = "${local.product_information.context.product}-${local.product_information.context.service}"
  force_destroy = true
  tags          = local.tags
}

resource "aws_s3_bucket_website_configuration" "website" {
  count  = var.enable_bucket_website ? 1 : 0
  bucket = aws_s3_bucket.website.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "website_bucket_ownership" {
  count  = var.enable_bucket_website ? 1 : 0
  bucket = aws_s3_bucket.website.bucket
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_public_access_block" "website_bucket_public_access" {
  count  = var.enable_bucket_website ? 1 : 0
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_website_access_from_internet" {
  count  = var.enable_bucket_website ? 1 : 0
  bucket = aws_s3_bucket.website.id
  policy = data.aws_iam_policy_document.allow_website_access_from_internet.json
}

data "aws_iam_policy_document" "allow_website_access_from_internet" {
  statement {
    sid    = "PublicReadGetObject"
    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    resources = [
      "${aws_s3_bucket.website.arn}/*",
    ]
  }
}
