resource "aws_iam_user" "new-user" {
    count = var.create_user ? 1 : 0

    name                    = "${var.iam_user_name}"
    path                    = "${var.path}"
    force_destroy           = "${var.force_destroy}"
    permissions_boundary    = "${var.permissions_boundary}"

    tags = var.default_tags
}
resource "aws_iam_access_key" "access-key" {
    count = var.create_user && var.iam_access_key ? 1 : 0

    user    = "${aws_iam_user.new-user[0].name}"
}
resource "aws_iam_user_login_profile" "login-profile" {
    count = var.create_user && var.iam_user_login_profile ? 1 : 0

    user                    = "${aws_iam_user.new-user[0].name}"
    pgp_key                 = "${var.pgp_key}"
    password_length         = "${var.password_length}"
    password_reset_required = "${var.password_reset_required}"
}
resource "aws_iam_user_ssh_key" "user-ssh-key" {
    count = var.create_user && var.iam_user_ssh_key ? 1 : 0

    username   = "${aws_iam_user.new-user[0].name}"
    encoding   = "${var.encoding}"
    public_key = "${var.public_key}"
}
resource "aws_iam_policy_attachment" "https-git-credentials" {
    count = var.create_user && var.iam_https-git-credentials ? 1 : 0

    name       = "https-git-credentials"
    users      =  [ "${aws_iam_user.new-user[0].name}" ]
    policy_arn = "arn:aws:iam::aws:policy/AWSCodeCommitPowerUser"
}

