terraform {
  backend "s3" {
    bucket                      = "yanawsbucket"
    key                         = "terraform/backend/s3/tf_state"
    skip_credentials_validation = true

  }
}
