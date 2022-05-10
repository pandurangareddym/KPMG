resource "aws_key_pair" "t3key" {
  key_name   = "t3key"
  public_key = file(var.PUB_KEY_PATH)
}
