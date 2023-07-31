#!/usr/bin/env bash
# Execute este script com bash ./LocationIp. Sua execução com sh causará alguns erros. sh LocationIp.sh
# Execute desta forma ./LocationIp.sh
# Não esqueça de executar as permissões com chmod +x LocationIp.sh

echo -n 'Versão do Terminal Bash: '; echo $BASH_VERSION
echo -n 'Provedor de Consulta ( Ex: ipinfo.io, ipconfig.io: ) '; read DATABASE

locationIp()
{
	# Provedores Aceitos - Banco Dados
	URL=('ipinfo.io' 'ipconfig.io' 'ifconfig.io')
	# Busca Informações Servidor Com Wget
	PROVIDER=$(/usr/bin/wget -qO- $DATABASE)
	echo 'Informações de Protocolo de Internet e Localização: '	$PROVIDER

#	echo -n 'Selecione o tipo de Informação a Filtrar: 1 2 3'
}

# Verifica Provedor Digitado Pelo Usuário. Se o Provedor estiver no Banco de Dados Armazenados a Função é Executada. O Contrário é Listado alguns Provedores Aceitos.
if [[ $DATABASE != 'ipinfo.io' && $DATABASE != 'ipconfig.io' && $DATABASE != 'ifconfig.io' ]];
then
	echo 'Provedores de Buscas Aceitos: ipinfo.io, ipconfig.io, ifconfig.io'
else
	echo 'Executando Busca...'; locationIp

	# Cria Arquivo HTML e executa o Browser Firefox Exibe as Informações de Ip e Localização, caso a opção de servidor de busca será ifconfig.io. Necessário Instalação do Firefox.
	if [[ $DATABASE = 'ifconfig.io' ]];
	then
		read -p 'Criando Arquivo HTML. Tecle Enter Para Confirmação?'
		wget -qO- $DATABASE >> Ifconfig.html
		sleep 2
		firefox Ifconfig.html
	fi
fi
