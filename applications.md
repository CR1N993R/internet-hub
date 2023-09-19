# Pihole

https://github.com/pi-hole/pi-hole/#one-step-automated-install
### Install
```bash
curl -sSL https://install.pi-hole.net | bash
```
### Update
```bash
pihole -up
```
### Uninstall
```bash
pihole uninstall
```

# Speedtest
https://www.speedtest.net/apps/cli
### Install
```bash
cp ./binaries/arm64/speedtest /usr/bin/
```
### Uninstall
```bash
rm /usr/bin/speedtest
```

# Speedtest Exporter
https://docs.miguelndecarvalho.pt/projects/speedtest-exporter/
### Install
```bash
cp ./binaries/arm64/speedtest_exporter /usr/bin/
```
### Uninstall
```bash
rm /usr/bin/speedtest_exporter
```

# Blackbox Exporter
https://github.com/prometheus/blackbox_exporter
### Install
```bash
cp ./binaries/arm64/blackbox_exporter /usr/bin/
```
### Uninstall
```bash
rm /usr/bin/blackbox_exporter
```

# Postgres
### Install
```bash
./postgresql_setup.sh
```
### Uninstall
```bash
apt purge postgresql
```

# Grafana
### Install
```bash
wget https://dl.grafana.com/oss/release/grafana-10.1.1.linux-arm64.tar.gz
tar -zxvf grafana-10.1.1.linux-amd64.tar.gz -C /usr/share/
```
### Uninstall
```bash
rm -rf /usr/share/grafana-10.1.1
```

# Prometheus
### Install
```bash
wget https://github.com/prometheus/prometheus/releases/download/v2.47.0/prometheus-2.47.0.linux-arm64.tar.gz
tar -zxvf prometheus-2.47.0.linux-amd64.tar.gz -C /usr/share/
```
### Uninstall
```bash
rm -rf /usr/share/prometheus-2.47.0.linux-arm64.tar.gz
```