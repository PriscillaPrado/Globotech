# Projeto de Infraestrutura AWS: Guestbook de Alta Disponibilidade

Este repositório contém o template de AWS CloudFormation (`template.yaml`) usado para implantar uma aplicação web "Guestbook" (PHP/MySQL) em uma arquitetura de alta disponibilidade na AWS.

O deploy foi automatizado via AWS CLI e o status da stack pode ser verificado como `CREATE_COMPLETE`, provando que todos os recursos de infraestrutura foram provisionados com sucesso.

![Print da tela do CloudFormation mostrando o status 'CREATE_COMPLETE'](https://github.com/PriscillaPrado/Globotech/blob/main/Fase8/assets/Deploy%20Completo.png)
## 🌐 Site Ativo (URL)

A aplicação está disponível publicamente através do Application Load Balancer no seguinte endpoint:

**[http://HoloTaskerHub-ALB-346262983.us-east-1.elb.amazonaws.com](http://HoloTaskerHub-ALB-346262983.us-east-1.elb.amazonaws.com)**

A imagem abaixo mostra os *Outputs* (Saídas) da stack do CloudFormation, incluindo a URL do ALB, o IP do Bastion e os endpoints do RDS e EFS.

![Saídas da Stack do CloudFormation](https://github.com/PriscillaPrado/Globotech/blob/main/Fase8/assets/Cloudformation%20-%20Sa%C3%ADdas.png)

## 📋 Requisitos do Projeto

A infraestrutura foi projetada para atender aos seguintes requisitos obrigatórios:

* Criação da estrutura via AWS CloudFormation.
* Uso do **Amazon EC2**.
* Uso do **Auto Scaling** em duas Zonas de Disponibilidade (AZs) e com política de escalonamento.
* Uso do **Elastic Load Balancer (ALB)** em duas AZs.
* Uso do **Amazon RDS**.
* Uso do **Amazon EFS**.
* Configuração de **Security Groups** (Grupos de Segurança) garantindo o menor privilégio.
* Demonstração de **Alta Disponibilidade** (site continua funcionando ao derrubar uma instância).

## 🏛️ Arquitetura e Serviços Utilizados

Todas as capturas de tela abaixo comprovam a implementação de cada requisito:

### 1. Amazon EC2

Conforme a imagem `Instâncias.jpg`, três instâncias EC2 do tipo `t4g.small` (Free Tier ARM) estão em execução:
* Um **Bastion Host** (para acesso SSH seguro), localizado na `us-east-1a`.
* Duas **Instâncias da Aplicação** (nome `HoloTaskerHub-Instance`), uma em cada Zona de Disponibilidade (`us-east-1a` e `us-east-1b`), gerenciadas pelo Auto Scaling.

![Lista de Instâncias EC2](https://github.com/PriscillaPrado/Globotech/blob/main/Fase8/assets/Inst%C3%A2ncias.png)

### 2. Elastic Load Balancer (ALB)

Conforme as imagens `Load Balancer.jpg` e `Load Balancer - ALB.jpg`:
* O ALB (`HoloTaskerHub-ALB`) está **ativo** e distribuindo tráfego.
* Ele está configurado para operar em **duas Zonas de Disponibilidade** (`us-east-1a` e `us-east-1b`), provando a alta disponibilidade da "porta de entrada".
* O *Listener* (Receptor) encaminha o tráfego da porta 80 (HTTP) para o *Target Group* (Grupo de destino) das instâncias EC2.

![Detalhes da Rede do Load Balancer](https://github.com/PriscillaPrado/Globotech/blob/main/Fase8/assets/Load%20Balancer.png)
![Listeners do Load Balancer](https://github.com/PriscillaPrado/Globotech/blob/main/Fase8/assets/Load%20Balancer%20-%20ALB.png)

### 3. Auto Scaling Group (ASG)

Conforme as imagens `Auto Scaling.jpg` e `Grupos de Auto Scaling.jpg`:
* Um Auto Scaling Group (`Guestbook-Projeto-Stack-AutoScaling...`) está ativo.
* Ele está configurado com `Min: 2` e `Desired: 2`, garantindo que **duas instâncias** estejam sempre em execução.
* Ele está configurado para usar as sub-redes em **duas Zonas de Disponibilidade** (`us-east-1a` e `us-east-1b`), provando o requisito de HA.
* *(Nota: Para a apresentação, é preciso mostrar a aba "Escalonamento automático" para provar a política de scaling).*

![Lista de Grupos de Auto Scaling](https://github.com/PriscillaPrado/Globotech/blob/main/Fase8/assets/Grupos%20de%20Auto%20Scaling.png)
![Detalhes do Grupo de Auto Scaling](https://github.com/PriscillaPrado/Globotech/blob/main/Fase8/assets/Auto%20Scaling.png)

### 4. Amazon RDS

Conforme a imagem `RDS.jpg`:
* O serviço de banco de dados foi provisionado.
* Um `DBSubnetGroup` (`guestbook-projeto-stack-dbsubnetgroup...`) foi criado, colocando o banco de dados em sub-redes privadas (`10.0.3.0/24` e `10.0.4.0/24`) em duas AZs, garantindo isolamento da internet.

![Grupo de Sub-rede do RDS](https://github.com/PriscillaPrado/Globotech/blob/main/Fase8/assets/RDS.png)

### 5. Amazon EFS

Conforme a imagem `EFS.jpg`:
* Um sistema de arquivos EFS (`fs-0fb8da...`) foi criado.
* Isso permite que ambas as instâncias EC2 compartilhem arquivos (como imagens de upload), garantindo que os dados sejam consistentes, não importa qual instância responda ao usuário.

![Detalhes do Sistema de Arquivos EFS](https://github.com/PriscillaPrado/Globotech/blob/main/Fase8/assets/EFS.png)

### 6. Security Groups (Menor Privilégio)

Este é o ponto central do design da rede, provado pelas regras de entrada (inbound) dos Security Groups:

1.  **Internet -> ALB:** O `AlbSecurityGroup` permite tráfego `HTTP` (porta 80) vindo de qualquer lugar (`0.0.0.0/0`).
    ![Security Group do ALB](https://github.com/PriscillaPrado/Globotech/blob/main/Fase8/assets/Grupos%20de%20Seguran%C3%A7a.png)

2.  **ALB -> Aplicação:** O `AppSecurityGroup` permite tráfego `HTTP` (porta 80) **APENAS** vindo do Security Group do ALB (`sg-03ebd...`).
    ![Security Group da Aplicação](https://github.com/PriscillaPrado/Globotech/blob/main/Fase8/assets/Grupo%20de%20Seguran%C3%A7a%20Stack.png)

3.  **Aplicação -> RDS:** O `RdsSecurityGroup` permite tráfego `MySQL` (porta 3306) **APENAS** vindo do Security Group da Aplicação (`sg-0b3d...`).
    ![Security Group do RDS](hhttps://github.com/PriscillaPrado/Globotech/blob/main/Fase8/assets/Grupo%20Seguran%C3%A7a%20RDS.png)

Este fluxo prova o princípio do menor privilégio, onde cada componente só pode ser acessado pela camada estritamente necessária.

### 7. Lista de Recursos do CloudFormation

A imagem abaixo mostra todos os 35 recursos (VPC, Subnets, Rotas, Gateways, SGs, Instâncias, etc.) criados e gerenciados pela stack do CloudFormation.

![Lista de Recursos da Stack](https://github.com/PriscillaPrado/Globotech/blob/main/Fase8/assets/Recursos.png)
