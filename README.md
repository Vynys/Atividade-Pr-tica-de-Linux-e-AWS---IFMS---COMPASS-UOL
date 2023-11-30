# Atividade-Prática-de-Linux-e-AWS--IFMS--COMPASS-UOL🎓📘

# Objetivos da atividade prática:

🔴 Este repositório tem o objetivo de documentar e instruir as etapas de criação das atividades propostas de Linux e AWS. Os objetivos primarios são a crianção de uma instância EC2 na AWS, o dowload e a configuração de NFS(Network File System) no Linux, a automatizão de um script para verificar os status do serviço apache e logo após enviar os resultados ao diretorio NFS de 5 em 5 minutos.

## Requisitos AWS:

• **Gerar uma chave pública para acesso ao ambiente;**

• **Criar 1 instância EC2 com o sistema operacional Amazon Linux 2 (Família t3.small, 16 GB SSD);**

• **Gerar 1 elastic IP e anexar à instância EC2;**

• **Liberar as portas de comunicação para acesso público:(22/TCP, 111/TCP E UDP, 2049/TCP/UDP, 80/TCP, 443/TCP)**


## Requisitos Linux: 

• **Configurar o NFS entregue;**

• **Criar um diretorio dentro do filesystem do NFS com seu nome;**

• **Subir um apache no servidor - o apache deve estar online e rodando;**

• **Criar um script que valide se o serviço esta online e envie o resultado da validação para o seu diretorio no nfs;**

• **O script deve conter - Data HORA + nome do serviço + Status + mensagem personalizada de ONLINE ou offline;**

• **O script deve gerar 2 arquivos de saida: 1 para o serviço online e 1 para o serviço OFFLINE;**

• **Preparar a execução automatizada do script a cada 5 minutos.**

• Após atender todos os requisitos basicos, depois de ja ter criando a instancia EC2, voce devera acessar sua instância via ssh usando sua cheva .pem por via de um terminal com o seguinte comando:
```
ssh -i /caminho/para/sua/chave-privada.pem ec2-user@seu-ipv4-publico 
```

• Após obter o acesso a sua maquina, precisará da permissao root para configuração da atividade, voce obtem a permissao com o seguinte codigo:
```
sudo su 
```

🔴 Agora, basicamente acabamos a parte na aws, vamos usar alguns comandos no linux para a realização da tarefa pratica da parte linux.

🔴 Vamos por etapas, começando por: 

## Configuração NFS

• Instale o servidor NFS com o seguinte comando: 
```
yum install nfs-utils
```

• Crie um direotiro com o seu nome, no NFS, com o seguinte comando: 
```
mkdir /mnt/seu_nome
```

• Configure o arquivo NFS, com o seguinte comando:
```
nano /etc/exports
/caminho_do_seu_diretorio_nfs ip_acesso(rw,no_root_squash,sync)
```
• Esse comando fara com que voce defina o diretorio NFS, e depois disso tudo, voce inicia o servidor NFS, com o seguinte comando:
```
systemctl start nfs-server && systemctl enable nfs-server
```
🔴 Parte do NFS concluida.

## Configurações do Apache:

• Instale o apache na sua maquina com o comando: 
```
yum install httpd -y
```

• Inicie e ative o apache com o comando: 
```
systemctl start httpd && systemctl enable httpd
```

## Criação do Script:

• Crie um arquivo nano com a extensão sh:
```
nano status_apache.sh
```

• Edite e crie o script: 

```
diretorio_nfs="/caminho/do/seu/diretorio_nfs

service_name="httpd" 

status=$(systemctl is-active $service_name)

timestamp=$(date "+%Y-%m-%d %H:%M:%S")

if [ "$status" = "active" ]; then
    echo "$timestamp - $service_name - ONLINE" >> "$diretorio_nfs/servico_online.txt"
else
    echo "$timestamp - $service_name - OFFLINE" >> "$diretorio_nfs/servico_offline.txt"
fi"
```
• O script ainda falta ficar executavel, faça isso com o comando: 
```
chmod +x status_apache.sh
```

• Abra o crontab para a automatização do script com o comando: 
```
contrab -e
```

Edite o contrab com o intervalo de tempo para a execução do script: 
```
*/5 * * * * /caminho_do_script
```
