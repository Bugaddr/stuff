#!/usr/bin/env bash
# Russell Harkanson - 2019
# ORIGINAL REPO----https://gist.github.com/rharkanson/d81c8bb491f2f7b09c356bc357b33eb0
# dns-test
# Ping many DNS servers (in batches) and print sorted table of results
#
# usage: ./dns-test [C] [S] [N]
#     C - ping count for each DNS (5)
#     S - sort column 1:Name 2:IP 3:Loss 4:Min 5:Avg 6:Max 7:StDev (5)
#     N - parallel operations at once (4)

# Kindly provided by https://twitgoo.com/best-free-dns-servers/
# Remove or add DNS to list with form <name>/<ip>
DNS_ADDRS=(Google/8.8.8.8
  OpenDNSHome/208.67.222.222
  CloudFlare/1.1.1.1
  Quad9/9.9.9.9
  Level3/209.244.0.3
  Verisign/64.6.64.6
  DNS.WATCH/84.200.69.80
  ComodoSecureDNS/8.26.56.26
  GreenTeamDNS/81.218.119.11
  SafeDNS/195.46.39.39
  Norton_C-safe/199.85.126.10
  Level3dns/209.244.0.3
  Banglore_bell_tel/203.201.60.12
  VI/182.19.95.34
  JIO/202.138.120.86
  OpenNIC/23.94.60.240
  SmartViper/208.76.50.50
  Dyn/216.146.35.35
  FreeDNS/37.235.1.174
  AlternateDNS/198.101.242.72
  Yandex.DNS/77.88.8.8
  UncensoredDNS/91.239.100.100
  HurricaneElectric/74.82.42.42
  puntCAT/109.69.8.51)

# Number of pings (default 5)
C=${1:-5}

# Sort column (default 5 - Avg)
##    1    2  3    4   5   6   7
COLS=(Name IP Loss Min Avg Max StDev)
S=${2:-5}

# Parallel procs (default 4)
N=${3:-4}

# Indicate sort column
S_num=$(cut -d',' -f 1 <<<"$S")
COLS[$S_num - 1]="[${COLS[$S_num - 1]}]"
COLS_HDR="$(printf "%s, \t%s, \t%s, \t%s, \t%s, \t%s, \t%s" "${COLS[*]}")"

# Run in batches of N, report results
(
  for dns in "${DNS_ADDRS[@]}"; do
    dnsip=$(cut -d'/' -f 2 <<<"$dns")
    ((i = i % N))
    ((i++ == 0)) && wait
    ping -q -c "$C" "$dnsip" | awk 'match($0, / ([0-9\.]+)%/) {loss=substr( $0, RSTART, RLENGTH-1)} $3=="="{stats=$4} END{if(int(loss)==100) print "'"$dns"'/"loss"%/--/--/--/--"; else print "'"$dns"'/"loss"%/"stats}' &
  done
) | sort -V -t '/' -k "$S" | awk -v FS='/' 'BEGIN{print "'"$COLS_HDR"'"} {r=""; for(i=1;i<7;i++) r=r""$(i)", \t"; print r""$7}' | column -t
