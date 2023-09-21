#!/bin/bash
apt install curl wget

# Copy Systemd services
cp ./systemd/* /etc/systemd/system/

# Blackbox Exporter
wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.24.0/blackbox_exporter-0.24.0.linux-arm64.tar.gz
tar -zxvf blackbox_exporter-0.24.0.linux-arm64.tar.gz -C /usr/share/
cp ./config/blackbox_exporter/blackbox.yml /usr/share/blackbox_exporter-0.24.0.linux-arm64/

# Speedtest
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash
apt install speedtest
chmod +x binaries/speedtest_exporter
cp ./binaries/speedtest_exporter /usr/bin/

# Grafana Postgres Service
mkdir /usr/share/grafana-postgres-service
chmod +x binaries/grafana_postgres_service
cp ./binaries/grafana_postgres_service /usr/share/grafana-postgres-service/
cp ./config/grafana_postgres_service/.env /usr/share/grafana-postgres-service/

# Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.47.0/prometheus-2.47.0.linux-arm64.tar.gz
tar -zxvf prometheus-2.47.0.linux-arm64.tar.gz -C /usr/share/
cp ./config/prometheus/* /usr/share/prometheus-2.47.0.linux-arm64/

# Grafana
apt install -y adduser libfontconfig1 musl
wget https://dl.grafana.com/oss/release/grafana_10.1.2_arm64.deb
dpkg -i grafana_10.1.2_arm64.deb

# PiHole
curl -sSL https://install.pi-hole.net | bash

# Postgres
apt install -y postgresql
chmod +x ./config/postgresql/postgresql_setup.sh
./config/postgresql/postgresql_setup.sh

# Enable Services
systemctl daemon-reload
systemctl enable blackbox-exporter.service
systemctl enable grafana-postgres.service
systemctl enable prometheus.service
systemctl enable speedtest-exporter.service
systemctl enable grafana.service

# Restart
shutdown -r 0