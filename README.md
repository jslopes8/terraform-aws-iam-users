# iam-user
Criando o usuário do IAM, o perfil de login do IAM, um chave de acesso do IAM criado randomicamente.

### Keybase pre-requisits
Quando `pgp_key` é especificado como `keybase:username`, certifique-se de que este usuário já enviou a chave pública para keybase.io.

### Como descriptografar a senha criptografada
A maneira mais fácil de descriptografar sua chave é com o Keybase CLI. Para obter a chave, você deve descriptografar o valor fornecido pelo inicializador, execute o seguinte commando.

```bash
$ echo "wcBMA37..." | base64 -d | keybase pgp decrypt
```
A saída será a chave em texto simples
Esta é a sua chave e deve ser guardada da mesma maneira que você guarda uma senha.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Variables Inputs
| Name | Descrição | Tipo | Default | Requerida |
|-----------------------------------------------|
| create_user | Se deseja criar um usuario | bool | `"true"` | no |
| iam_user_login_profile | Se deseja criar um perfil de login de usuario | bool | `"true"` | no |
| iam_access_key | Se deseja criar chave de acesso do IAM | bool | `"true"` | no |
| iam_https-git-credentials | Se deseja anexa Policy para acesso ao AWS Commit | bool | `"true"` | no |
| iam_user_ssh_key | Se deseja importar uma chave SSH | bool | `"false"` | no |
| iam_user_name | O nome do usuario que irá criar | string | `" "` | yes |
| force_destroy | Ao destruir este usuário, destrua mesmo se ele tiver chaves de acesso IAM não gerenciadas pelo Terraform | bool | `"false"` | no |
| permissions_boundary | O ARN da política usada para definir o limite de permissões para o usuário | string | `" "` | no |
| path | O path desejado para o usuário do IAM | string | `"/"` | no |
| encoding | Especifica o formato de codificação da chave pública a ser usada. Para recuperar a chave pública no formato ssh-rsa, use o SSH. Para recuperar a chave pública no formato PEM, use o PEM | string | `"SSH"` | no |
| public_key | A chave pública do SSH. A chave pública deve ser codificada no formato ssh-rsa ou no formato PEM | string | `" "` | no |
| pgp_key | Uma chave pública PGP codificada com base 64 ou um nome de usuário keybase na key keybase:username. Usado para criptografar senha e chave de acesso. | string | | yes |
| password_length | O comprimento da senha gerada | number | `"20"` | no |
| password_reset_required | Se o usuário deve ser forçado a redefinir a senha gerada no primeiro login | bool | `"false"` | no |
| tag_name | Tags para adicionar a todos os recursos | string | `" "` | yes |
| tag_time | Tags para adicionar o nome do time relacioando a todos os recursos | string | `" "` | yes |

## Variable Outputs
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
