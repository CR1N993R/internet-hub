#!/bin/bash

# Copy Systemd services
cp ./systemd/* /etc/systemd/system/

# Blackbox Exporter
wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.24.0/blackbox_exporter-0.24.0.linux-arm64.tar.gz
mkdir /usr/share/blackbox-exporter
tar -zxvf blackbox_exporter-0.24.0.linux-arm64.tar.gz -C /usr/share/
cp ./config/blackbox_exporter/blackbox.yml /usr/share/blackbox-exporter/

# Speedtest
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash
apt install speedtest
chmod +x binaries/speedtest_exporter
cp ./binaries/speedtest-exporter /usr/bin/

# Grafana Postrges Service
mkdir /usr/share/grafana-postgres-service
chmod +x binaries/grafana_postgres_service
cp ./binaries/grafana_postgres_service /usr/share/grafana-postgres-service/
cp ./config/grafana_postgres_service/.env /usr/share/grafana-postgres-service/

# Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.47.0/prometheus-2.47.0.linux-arm64.tar.gz
tar -zxvf prometheus-2.47.0.linux-amd64.tar.gz -C /usr/share/
cp ./config/prometheus/* /usr/share/prometheus-2.47.0.linux-arm64/

# Grafana
apt install -y adduser libfontconfig1 musl
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_10.1.2_arm64.deb
dpkg -i grafana-enterprise_10.1.2_arm64.deb

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