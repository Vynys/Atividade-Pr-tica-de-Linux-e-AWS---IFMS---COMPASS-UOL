# Atividade-Prática-de-Linux-e-AWS--IFMS--COMPASS-UOL

#Objetivos da atividade prática:

Este repositório tem o objetivo de documentar e instruir as etapas de criação das atividades propostas de Linux e AWS. Os objetivos primarios são a crianção de uma instância EC2 na AWS, o dowload e a configuração de NFS(Network File System) no Linux, a automatizão de um script para verificar os status do serviço apache e logo após enviar os resultados ao diretorio NFS de 5 em 5 minutos.

#Requisitos AWS:

Gerar uma chave pública para acesso ao ambiente;
Criar 1 instância EC2 com o sistema operacional Amazon Linux 2 (Família t3.small, 16 GB SSD);
Gerar 1 elastic IP e anexar à instância EC2;
Liberar as portas de comunicação para acesso público:(22/TCP, 111/TCP E UDP, 2049/TCP/UDP, 80/TCP, 443/TCP)


#Requisitos Linux: 

Configurar o NFS entregue;

Criar um diretorio dentro do filesystem do NFS com seu nome;

Subir um apache no servidor - o apache deve estar online e rodando;

Criar um script que valide se o serviço esta online e envie o resultado da validação para o seu diretorio no nfs;

O script deve conter - Data HORA + nome do serviço + Status + mensagem personalizada de ONLINE ou offline;

O script deve gerar 2 arquivos de saida: 1 para o serviço online e 1 para o serviço OFFLINE;

Preparar a execução automatizada do script a cada 5 minutos.
