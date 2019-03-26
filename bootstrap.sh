echo "Provisioning..."
sudo apt-get update

sudo apt-get install -y git uwsgi inotify-tools

echo "cd /vagrant" >> /home/vagrant/.bashrc
