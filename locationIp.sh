#!/usr/bin/env bash

COMMAND=$(/usr/bin/wget -qO ipinfo.io/ip);

if [ -c $COMMAND  ]
then
	echo 'Buscando dados em https://ipinfo.io'
	sleep 2
	$COMMAND
else
	echo 'Erro ao buscar Informações!'
fi
