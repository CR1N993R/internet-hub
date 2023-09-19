#!/bin/bash

# Update the system
sudo apt update

# Install PostgreSQL
sudo apt install -y postgresql

# Change the PostgreSQL password for the 'postgres' user
sudo -u postgres psql -c "ALTER USER postgres PASSWORD KH4?CKCSGTsKxSxy;"

# Edit PostgreSQL configuration
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/*/main/postgresql.conf

# Edit pg_hba.conf to allow connections from all IP addresses
echo "host    all             postgres        0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/*/main/pg_hba.conf

# Restart PostgreSQL
sudo service postgresql restart
