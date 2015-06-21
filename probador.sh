#!/bin/bash

altura=`grep "altura" variables.sh | sed 's/altura=\(.*\)/\1/g'`
base=`grep "base" variables.sh | sed 's/base=\(.*\)/\1/g'`

echo 'base = '$base
echo 'altura = '$altura
echo 'base * altura = '$(($altura*$base))

radio=`grep "radio" variables.sh | sed 's/radio=\(.*\)/\1/g'`

echo ''
echo 'El radio es: '$radio

exit 0
