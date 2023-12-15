#!/bin/bash

user="root"
port="22"

render_sh="IyEvYmluL2Jhc2gKCm9zX25hbWU9JChhd2sgLUY9ICckMT09Ik5BTUUiIHsgcHJpbnQgJDIgO30nIC9ldGMvb3MtcmVsZWFzZSkKcmVkaGF0X3BsYXRmb3JtX2lkPSQoYXdrIC1GPSAnJDE9PSJQTEFURk9STV9JRCIgeyBwcmludCAkMiA7fScgL2V0Yy9vcy1yZWxlYXNlKQp1c2VyPXdob2FtaQplY2hvICR1c2VyCmlmICEgdGVzdCAtZiBiZWxsYV9jbGk7IHRoZW4KCWlmIFsgIiRyZWRoYXRfcGxhdGZvcm1faWQiID09ICJcInBsYXRmb3JtOmVsOFwiIiBdIHx8IFsgIiRyZWRoYXRfcGxhdGZvcm1faWQiID09ICJcInBsYXRmb3JtOmVsOVwiIiBdOyB0aGVuCgkJaWYgWyAke3VzZXJ9ID09ICJyb290IiBdOyB0aGVuCgkJCWRuZiAteSBpbnN0YWxsIG1lc2EtdnVsa2FuLWRyaXZlcnMKCQkJZG5mIC15IGluc3RhbGwgbWVzYS1saWJHTAoJCWVsc2UKCQkJc3VkbyBkbmYgLXkgaW5zdGFsbCBtZXNhLXZ1bGthbi1kcml2ZXJzCgkJCXN1ZG8gZG5mIC15IGluc3RhbGwgbWVzYS1saWJHTAoJCWZpCgllbHNlCgkJaWYgWyAke3VzZXJ9ID09ICJyb290IiBdOyB0aGVuCgkJCWFwdCAteSB1cGRhdGUKCQkJYXB0IC15IGluc3RhbGwgbWVzYS12dWxrYW4tZHJpdmVycwoJCQlhcHQgLXkgaW5zdGFsbCBsaWJsMS1tZXNhLWdseAoJCQkjYXB0IC15IGluc3RhbGwgbGlieDExLTYKCQllbHNlCgkJCXN1ZG8gYXB0IC15IHVwZGF0ZQoJCQlzdWRvIGFwdCAteSBpbnN0YWxsIG1lc2EtdnVsa2FuLWRyaXZlcnMKCQkJc3VkbyBhcHQgLXkgaW5zdGFsbCBsaWJnbDEtbWVzYS1nbHgKCQkJI3N1ZG8gYXB0IC15IGluc3RhbGwgbGlieDExLTYKCQlmaQoJZmkKCWN1cmwgLU8gaHR0cHM6Ly9kb3dubG9hZHMuYmVsbGFyZW5kZXIuY29tL2JlbGxhX2NsaS0yMy42LjAudGFyLmd6Cgl0YXIgLXh2ZiBiZWxsYV9jbGktMjMuNi4wLnRhci5negpmaQoKYnN6X2ZpbGVzPX4vKi5ic3oKCmlmICEgdGVzdCAtZiAiYmVsbGEubG9nIiA7IHRoZW4KCWlkbGU9IjEiCmVsc2UKCWlzX2lkbGU9IiQocGdyZXAgYmVsbGFfY2xpKSIKCglpZiBbIC16ICR7aXNfaWRsZX0gXTsgdGhlbgoJCWlkbGU9IjEiCgllbHNlCgkJaWRsZT0iMCIKCWZpCmZpCgoKaWYgWyAke2lkbGV9ID09ICIxIiBdOyB0aGVuCglmb3IgZWFjaCBpbiAkYnN6X2ZpbGVzCglkbwoJCWVjaG8gIlJlbmRlcmluZyBzdGFydGVkIGZvcjogJGVhY2giCgkJLi9iZWxsYV9jbGkgLWk6IiRlYWNoIiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiA+IGJlbGxhLmxvZwoJCXJtICR7ZWFjaH0KCWRvbmUKZmkK"

#echo ${render_sh} | base64 -d -i -

pid_ssh_agent="$(pgrep ssh-agent)"
if ! [ -z $pid_ssh_agent ]; then
	kill $pid_ssh_agent
fi

# cache ssh credentials
if [ $(ps ax | grep ssh-agent | wc -l) -gt 1 ] ; then
    echo "ssh-agent is already running"
else
    eval $(ssh-agent -s)
    if [ "$(ssh-add -l)" == "The agent has no identities." ] ; then
        ssh-add ~/.ssh/id_ed25519
    fi
    trap "ssh-agent -k" exit
fi

while :
do
	if [ -z $render_ip ]; then 
		echo -e "\nCloud computer internet address"
		read -p "Enter: x.x.x.x:" render_ip
	else
		echo -e "\n================================================="	
		select action in upload render progress download set_user set_ip set_port quit
		do
			break
		done

		if [[ $action == "upload" ]]; then
			list_bsz="$(ls *.bsz 2>&1)"
			echo ${list_bsz}
			select bsz in ${list_bsz} back
			do
				break
			done
			if ! [ ${bsz} == "back" ];then
				echo scp -P ${port} ${bsz} ${user}@${render_ip}:~ 
				scp -P ${port} ${bsz} ${user}@${render_ip}:~ 
			fi
		elif [[ $action == "progress" ]]; then
			ssh ${user}@${render_ip} -p ${port} tail bella.log
		elif [[ $action == "render" ]]; then
			ssh ${user}@${render_ip} -p ${port} "grep -qxF 'AcceptEnv BELLA_LICENSE_TEXT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_LICENSE_TEXT' >> /etc/ssh/sshd_config"
			ssh ${user}@${render_ip} -p ${port} "systemctl restart sshd"
			ssh ${user}@${render_ip} -p ${port} "echo ${render_sh} | base64 --decode > render.sh"
			ssh ${user}@${render_ip} -p ${port} bash render.sh &
		elif [[ $action == "set_user" ]]; then
			echo -e "\nCloud username"
			read -p "Enter: (default root):" user
			if [ -z ${user} ]; then
				user="root"
			fi
		elif [[ $action == "set_ip" ]]; then
			echo -e "\nCloud computer internet address"
			read -p "Enter: x.x.x.x:" render_ip
		elif [[ $action == "set_port" ]]; then
			echo -e "\nCloud computer internet port"
			read -p "Enter: default(22):" port
			if [ -z ${port} ]; then
				port="22"
			fi
		elif [[ $action == "download" ]]; then
			scp -P ${port} ${user}@${render_ip}:./*.png ./
		else
			exit

		fi
	fi
done
