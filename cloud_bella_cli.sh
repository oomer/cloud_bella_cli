#!/bin/bash

user="root"
port="22"
systemd="1"
image="png"
render_sh="IyEvYmluL2Jhc2gKCm9zX25hbWU9JChhd2sgLUY9ICckMT09Ik5BTUUiIHsgcHJpbnQgJDIgO30nIC9ldGMvb3MtcmVsZWFzZSkKcmVkaGF0X3BsYXRmb3JtX2lkPSQoYXdrIC1GPSAnJDE9PSJQTEFURk9STV9JRCIgeyBwcmludCAkMiA7fScgL2V0Yy9vcy1yZWxlYXNlKQp1c2VyPSQod2hvYW1pKQplY2hvICR1c2VyCmlmICEgdGVzdCAtZiBiZWxsYV9jbGk7IHRoZW4KCWlmIFsgIiRyZWRoYXRfcGxhdGZvcm1faWQiID09ICJcInBsYXRmb3JtOmVsOFwiIiBdIHx8IFsgIiRyZWRoYXRfcGxhdGZvcm1faWQiID09ICJcInBsYXRmb3JtOmVsOVwiIiBdOyB0aGVuCgkJaWYgWyAke3VzZXJ9ID09ICJyb290IiBdOyB0aGVuCgkJCWRuZiAteSBpbnN0YWxsIG1lc2EtdnVsa2FuLWRyaXZlcnMKCQkJZG5mIC15IGluc3RhbGwgbWVzYS1saWJHTAoJCWVsc2UKCQkJc3VkbyBkbmYgLXkgaW5zdGFsbCBtZXNhLXZ1bGthbi1kcml2ZXJzCgkJCXN1ZG8gZG5mIC15IGluc3RhbGwgbWVzYS1saWJHTAoJCWZpCgllbHNlCgkJaWYgWyAke3VzZXJ9ID09ICJyb290IiBdOyB0aGVuCgkJCWFwdCAteSB1cGRhdGUKCQkJYXB0IC15IGluc3RhbGwgbWVzYS12dWxrYW4tZHJpdmVycwoJCQlhcHQgLXkgaW5zdGFsbCBsaWJsMS1tZXNhLWdseAoJCQkjYXB0IC15IGluc3RhbGwgbGlieDExLTYKCQllbHNlCgkJCXN1ZG8gYXB0IC15IHVwZGF0ZQoJCQlzdWRvIGFwdCAteSBpbnN0YWxsIG1lc2EtdnVsa2FuLWRyaXZlcnMKCQkJc3VkbyBhcHQgLXkgaW5zdGFsbCBsaWJnbDEtbWVzYS1nbHgKCQkJI3N1ZG8gYXB0IC15IGluc3RhbGwgbGlieDExLTYKCQlmaQoJZmkKCWlmIFsgLXogJHtCRUxMQV9WRVJTSU9OfSBdOyB0aGVuCgkJY3VybCAtTyBodHRwczovL2Rvd25sb2Fkcy5iZWxsYXJlbmRlci5jb20vYmVsbGFfY2xpLTIzLjYuMC50YXIuZ3oKCQl0YXIgLXh2ZiBiZWxsYV9jbGktMjMuNi4wLnRhci5negoJZWxzZQoJCWN1cmwgLU8gaHR0cHM6Ly9kb3dubG9hZHMuYmVsbGFyZW5kZXIuY29tL2JlbGxhX2NsaS0ke0JFTExBX1ZFUlNJT059LnRhci5negoJCXRhciAteHZmIGJlbGxhX2NsaS0ke0JFTExBX1ZFUlNJT059LnRhci5negoJZmkKZmkKCmJzel9maWxlcz1+LyouYnN6CgppZiAhIHRlc3QgLWYgImJlbGxhLmxvZyIgOyB0aGVuCglpZGxlPSIxIgplbHNlCglpc19pZGxlPSIkKHBncmVwIGJlbGxhX2NsaSkiCgoJaWYgWyAteiAke2lzX2lkbGV9IF07IHRoZW4KCQlpZGxlPSIxIgoJZWxzZQoJCWlkbGU9IjAiCglmaQpmaQoKaWYgISBbIC16ICR7QkVMTEFfUEFSU0VfRlJBR01FTlR9IF07IHRoZW4KCXBhcnNlRnJhZ21lbnQ9Ii1wZjoke0JFTExBX1BBUlNFX0ZSQUdNRU5UfSIKCWVjaG8gJHBhcnNlRnJhZ21lbnQKZWxzZQoJcGFyc2VGcmFnbWVudD0iIgpmaQoKCmlmIFsgJHtpZGxlfSA9PSAiMSIgXTsgdGhlbgoJZm9yIGVhY2ggaW4gJGJzel9maWxlcwoJZG8KCQllY2hvICJSZW5kZXJpbmcgc3RhcnRlZCBmb3I6ICRlYWNoIgoJCWVjaG8gLi9iZWxsYV9jbGkgLWk6IiRlYWNoIiAkcGFyc2VGcmFnbWVudCAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAKCQkuL2JlbGxhX2NsaSAtaToiJGVhY2giICRwYXJzZUZyYWdtZW50IC1wZjoic2V0dGluZ3MudGhyZWFkcz0wOyIgIC1vZDoiLi8iID4gYmVsbGEubG9nCgkJcm0gJHtlYWNofQoJZG9uZQpmaQo="

#echo ${render_sh} | base64 -d -i - > render.sh

pid_ssh_agent="$(pgrep ssh-agent)"
if ! [ -z $pid_ssh_agent ]; then
	echo "hello"
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
		select action in upload render progress download parseFragment server settings quit
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
			if [ ${user} == "root" ]; then
				ssh ${user}@${render_ip} -p ${port} "sed -i /'AcceptEnv LANG LC_*'/d /etc/ssh/sshd_config"
				ssh ${user}@${render_ip} -p ${port} "grep -qxF 'AcceptEnv BELLA_LICENSE_TEXT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_LICENSE_TEXT' >> /etc/ssh/sshd_config"
				ssh ${user}@${render_ip} -p ${port} "grep -qxF 'AcceptEnv BELLA_PARSE_FRAGMENT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_PARSE_FRAGMENT' >> /etc/ssh/sshd_config"
				ssh ${user}@${render_ip} -p ${port} "grep -qxF 'AcceptEnv BELLA_VERSION' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_VERSION' >> /etc/ssh/sshd_config"
				if [ ${systemd} == "1" ]; then
					ssh ${user}@${render_ip} -p ${port} "systemctl restart sshd"
				else
					ssh ${user}@${render_ip} -p ${port} "/etc/init.d/ssh restart"
				fi
			else
				ssh ${user}@${render_ip} -p ${port} "grep -qxF 'AcceptEnv BELLA_LICENSE_TEXT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_LICENSE_TEXT' | sudo tee -a /etc/ssh/sshd_config"
				ssh ${user}@${render_ip} -p ${port} "grep -qxF 'AcceptEnv BELLA_PARSE_FRAGMENT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_PARSE_FRAGMENT' | sudo tee -a /etc/ssh/sshd_config"
				ssh ${user}@${render_ip} -p ${port} "grep -qxF 'AcceptEnv BELLA_VERSION' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_VERSION' | sudo tee -a /etc/ssh/sshd_config"
				if [ ${systemd} == "1" ]; then
					ssh ${user}@${render_ip} -p ${port} "sudo systemctl restart sshd"
				else
					ssh ${user}@${render_ip} -p ${port} "sudo /etc/init.d/ssh restart"
				fi
			fi
			ssh ${user}@${render_ip} -p ${port} "echo ${render_sh} | base64 --decode > render.sh"
			ssh ${user}@${render_ip} -p ${port} bash render.sh &
		elif [[ $action == "server" ]]; then
			echo -e "\nCloud computer internet address"
			read -p "Enter: x.x.x.x:" render_ip

		elif [[ $action == "settings" ]]; then
			select setting in set_image set_port set_user systemd back
			do
				break
			done
			if ! [ ${setting} == "back" ];then
				if [[ $setting == "set_user" ]]; then
					echo -e "\nCloud username"
					read -p "Enter: (default root):" user
					if [ -z ${user} ]; then
						user="root"
					fi
				elif [[ $setting == "systemd" ]]; then
					echo -e "\nset to 0 for init.d"
					read -p "Enter systemd: (default 1):" systemd
					if [ -z ${systemd} ]; then
						systemd="1"
					fi
				elif [[ $setting == "set_image" ]]; then
					read -p "Enter image extension no period: (default png):" image
					if [ -z ${image} ]; then
						image="png"
					fi


				else 
					echo -e "\nCloud computer internet port"
					read -p "Enter: default(22):" port
					if [ -z ${port} ]; then
						port="22"
					fi
				fi
			fi
		elif [[ $action == "download" ]]; then
			scp -P ${port} ${user}@${render_ip}:./*.${image} ./
		else
			exit

		fi
	fi
done
