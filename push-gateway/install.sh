wget https://github.com/prometheus/pushgateway/releases/download/v1.5.0/pushgateway-1.5.0.linux-amd64.tar.gz

tar xvf pushgateway-1.5.0.linux-amd64.tar.gz

rm -rf pushgateway-1.5.0.linux-amd64.tar.gz

sudo useradd --no-create-home --shell /bin/false pushgateway

sudo cp pushgateway-1.5.0.linux-amd64/pushgateway /usr/local/bin

chown pushgateway:pushgateway /usr/local/bin/pushgateway

cp pushgateway.service /etc/systemd/system/pushgateway.service

sudo systemctl daemon-reload

sudo systemctl restart pushgateway

sudo systemctl enable pushgateway
