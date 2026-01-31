#!/bin/bash

add_key () {
	KEY=$1
	USER=$2
	SSH_DIR="/home/${USER}/.ssh"
	AUTHORIZED_KEYS="${SSH_DIR}/authorized_keys"
	if [ ! -d ${SSH_DIR} ]; then
		mkdir -p ${SSH_DIR}
		chmod 700 ${SSH_DIR}
		chown "${USER}:${USER}" 
	fi
	cp ${KEY} ${SSH_DIR}
	chmod 600 ${SSH_DIR}
	chown "${USER}:${USER}" ${AUTHORIZED_KEYS}
}

if [ $(id -u) != 0 ]
then
    echo "Please elevate to sudo and try again."
    exit 1
fi

cd /home/blueteam/Cyber-Games

for user in $(./dynamic_files/scoring_users.txt); do
    add_key ./dynamic_files/scoring_key.pub $user
done

add_key ./dynamic_files/jacob.pub blueteam

systemctl enable ssh
systemctl enable sshd
systemctl restart ssh
systemctl restart sshd
