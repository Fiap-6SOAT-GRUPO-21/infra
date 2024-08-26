# Infra (VPC - EKS - RDS)

## Descrição

Esse repositório contém os códigos Terraform para deployment da infraestrutura na AWS utilizada na fase5 do techchallenge, bem como provionamento de pods kubernetes da aplicação.

Todo provisionamento foi feito asssumindo-se que AWS Academy está sendo utilizado.  AWS Academy não permite a criação de IAM roles ou qualquer outro recurso relacioado a AWS IAM. Sendo assim, em todos os módulos é utilizado o role LabRole pre-existente na AWS Academy.

As seguintes tarefas são realizadas por esse código Terradorm:

* Através do módulo vpc: Provisionamento da infra da rede (VPC, subnet, Internet Gateway, route table e NAT)
* Através do módulo rds: Provisionamento da instância de database RDS postgres que será usado pela aplicação
* Através do módulo eks: Provisionamento do cluster EKS

## Testando na máquina local

1. Inicialize o laboratório no AWS Academy
2. Copie as credenciais disponíveis em AWS Details (ver AWS CLI em CLoud Access) para o arquivo ~/.aws/credentials da sua máquina
4. Execute o comando 'terraform init' informado ao final da execução do script executado no passo anterior.
5. Execute 'terraform apply' para realizar as tarefas descritas acima
6. Execute o seguinte comando para configurar as credenciais do cluster EKS na sua máquina e poder executar comandos com kubectl:
   aws eks --region us-east-1 update-kubeconfig --name techchallenge
7. Lembre-se de executar 'terraform destroy' ao final dos testes