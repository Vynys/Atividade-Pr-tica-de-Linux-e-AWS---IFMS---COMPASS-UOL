
diretorio_nfs="/mnt/vinicius"

nome_servico="Apache"

data_hora=$(date +'%Y-%m-%d %H:%M:%S')

if systemctl is-active --quiet httpd; then
    echo "$data_hora $nome_servico ONLINE" > "$diretorio_nfs/servico_online.txt"
else
    echo "$data_hora $nome_servico OFFLINE" > "$diretorio_nfs/servico_offline.txt"
fi
