#!/usr/bin/env bash

#Fuck header
echo '# Netscape HTTP Cookie File'

#Ffuck data
sqlite3 -separator $'\t' $1 <<-EOF
.mode tabs
.header off
select host_key,
case substr(host_key,1,1)='.' when 0 then 'FALSE' else 'TRUE' end,
path,
case is_secure when 0 then 'FALSE' else 'TRUE' end,
expires_utc,
name,
value
from cookies
EOF
