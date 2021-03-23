#!/usr/bin/env bash

set -e

unset NODE_IP
unset NODE_PORT
unset YAML_PATH

NODE_IP=${1}
NODE_PORT=${2}
YAML_PATH='./monitoring/prometheus/prometheus.yml'

function usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") <ip> <port>

Setups prometheus.yml for specified ip and port.

Example:
$(basename "${BASH_SOURCE[0]}") 0.0.0.0 8888

EOF
}

if [[ "$@" == *"help"* ]]; then
    usage
    exit
fi 

if [ -z "$NODE_IP" ]; then
    echo "Node IP address is missing."
    usage
    exit 1
fi

if [ -z "$NODE_PORT" ]; then
    echo "Node port is missing."
    usage
    exit 1
fi

if [ ! -f "$YAML_PATH" ]; then
    echo "Cant locate $YAML_PATH, move back to repo root."
    exit 1
fi

cp "$YAML_PATH" './monitoring/prometheus/prometheus.yml.edited'

sed -i "s/NODE_IP/$NODE_IP/g" './monitoring/prometheus/prometheus.yml.edited'
sed -i "s/NODE_PORT/$NODE_PORT/g" './monitoring/prometheus/prometheus.yml.edited'
