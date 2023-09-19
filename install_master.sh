#!/bin/bash

# Copy Systemd services
cp ./systemd/* /etc/systemd/system/

# Blackbox Exporter
mkdir /usr/share/blackbox-exporter
cp ./binaries/arm64/blackbox_exporter /usr/share/blackbox-exporter/
cp ./config/blackbox_exporter/blackbox.yml /usr/share/blackbox-exporter/

# Speedtest
cp ./binaries/arm64/speedtest /usr/bin/
cp ./binaries/arm64/speedtest-exporter /usr/bin/

# Grafana Postrges Service
mkdir /usr/share/grafana-postgres-service
cp ./binaries/arm64/grafana_postgres_service /usr/share/grafana-postgres-service/
cp ./config/grafana_postgres_service/.env /usr/share/grafana-postgres-service/

# Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.47.0/prometheus-2.47.0.linux-arm64.tar.gz
tar -zxvf prometheus-2.47.0.linux-amd64.tar.gz -C /usr/share/
cp ./config/prometheus/* /usr/share/prometheus-2.47.0.linux-arm64/

# Grafana
wget https://dl.grafana.com/oss/release/grafana-10.1.1.linux-arm64.tar.gz
tar -zxvf grafana-10.1.1.linux-amd64.tar.gz -C /usr/share/

# Pihole
curl -sSL https://install.pi-hole.net | bash

# Postgres
apt install -y postgresql
./config/postgresql/postgresql_setup.sh

# Enable Services
systemctl daemon-reload
systemctl enable blackbox-exporter.service
systemctl enable grafana-postgres.service
systemctl enable prometheus.service
systemctl enable speedtest-exporter.service

# Start Services
systemctl start blackbox-exporter.service
systemctl start grafana-postgres.service
systemctl start prometheus.service
systemctl start speedtest-exporter.service