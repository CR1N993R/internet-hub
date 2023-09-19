#!/bin/bash

# Stop Services
systemctl stop blackbox-exporter.service
systemctl stop grafana-postgres.service
systemctl stop prometheus.service
systemctl stop speedtest-exporter.service

rm /etc/systemd/system/blackbox-exporter.service
rm /etc/systemd/system/grafana-postgres.service
rm /etc/systemd/system/prometheus.service
rm /etc/systemd/system/speedtest-exporter.service
systemctl daemon-reload

# Remove Blackbox Exporter
rm -rf /usr/share/blackbox_exporter-0.24.0.linux-arm64

# Remove Speedtest
rm /usr/bin/speedtest-exporter
apt purge speedtest

# Remove Grafana Postgres Service
rm -rf /usr/share/grafana-postgres-service

# Remove Prometheus
rm -rf /usr/share/prometheus-2.47.0.linux-arm64

# Remove Grafana
dpkg -r grafana

# Remove PiHole
pihole uninstall

# Remove Postgres
apt purge postgresql