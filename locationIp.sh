#!/usr/bin/env bash

echo 'Versão do Terminal Bash: '; echo $BASH_VERSION
echo 'Provedor de Consulta ( Ex: ipinfo.io: ) '; read DATABASE

locationIp()
{
	# Provedores Aceitos - Banco Dados
	URL='ipinfo.io ipconfig.io'
	# Busca Informações Servidor Com Wget
	PROVIDER=$(/usr/bin/wget -qO- $DATABASE)
	echo 'Informações de Protocolo de Internet e Localização: '	$PROVIDER
	# Verifica Provedor Informado
	if [ $URL ];
	then
		echo 'Provedor de Busca Não Encontrado!'
		echo 'Provedores de Buscas Aceitos: ipinfo.io, ipconfig.io'
	fi
}

# Executa a Função
locationIp
