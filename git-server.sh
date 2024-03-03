sudo adduser git

sudo chown -R git:git /home/git/.ssh

sudo mkdir /home/git/.ssh

sudo touch /home/git/.ssh/authorized_keys

if [ -d "/srv/git" ]; then
 echo "/srv/git does exit"
else
 sudo mkdir /srv/git
fi

if [ -d "/srv/git/$repo.git" ]; then
 sudo rm -rf /srv/git/$repo.git
else
 sudo mkdir /srv/git/$repo.git
fi

sudo git init --bare /srv/git/$repo.git

sudo chown -R git:git /srv/git/$repo.git
