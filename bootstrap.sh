echo "Provisioning..."
sudo apt-get update

sudo apt-get install -y npm nodejs-legacy uwsgi

echo "cd /vagrant/cobol" >> /home/vagrant/.bashrc
