#!/usr/bin/env bash

echo -n 'Versão do Terminal Bash: '; echo $BASH_VERSION
echo -n 'Provedor de Consulta ( Ex: ipinfo.io, ipconfig.io: ) '; read DATABASE

locationIp()
{
	# Provedores Aceitos - Banco Dados
	URL=('ipinfo.io' 'ipconfig.io')
	# Busca Informações Servidor Com Wget
	PROVIDER=$(/usr/bin/wget -qO- $DATABASE)
	echo 'Informações de Protocolo de Internet e Localização: '	$PROVIDER

#	echo -n 'Selecione o tipo de Informação a Filtrar: 1 2 3'
}
# Verifica Provedor Digitado Pelo Usuário. Se o Provedor estiver no Banco de Dados Armazenados a Função é Executada. O Contrário é Listado alguns Provedores Aceitos.
if [[ $DATABASE != ${URL[0]} && $PROVIDER != ${URL[1]} ]];
then
	echo 'Provedores de Buscas Aceitos: ipinfo.io, ipconfig.io'
else
	echo 'Executando Busca...'; locationIp
fi
