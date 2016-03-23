#!/bin/bash

dmidecode -q -t memory | sed 's/\t//g' | sed 's/:/":"/g' |sed 's/^/"/'|sed 's/:"[ \t]*/:"/' |sed  '1 i\{"Memory":' | sed  "\$a"\"} | sed 's/""//g' | sed '/^\s*$/d' | sed 's/$/",/' | sed 's/"","}"/}/g' |sed 's/"",//g' | sed 's/"}",/}/' | sed '/^\s*$/d'
