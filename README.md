# Casper-Monitoring
Example utilizing Prometheus and Grafana to monitor the casper-node.\
NOTE: This is just an example and is not recommeneded for production useage.

# Dependencies
Requires:
- docker: https://docs.docker.com/get-docker/
- docker-compose: https://docs.docker.com/compose/install/

# Setup
`./setup_casper_monitoring.sh <node_ip> <node_port>`
- setups prometheus target to casper-node

# Run
docker-compose up -d

# View
- Grafana: http://localhost:3000
    - Default Username and Password: admin, admin
- Prometheus: http://localhost:9090

# Docs
- Grafana: https://grafana.com/docs/
- Prometheus: https://prometheus.io/docs/introduction/overview/
