wget https://github.com/prometheus/alertmanager/releases/download/v0.24.0/alertmanager-0.24.0.linux-amd64.tar.gz

tar xzf alertmanager-0.24.0.linux-amd64.tar.gz

rm alertmanager-0.24.0.linux-amd64.tar.gz

sudo useradd --no-create-home --shell /bin/false alertmanager

sudo mkdir /etc/alertmanager

sudo mv alertmanager-0.24.0.linux-amd64/alertmanager.yml /etc/alertmanager

sudo chown -R alertmanager:alertmanager /etc/alertmanager

sudo mkdir /var/lib/alertmanager

sudo chown -R alertmanager:alertmanager /var/lib/alertmanager

sudo cp alertmanager-0.24.0.linux-amd64/alertmanager /usr/local/bin

sudo cp alertmanager-0.24.0.linux-amd64/amtool /usr/local/bin

sudo chown alertmanager:alertmanager /usr/local/bin/alertmanager

sudo chown alertmanager:alertmanager /usr/local/bin/amtool

cp alertmanager.service /etc/systemd/system/

sudo systemctl daemon-reload

sudo systemctl start alertmanager

sudo systemctl enable alertmanager
