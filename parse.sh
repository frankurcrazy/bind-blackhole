#!/usr/bin/env bash

regexLine="[^ ]+[[:space:]]+(.+)"

while read line; do

	[[ $line =~ $regexLine ]]

	if [[ ${BASH_REMATCH[0]} != "" ]]; then

		FQDN="${BASH_REMATCH[1]}"

		if [[ "$FQDN" = "localhost" ]]; then
			continue;
		fi

		echo "zone \"$FQDN\" { type master;  file \"/etc/named/blackhole\"; };"
	fi

done < /dev/stdin
