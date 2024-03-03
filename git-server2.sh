echo "Run Script"

read -p "Enter repo name: " repo

if [ -d "/srv/git/$repo.git" ]; then
 echo "/srv/git/$repo does exit"
else

if  grep "^git:" "/etc/passwd" ; then
 echo "git user does exit"
else
 sudo adduser git
 sudo chown -R git:git /home/git/.ssh
 sudo mkdir /home/git/.ssh
 sudo touch /home/git/.ssh/authorized_keys
fi

if [ -d "/srv/git" ]; then
 echo "/srv/git does exit"
else
 sudo mkdir /srv/git
fi

 sudo mkdir /srv/git/$repo.git

 sudo git init --bare /srv/git/$repo.git

 sudo chown -R git:git /srv/git/$repo.git
fi
