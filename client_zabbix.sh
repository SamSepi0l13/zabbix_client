#!/bin/bash

echo "============================================================================================"
echo "||                          Instalação do Agente Zabbix"
echo "||                          Autor: EstagioGois"
echo "||                          Versão: 1.0"
echo "============================================================================================"

# Função para verificar e relatar erros
verificar_erro() {
  if [ $? -ne 0 ]; then
    echo "Erro: $1 falhou."
    exit 1
  fi
}

# Função para instalar o Agente Zabbix no Debian 8
instalar_agente_debian8() {
  # Lógica de instalação do Agente Zabbix no Debian 8
  echo "Instalando o Agente Zabbix no Debian 8..."
  # Adicione os comandos específicos para o Debian 8 aqui
  git clone https://github.com/SamSepi0l13/zabbixdeb8.git
  install_zabbix_agent_debian8
  instalar_git
}

# Função para instalar o Agente Zabbix no Debian 9
instalar_agente_debian9() {
  # Lógica de instalação do Agente Zabbix no Debian 9
  echo "Instalando o Agente Zabbix no Debian 9..."
  # Adicione os comandos específicos para o Debian 9 aqui
  git clone https://github.com/SamSepi0l13/zabbixdeb9.git
  install_zabbix_agent_debian9
  instalar_git
}

# Função para instalar o Agente Zabbix no Debian 10
instalar_agente_debian10() {
  # Lógica de instalação do Agente Zabbix no Debian 10
  echo "Instalando o Agente Zabbix no Debian 10..."
  # Adicione os comandos específicos para o Debian 10 aqui
  git clone https://github.com/SamSepi0l13/zabbixdeb10.git
  install_zabbix_agent_debian10
}

# Função para instalar o Agente Zabbix no Debian 11
instalar_agente_debian11() {
  # Lógica de instalação do Agente Zabbix no Debian 11
  echo "Instalando o Agente Zabbix no Debian 11..."
  git clone https://github.com/SamSepi0l13/zabbixdeb11.git
  install_zabbix_agent_debian11
}

# Função para instalar o Agente Zabbix no Debian 12
instalar_agente_debian12() {
  echo "Instalando o Agente Zabbix no Debian 12..."
  git clone https://github.com/SamSepi0l13/zabbix_deb12.git
  install_zabbix_agent_debian12
  #nano /etc/zabbix/zabbix_agent2.conf
}

# Detecta a versão do Debian
detectar_versao_debian() {
  if grep -qi "Debian GNU/Linux 8" /etc/os-release; then
    instalar_agente_debian8
  elif grep -qi "Debian GNU/Linux 9" /etc/os-release; then
    instalar_agente_debian9
  elif grep -qi "Debian GNU/Linux 10" /etc/os-release; then
    instalar_agente_debian10
  elif grep -qi "Debian GNU/Linux 11" /etc/os-release; then
    instalar_agente_debian11
  elif grep -qi "Debian GNU/Linux 12" /etc/os-release; then
    instalar_agente_debian12
  else
    echo "Versão do Debian não suportada."
    exit 1
  fi
}

detectar_versao_debian
# Função para instalar o agente Zabbix no Debian 12
install_zabbix_agent_debian12() {
echo "Instalando Zabbix Agent no Debian 12..."
echo "cd zabbix_deb12"
}
# Executa o script do repositório clonado
if [ -f "zabbix_deb12/zabbixdeb12.sh" ]; then
  echo "Executando..."
  source "zabbix_deb12/zabbixdeb12.sh"
else
  echo "zabbixdeb12.sh não encontrado no repositório."
fi
# Verifica se o diretório do repositório já existe
if [ -d "zabbix_deb12" ]; then
echo "O diretório do repositório já existe."
else
install_zabbix_agent_debian12
fi

install_zabbix_agent_debian11() {
echo "Instalando Zabbix Agent no Debian 11..."
echo "cd zabbixdeb11"
}
# Executa o script do repositório clonado
if [ -f "zabbixdeb11/zabbixdeb11.sh" ]; then
  echo "Executando..."
  source "zabbixdeb11/zabbixdeb11.sh"
else
  echo "zabbixdeb11.sh não encontrado no repositório."
fi
# Verifica se o diretório do repositório já existe
if [ -d "zabbixdeb11" ]; then
echo "O diretório do repositório já existe."
else
install_zabbix_agent_debian11
fi

install_zabbix_agent_debian10() {
echo "Instalando Zabbix Agent no Debian 10..."
echo "cd zabbixdeb10"
}
# Executa o script do repositório clonado
if [ -f "zabbixdeb10/zabbixdeb10.sh" ]; then
  echo "Executando..."
  source "zabbixdeb10/zabbixdeb10.sh"
else
  echo "zabbixdeb10.sh não encontrado no repositório."
fi
# Verifica se o diretório do repositório já existe
if [ -d "zabbixdeb10" ]; then
echo "O diretório do repositório já existe."
else
install_zabbix_agent_debian10
fi

install_zabbix_agent_debian9() {
echo "Instalando Zabbix Agent no Debian 9..."
echo "cd zabbixdeb9"
}
# Executa o script do repositório clonado
if [ -f "zabbixdeb9/zabbixdeb9.sh" ]; then
  echo "Executando..."
  source "zabbixdeb9/zabbixdeb9.sh"
else
  echo "zabbixdeb9.sh não encontrado no repositório."
fi
# Verifica se o diretório do repositório já existe
if [ -d "zabbixdeb9" ]; then
echo "O diretório do repositório já existe."
else
install_zabbix_agent_debian9
fi

install_zabbix_agent_debian8() {
echo "Instalando Zabbix Agent no Debian 8..."
echo "cd zabbixdeb8"
}
# Executa o script do repositório clonado
if [ -f "zabbixdeb8/zabbixdeb8.sh" ]; then
  echo "Executando..."
  source "zabbixdeb8/zabbixdeb8.sh"
else
  echo "zabbixdeb8.sh não encontrado no repositório."
fi
# Verifica se o diretório do repositório já existe
if [ -d "zabbixdeb8" ]; then
echo "O diretório do repositório já existe."
else
install_zabbix_agent_debian8
fi

# Função para instalar o Git no Debian
instalar_git() {
  echo "Instalando o Git..."
  apt-get install git
  verificar_erro "Instalação do Git"
  git --version  # Verifica se o Git foi instalado com sucesso
  echo "Git instalado com sucesso."
}
# Chama a função para instalar o Git
instalar_git
