## Criação de Usuario IAM
resource "aws_iam_user" "new-user" {
    count = var.create_user ? 1 : 0

    name                    = var.iam_user_name
    path                    = var.path
    force_destroy           = var.force_destroy
    permissions_boundary    = var.permissions_boundary

    tags = var.default_tags
}
## Criação de um IAM Acces Key
resource "aws_iam_access_key" "access-key" {
    count = var.create_user && var.iam_access_key ? 1 : 0

    user    = aws_iam_user.new-user.0.name
}

## Enable Acesso ao AWS Console
resource "aws_iam_user_login_profile" "login-profile" {
    count = var.create_user && var.iam_user_login_profile ? 1 : 0

    user                    = aws_iam_user.new-user.0.name
    pgp_key                 = var.pgp_key
    password_length         = var.password_length
    password_reset_required = var.password_reset_required
}

## Enable Acesso SSH
resource "aws_iam_user_ssh_key" "user-ssh-key" {
    count = var.create_user && var.iam_user_ssh_key ? 1 : 0

    username   = aws_iam_user.new-user.0.name
    encoding   = var.encoding
    public_key = var.public_key
}

## Enable Acesso ao GIT Credentials
resource "aws_iam_policy_attachment" "https-git-credentials" {
    count = var.create_user && var.iam_https-git-credentials ? 1 : 0

    name       = "https-git-credentials"
    users      =  [ aws_iam_user.new-user.0.name ]
    policy_arn = "arn:aws:iam::aws:policy/AWSCodeCommitPowerUser"
}

## Gerar Senha AWS Console para o IAM Usuario
resource "null_resource" "password_decrypt" {
    depends_on = [ aws_iam_user_login_profile.login-profile ]

    count = var.create_user && var.iam_user_login_profile ? 1 : 0

    provisioner "local-exec" {
        interpreter = ["/bin/bash", "-c"]
        command     = <<EOF
            echo "${aws_iam_user_login_profile.login-profile.0.encrypted_password}" | \
            base64 -d | \
            keybase pgp decrypt > > "${data.template_file.user_file.0.rendered}"
        EOF
    }
}

## Data Source para obter a senha do IAM usuario
data "template_file" "user_file" {
    depends_on = [ aws_iam_user_login_profile.login-profile ]
    count = var.create_user && var.iam_user_login_profile ? 1 : 0

    template = "${path.module}/tpl/user_file.tpl"
}
data "local_file" "user_file" {
    depends_on = [ aws_iam_user_login_profile.login-profile, null_resource.password_decrypt ]
    count = var.create_user && var.iam_user_login_profile ? 1 : 0

    filename = "${data.template_file.user_file.0.rendered}"
}