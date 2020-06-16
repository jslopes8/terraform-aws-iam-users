output "iam_user" {
    value   = aws_iam_user.new-user[0].name 
}
output "secret" {
    value   = aws_iam_access_key.access-key[0].secret
}
output "access_key" {
    value   = aws_iam_access_key.access-key[0].id
}
output "encrypted_password" {
    value   = aws_iam_user_login_profile.login-profile[0].encrypted_password
}
