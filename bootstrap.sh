echo "Provisioning..."
sudo apt-get update

sudo apt-get install -y apache2 npm nodejs-legacy

cd /var/www/html
sudo ln -s /vagrant/www www
#todo-app
sudo ln -s /vagrant/www/todo/index.html todo

#enable CGI
cd /etc/apache2/mods-enabled
sudo ln -s ../mods-available/cgi.load

cd /etc/apache2/conf-available
sudo rm serve-cgi-bin.conf
sudo ln -s /vagrant/apache/config/serve-cgi-bin.conf serve-cgi-bin.conf
cd /usr/lib/cgi-bin/

#set symlinks to executable cobol pgms
sudo ln -s /vagrant/todoliste/target/TODOHANDLER todohandler

touch todolist.txt
sudo chmod 0777 todolist.txt
sudo chown www-data:www-data todolist.txt
chmod 0744 todolist.txt

sudo service apache2 start


echo "cd /vagrant/cobol" >> /home/vagrant/.bashrc
