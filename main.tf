terraform {
  backend "s3" {
    bucket                      = "yanawsbucket"
    key                         = "path/to/my/key"
    skip_credentials_validation = true

  }
}
