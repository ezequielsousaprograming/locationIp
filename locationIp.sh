#!/usr/bin/env bash

echo 'Banco Dados A Consultar: '; read DATABASE

locationIp() {
	COMMAND=$(/usr/bin/wget -qO- $DATABASE)
}

if ! [ 'https://'  ] || [ 'http://' ] || [ ' ' ]
then
	echo 'Digite o endereço seguido do protocolo https ou http corretamente'
else

	if [ locationIp ]
	then
		echo 'Buscando dados em: '$DATABASE
		locationIp
	else
		echo 'Erro ao buscar Informações!'
		echo 'Não conseguimos encontrar seu endereço IP.'
	fi

fi
