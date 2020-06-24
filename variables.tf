variable "create_user" {
    default = true
    type    = bool
}
variable "iam_access_key" {
    default = false
    type    = bool
}
variable "iam_user_login_profile" {
    default = false
    type    = bool
}
variable "iam_https-git-credentials" {
    default = false
    type    = bool
}
variable "iam_user_name" {
    type    = string
}
variable "force_destroy" {
    type    = bool
    default = false
}
variable "permissions_boundary" {
    type    = string
    default = null
}
variable "path" {
    type    = string
    default = "/"
}
variable "iam_user_ssh_key" {
    type    = bool
    default = false
}
variable "encoding" {
    type    = string
    default = "SSH"
}
variable "public_key" {
    type    = string
    default = ""
}
variable "pgp_key" {
    type    = string
    default = ""
}
variable "password_length" {
    type    = number
    default = "20"
}
variable "password_reset_required" {
    type    = bool
    default  = false
}
variable "default_tags" {
    type    = any
    default = {}
}
