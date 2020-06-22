# Terraform module to Create New IAM user
Creating the IAM user, the IAM login profile, a randomly created IAM access key

### Keybase pre-requisits
When `pgp_key` is specified as`keybase:username`, make sure that this user has already sent the public key to keybase.io.

### How to decrypt the encrypted password
The easiest way to decrypt your key is with the Keybase CLI. To obtain the key, you must decrypt the value provided by the initiator, execute the following command.

```bash
$ echo "wcBMA37..." | base64 -d | keybase pgp decrypt
```
The output will be the key in plain text
This is your key and should be kept in the same way that you keep a password.

## Usage
Example of the use: Creating a new IAM User
```hcl
module "iam_user" {
    source  = "git@github.com:jslopes8/terraform-aws-iam-users.git?ref=v1.1"

    iam_user_name           = "tirulipa"
    force_destroy           = "true"
    path                    = "/"
    pgp_key                 = "keybase:user"

    iam_user_login_profile  = true
    iam_access_key          = "false"
    password_reset_required = "true"
    password_length         = "32"

    # tags
    default_tags    = {
        Name            = "Tirulipa da Silva"
        Squad           = "Desenvolvedor"
        ApplicationRole = "Porta Web"
    }
}
```

## Requirements
| Name | Version |
| ---- | ------- |
| aws | ~> 2.54 |
| terraform | ~> 0.12 |

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Variables Inputs
| Name | Description | Required | Type | Default |
|----- | ----------- | -------- | ---- | ------- |
| iam_user_login_profile | If you want to create a user login profile | `no` | `bool` | `true` |
| iam_access_key | If you want to create an IAM access key | `no` | `bool` | `true` |
| iam_https-git-credentials | If you want to attach Policy for access to the AWS Commit | `no` | `bool` | `true` |
| iam_user_ssh_key | If you want to import an SSH key | `no` | `bool` | `false` |
| iam_user_name | The name of the user who will create | `yes` | `string` | ` ` |
| force_destroy | When destroying this user, destroy even if he has IAM access keys not managed by Terraform | `no` | `bool` | `false` |
| permissions_boundary | The ARN of the policy used to set the permission limit for the user | `no` | `string` | `null` |
| path | The desired path for the IAM user | `no` | `string` | `/` |
| encoding | Specifies the encoding format of the public key to be used. To retrieve the public key in the ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM | `no` | `string` | `SSH` |
| public_key | The SSH public key. The public key must be encoded in ssh-rsa format or in PEM format | `no` | `string` | ` ` |
| pgp_key | A base 64 encoded PGP public key or a keybase username in the key keybase: username. Used to encrypt password and access key. | `yes` | `string` | ` ` |
| password_length | The length of the generated password | `no` | `number` | `20` |
| password_reset_required | Whether the user should be forced to reset the password generated at first login | `no` | `bool` | `false` |
| default_tags | Tags to add to all resources | `yes` | `map` | `{ }` |


## Variable Outputs
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
| Name | Description |
| ---- | ----------- |
| iam_user | The user's name. |
| secret | The password of the user's. |
| access_key | The access key of the user's. |
| encrypted_password | The access secret of the user's. |
