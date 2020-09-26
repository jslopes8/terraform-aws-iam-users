output "iam_user" {
    value   = aws_iam_user.new-user[0].name 
}
output "secret" {
    value   = length(aws_iam_access_key.access-key) > 0 ? aws_iam_access_key.access-key[0].secret : null
}
output "access_key" {
    value   = length(aws_iam_access_key.access-key) > 0 ? aws_iam_access_key.access-key[0].id : null
}
output "encrypted_password" {
    value   = length(aws_iam_user_login_profile.login-profile) > 0 aws_iam_user_login_profile.login-profile.0.encrypted_password : null
}
