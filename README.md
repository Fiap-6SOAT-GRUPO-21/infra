# Infra (VPC - EKS)

## Descrição

Esse repositório contém os códigos Terraform para deployment da infraestrutura na AWS utilizada na fase do techchallenge, bem como provionamento de pods kubernetes da aplicação.

Todo provisionamento foi feito asssumindo-se que AWS Academy está sendo utilizado.  AWS Academy não permite a criação de IAM roles ou qualquer outro recurso relacioado a AWS IAM. Sendo assim, em todos os módulos é utilizado o role LabRole pre-existente na AWS Academy.

As seguintes tarefas são realizadas por esse código Terradorm:

* Através do módulo vpc: Provisionamento da infra da rede (VPC, subnet, Internet Gateway, route table e NAT)
* Através do módulo eks: Provisionamento do cluster EKS

Pipeline de destroy também foi criada para destruir TODA a infraestrutura criada, incluindo dos outros terrafoms criados como RDS e EKS.

## Fazendo Deployment via ACTION

O action 'terraform apply' pode ser usado para realizar o deployment da infraestrutura, cluster EKS.  Será necessário fornecer as credenciais da nuvem AWS ao executar os script, atarvés do seguinte procedimento:

1. Inicialize o laboratório no AWS Academy
2. Criar um bucket S3 para armazenar o estado do Terraform.  O nome do bucket deve ser "bucketterraformfiap"  (Caso não esteja disponivel criar com outro nome, mas lembre de alterar a variavel no passo 6)
3. Em configurações de acesso deixar ela como "público". (Desmacar todas as opções e tickar o aviso) o resto pode deixar como está. E clique em criar bucket.
4. Copie as credenciais disponíveis em AWS Details (ver AWS CLI em CLoud Access)
5. Atualize as secrets da organização com as credenciais obtidas no passo anterior
6. Caso o nome do bucket S3 seja diferente de "bucketterraformfiap", atualize tambem a variável bucketName para o nome do bucket criado no passo 2
7. Execute o seguinte comando para configurar as credenciais do cluster EKS na sua máquina e poder executar comandos com kubectl
```bash
aws eks --region us-east-1 update-kubeconfig --name techchallenge
```
### Lembre-se de executar a pipe 'terraform destroy' ao final dos testes

## Testando na máquina local aponta para o ambiente AWS Academy

1. Inicialize o laboratório no AWS Academy
2. Copie as credenciais disponíveis em AWS Details (ver AWS CLI em CLoud Access) para o arquivo ~/.aws/credentials da sua máquina
3. Comente o blco  do s3 backend no arquivo provider.tf
5. Execute 'terraform init': 
```bash
terraform init
```
6. Execute 'terraform apply' para subir a infraestrutura:
```bash
  terraform apply
```
7. Execute o seguinte comando para configurar as credenciais do cluster EKS na sua máquina e poder executar comandos com kubectl
```bash
aws eks --region us-east-1 update-kubeconfig --name techchallenge
```
8. Execute o seguinte comando de deploy da aplicação:
```bash
  terraform destroy
```

### Lembre-se de executar 'terraform destroy' ao final dos testes