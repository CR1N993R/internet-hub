#!/bin/bash

# Copy Systemd services
cp ./systemd/blackbox-exporter.service /etc/systemd/system/
cp ./systemd/speedtest-exporter.service /etc/systemd/system/

# Blackbox Exporter
mkdir /usr/share/blackbox-exporter
cp ./binaries/arm64/blackbox_exporter /usr/share/blackbox-exporter/
cp ./config/blackbox_exporter/blackbox.yml /usr/share/blackbox-exporter/

# Speedtest
cp ./binaries/arm64/speedtest /usr/bin/
cp ./binaries/arm64/speedtest-exporter /usr/bin/