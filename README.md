# Casper-Monitoring
Example utilizing Prometheus and Grafana to monitor the casper-node.\
NOTE: This is just an example and is not recommeneded for production useage.

# Dependencies
Requires:
- docker: https://docs.docker.com/get-docker/
- docker-compose: https://docs.docker.com/compose/install/

# Setup
This will add the supplied IP Address and port as a target to prometheus. \
ie. `./setup_casper_monitoring.sh <node_ip> <node_port>`

# Run
### Start Containers
`docker-compose up -d`

### Teardown Containers
`docker-compose down`

# View
Note: Assumes you are browsing from the box running the containers. Otherwise update \
localhost to an IP Address.
- Grafana: `http://localhost:3000`
    - Default Username and Password: admin, admin
- Prometheus: `http://localhost:9090`

# Docs
- Grafana: https://grafana.com/docs/
- Prometheus: https://prometheus.io/docs/introduction/overview/

# Notes
- There is an example of utilizing node-exporter for scraping host level metrics. \
This requires node-exporter be setup on the target host. By default it is setup on \
port 9100. The grafana dashboard will report `No data` for some panels if not used. \
See: https://github.com/prometheus/node_exporter for more details.

- To view all metrics associated with a job, browse to `http://localhost:9090/graph` and search \
for the job in question.
    - i.e: {job="node"}
    - i.e: {job="node-exporter"}

- Dashboard can be updated by modifying `./monitoring/grafana/dashboards/casper-dashboard.json` \
and restarting the containers.
