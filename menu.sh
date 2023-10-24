#!/bin/bash

# Função para exibir o menu
show_menu() {
    clear
    echo "Escolha uma opção:"
    echo "1. Executar script do Zabbix"
    echo "2. Executar script do audit"
    echo "3. Executar script do Puppet"
    echo "4. Sair"
}

# Clonar repositórios do GitHub
clone_github_repos() {
    #git clone https://github.com/seu-usuario/zabbix-repo.git
    git clone https://github.com/SamSepi0l13/zabbix_client.git 
    wget -P /root/audit_linux http://repo.pbh/seg/audit_crontab.sh


    wget http://repo.pbh/seg/audit_crontab.sh 
}

# Loop do menu
while true; do
    show_menu

    read -p "Opção: " option

    case $option in
        1)
            # Clonar o repositório do Zabbix
            clone_github_repos
            # Execute o script do Zabbix
            chmod +x ./zabbix_client/client_zabbix.sh
            ./zabbix_client/client_zabbix.sh
            ;;
        2)
            # Execute o script do audit (se estiver local)
            ./root/audit_linux/script_audit.sh
            ;;
        3)
            # Clonar o repositório do Puppet
            clone_github_repos
            # Execute o script do Puppet
            ./puppet-repo/script_puppet.sh
            ;;
        4)
            # Sair do script
            exit 0
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac

    read -p "Pressione Enter para continuar..."
done
