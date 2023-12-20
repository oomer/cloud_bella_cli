#!/bin/bash

server_user="root"
server_port="22"
file_ext="png"
systemd="1"
bsa64=""
anim64=""

render_sh="IyEvYmluL2Jhc2gKb3NfbmFtZT0kKGF3ayAtRj0gJyQxPT0iTkFNRSIgeyBwcmludCAkMiA7fScgL2V0Yy9vcy1yZWxlYXNlKQpwbGF0Zm9ybV9pZD0kKGF3ayAtRj0gJyQxPT0iUExBVEZPUk1fSUQiIHsgcHJpbnQgJDIgO30nIC9ldGMvb3MtcmVsZWFzZSkKdXNlcj0kKHdob2FtaSkKCmlmICEgdGVzdCAtZiBiZWxsYV9jbGk7IHRoZW4KCSMgUkhFTCA4LnggYW5kIDkueCAKCWlmIFsgIiRwbGF0Zm9ybV9pZCIgPT0gIlwicGxhdGZvcm06ZWw4XCIiIF0gfHwgWyAiJHBsYXRmb3JtX2lkIiA9PSAiXCJwbGF0Zm9ybTplbDlcIiIgXTsgdGhlbgoJCWlmIFsgJHt1c2VyfSA9PSAicm9vdCIgXTsgdGhlbgoJCQlkbmYgLXkgaW5zdGFsbCBtZXNhLXZ1bGthbi1kcml2ZXJzCgkJCWRuZiAteSBpbnN0YWxsIG1lc2EtbGliR0wKCQkJZG5mIC15IGluc3RhbGwgYmMKCQllbHNlCgkJCXN1ZG8gZG5mIC15IGluc3RhbGwgbWVzYS12dWxrYW4tZHJpdmVycwoJCQlzdWRvIGRuZiAteSBpbnN0YWxsIG1lc2EtbGliR0wKCQkJc3VkbyBkbmYgLXkgaW5zdGFsbCBiYwoJCWZpCgkjICBEZWJpYW4gYmFzZWQKCWVsc2UKCQlpZiBbICR7dXNlcn0gPT0gInJvb3QiIF07IHRoZW4KCQkJYXB0IC15IHVwZGF0ZQoJCQlhcHQgLXkgaW5zdGFsbCBtZXNhLXZ1bGthbi1kcml2ZXJzCgkJCWFwdCAteSBpbnN0YWxsIGxpYmdsMS1tZXNhLWdseAoJCQlhcHQgLXkgaW5zdGFsbCBiYwoJCWVsc2UKCQkJc3VkbyBhcHQgLXkgdXBkYXRlCgkJCXN1ZG8gYXB0IC15IGluc3RhbGwgbWVzYS12dWxrYW4tZHJpdmVycwoJCQlzdWRvIGFwdCAteSBpbnN0YWxsIGxpYmdsMS1tZXNhLWdseAoJCQlzdWRvIGFwdCAteSBpbnN0YWxsIGJjCgkJZmkKCWZpCglpZiBbIC16ICR7QkVMTEFfVkVSU0lPTn0gXTsgdGhlbgoJCWN1cmwgLU8gaHR0cHM6Ly9kb3dubG9hZHMuYmVsbGFyZW5kZXIuY29tL2JlbGxhX2NsaS0yMy42LjAudGFyLmd6CgkJdGFyIC14dmYgYmVsbGFfY2xpLTIzLjYuMC50YXIuZ3oKCWVsc2UKCQljdXJsIC1PIGh0dHBzOi8vZG93bmxvYWRzLmJlbGxhcmVuZGVyLmNvbS9iZWxsYV9jbGktJHtCRUxMQV9WRVJTSU9OfS50YXIuZ3oKCQl0YXIgLXh2ZiBiZWxsYV9jbGktJHtCRUxMQV9WRVJTSU9OfS50YXIuZ3oKCWZpCmZpCgpic3pfZmlsZXM9Ki5ic3oKCmlmICEgdGVzdCAtZiAiYmVsbGEubG9nIiA7IHRoZW4KCWlkbGU9IjEiCmVsc2UKCWlzX2lkbGU9IiQocGdyZXAgYmVsbGFfY2xpKSIKCglpZiBbIC16ICR7aXNfaWRsZX0gXTsgdGhlbgoJCWlkbGU9IjEiCgllbHNlCgkJaWRsZT0iMCIKCWZpCmZpCgoKaWYgWyAke2lkbGV9ID09ICIxIiBdOyB0aGVuCglmb3IgZWFjaCBpbiAkYnN6X2ZpbGVzCglkbwoJCXByZWZpeD0ke2VhY2glLip9CgkJZWNobyAiUmVuZGVyaW5nIHN0YXJ0ZWQgZm9yOiAkZWFjaCIKCQlpZiBbICIke0JFTExBX1BBUlNFX0ZSQUdNRU5UOi1udWxsfSIgPT0gIm51bGwiIF07IHRoZW4KCQkJaWYgdGVzdCAtZiBjbG91ZF9iZWxsYV9jbGkuYW5pbTsgdGhlbgoJCQkJYW5pbTFzdGFydGxpbmU9JChzZWQgJzEhZCcgY2xvdWRfYmVsbGFfY2xpLmFuaW0pCgkJCQlhdHRyPSR7YW5pbTFzdGFydGxpbmUlPSp9CgkJCQlhbmltMXN0YXJ0MD0ke2FuaW0xc3RhcnRsaW5lIyo9fQoJCQkJYW5pbTFzdGFydD0ke2FuaW0xc3RhcnQwOjA6JHsjYW5pbTFzdGFydDB9LTJ9CgkJCQlhbmltMWVuZGxpbmU9JChzZWQgJzIhZCcgY2xvdWRfYmVsbGFfY2xpLmFuaW0pCgkJCQlhbmltMWVuZDA9JHthbmltMWVuZGxpbmUjKj19CgkJCQlhbmltMWVuZD0ke2FuaW0xZW5kMDowOiR7I2FuaW0xZW5kMH0tMn0KCQkJCWZyYW1lcz0kKHNlZCAnMyFkJyBjbG91ZF9iZWxsYV9jbGkuYW5pbSkKCQkJCWZvciAoKGkgPSAwIDsgaSA8PSAkZnJhbWVzIDsgaSsrICkpOyBkbyAKCQkJCQlwYWRkZWQ9JChwcmludGYgIiUwNGQiICRpKQoJCQkJCWFuaW1hdGVkPSQoZWNobyAic2NhbGU9NTsgKCgke2FuaW0xZW5kfS0oJHthbmltMXN0YXJ0fSkpKigkaS8ke2ZyYW1lc30uMCkpKyR7YW5pbTFzdGFydH0iIHwgYmMpCgkJCQkJZWNobyAic2NhbGU9NTsgKCR7YW5pbTFlbmR9LSgke2FuaW0xc3RhcnR9KSkqKCRpLyRmcmFtZXMpKyR7YW5pbTFzdGFydH0iIHwgYmMKCQkJCQllY2hvIC4vYmVsbGFfY2xpIC1pOiIkZWFjaCIgLW9uOiIke3ByZWZpeH0ke3BhZGRlZH0iIC1wZjoiJHthdHRyfT0ke2FuaW1hdGVkfWY7IiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAgCgkJCQkJLi9iZWxsYV9jbGkgLWk6IiRlYWNoIiAtb246IiR7cHJlZml4fSR7cGFkZGVkfSIgLXBmOiIke2F0dHJ9PSR7YW5pbWF0ZWR9ZjsiIC1wZjoic2V0dGluZ3MudGhyZWFkcz0wOyIgIC1vZDoiLi8iICA+IGJlbGxhLmxvZwoJCQkJZG9uZQoJCQllbGlmIHRlc3QgLWYgY2xvdWRfYmVsbGFfY2xpLmJzYTsgdGhlbgoJCQkJZWNobyAuL2JlbGxhX2NsaSAtaToiJGVhY2giIC1wZjoiLi9jbG91ZF9iZWxsYV9jbGkuYnNhIiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAgCgkJCQkuL2JlbGxhX2NsaSAtaToiJGVhY2giIC1wZjoiLi9jbG91ZF9iZWxsYV9jbGkuYnNhIiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAgPiBiZWxsYS5sb2cKCgkJCWVsc2UKCQkJCWVjaG8gLi9iZWxsYV9jbGkgLWk6IiRlYWNoIiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAgCgkJCQkuL2JlbGxhX2NsaSAtaToiJGVhY2giIC1wZjoic2V0dGluZ3MudGhyZWFkcz0wOyIgIC1vZDoiLi8iICA+IGJlbGxhLmxvZwoJCQlmaQoJCWVsc2UKCQkJaWYgdGVzdCAtZiBjbG91ZF9iZWxsYV9jbGkuYW5pbTsgdGhlbgoJCQkJYW5pbTFzdGFydGxpbmU9JChzZWQgJzEhZCcgY2xvdWRfYmVsbGFfY2xpLmFuaW0pCgkJCQlhdHRyPSR7YW5pbTFzdGFydGxpbmUlPSp9CgkJCQlhbmltMXN0YXJ0MD0ke2FuaW0xc3RhcnRsaW5lIyo9fQoJCQkJYW5pbTFzdGFydD0ke2FuaW0xc3RhcnQwOjA6JHsjYW5pbTFzdGFydDB9LTJ9CgkJCQlhbmltMWVuZGxpbmU9JChzZWQgJzIhZCcgY2xvdWRfYmVsbGFfY2xpLmFuaW0pCgkJCQlhbmltMWVuZDA9JHthbmltMWVuZGxpbmUjKj19CgkJCQlhbmltMWVuZD0ke2FuaW0xZW5kMDowOiR7I2FuaW0xZW5kMH0tMn0KCQkJCWZyYW1lcz0kKHNlZCAnMyFkJyBjbG91ZF9iZWxsYV9jbGkuYW5pbSkKCQkJCWZvciAoKGkgPSAwIDsgaSA8PSAke2ZyYW1lc30gOyBpKysgKSk7IGRvIAoJCQkJCXBhZGRlZD0kKHByaW50ZiAiJTA0ZCIgJGkpCgkJCQkJZWNobyAic2NhbGU9NTsgKCR7YW5pbTFlbmR9LSgke2FuaW0xc3RhcnR9KSkqKCR7aX0vJHtmcmFtZXN9LjApKyR7YW5pbTFzdGFydH0iIHwgYmMKCQkJCQlhbmltYXRlZD0kKGVjaG8gInNjYWxlPTU7ICgoJHthbmltMWVuZH0tKCR7YW5pbTFzdGFydH0pKSooJHtpfS8ke2ZyYW1lc30uMCkpKyR7YW5pbTFzdGFydH0iIHwgYmMpCgkJCQkJZWNobyAuL2JlbGxhX2NsaSAtaToiJGVhY2giIC1vbjoiJHtwcmVmaXh9JHtwYWRkZWR9IiAtcGY6IiR7QkVMTEFfUEFSU0VfRlJBR01FTlR9IiAtcGY6IiR7YXR0cn09JHthbmltYXRlZH1mOyIgLXBmOiJzZXR0aW5ncy50aHJlYWRzPTA7IiAgLW9kOiIuLyIgCgkJCQkJLi9iZWxsYV9jbGkgLWk6IiRlYWNoIiAtb246IiR7cHJlZml4fSR7cGFkZGVkfSIgLXBmOiIke0JFTExBX1BBUlNFX0ZSQUdNRU5UfSIgLXBmOiIke2F0dHJ9PSR7YW5pbWF0ZWR9ZjsiIC1wZjoic2V0dGluZ3MudGhyZWFkcz0wOyIgIC1vZDoiLi8iID4gYmVsbGEubG9nCgkJCQlkb25lCQoJCQllbGlmIHRlc3QgLWYgY2xvdWRfYmVsbGFfY2xpLmJzYTsgdGhlbgoJCQkJZWNobyAuL2JlbGxhX2NsaSAtaToiJGVhY2giIC1wZjoiJHtCRUxMQV9QQVJTRV9GUkFHTUVOVH0iIC1wZjoiLi9jbG91ZF9iZWxsYV9jbGkuYnNhIiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAKCQkJCS4vYmVsbGFfY2xpIC1pOiIkZWFjaCIgLXBmOiIke0JFTExBX1BBUlNFX0ZSQUdNRU5UfSIgLXBmOiIuL2Nsb3VkX2JlbGxhX2NsaS5ic2EiIC1wZjoic2V0dGluZ3MudGhyZWFkcz0wOyIgIC1vZDoiLi8iID4gYmVsbGEubG9nCgkJCWVsc2UKCQkJCWVjaG8gLi9iZWxsYV9jbGkgLWk6IiRlYWNoIiAtcGY6IiR7QkVMTEFfUEFSU0VfRlJBR01FTlR9IiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAKCQkJCS4vYmVsbGFfY2xpIC1pOiIkZWFjaCIgLXBmOiIke0JFTExBX1BBUlNFX0ZSQUdNRU5UfSIgLXBmOiJzZXR0aW5ncy50aHJlYWRzPTA7IiAgLW9kOiIuLyIgPiBiZWxsYS5sb2cKCQkJZmkKCQlmaQoJCXJtICR7ZWFjaH0KCWRvbmUKZmkK"

#echo ${render_sh} | base64 -d -i - > render.sh

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
	if [ -z ${server_ip} ]; then 
		while :
		do
			echo -e "\nLinux server internet address"
			read -p "Enter x.x.x.x:" server_ip
			if ! [ -z ${server_ip} ]; then
				break
			fi
		done
		
	else
		echo -e "\n================================================="	
		select action in upload render progress download advanced server settings quit
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
				echo "Uploading ${bsz}..."
				scp -P ${server_port} ${bsz} ${server_user}@${server_ip}:~ 
			fi
		elif [[ $action == "progress" ]]; then
			ssh ${server_user}@${server_ip} -p ${server_port} tail bella.log
		elif [[ $action == "render" ]]; then
			if [ ${server_user} == "root" ]; then
				ssh ${server_user}@${server_ip} -p ${server_port} "sed -i /'AcceptEnv LANG LC_*'/d /etc/ssh/sshd_config"
				ssh ${server_user}@${server_ip} -p ${server_port} "grep -qxF 'AcceptEnv BELLA_LICENSE_TEXT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_LICENSE_TEXT' >> /etc/ssh/sshd_config"
				ssh ${server_user}@${server_ip} -p ${server_port} "grep -qxF 'AcceptEnv BELLA_PARSE_FRAGMENT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_PARSE_FRAGMENT' >> /etc/ssh/sshd_config"
				ssh ${server_user}@${server_ip} -p ${server_port} "grep -qxF 'AcceptEnv BELLA_VERSION' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_VERSION' >> /etc/ssh/sshd_config"
				if [ ${systemd} == "1" ]; then
					ssh ${server_user}@${server_ip} -p ${server_port} "systemctl restart sshd"
				else
					ssh ${server_user}@${server_ip} -p ${server_port} "/etc/init.d/ssh restart"
				fi
			else
				ssh ${server_user}@${server_ip} -p ${server_port} "grep -qxF 'AcceptEnv BELLA_LICENSE_TEXT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_LICENSE_TEXT' | sudo tee -a /etc/ssh/sshd_config"
				ssh ${server_user}@${server_ip} -p ${server_port} "grep -qxF 'AcceptEnv BELLA_PARSE_FRAGMENT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_PARSE_FRAGMENT' | sudo tee -a /etc/ssh/sshd_config"
				ssh ${server_user}@${server_ip} -p ${server_port} "grep -qxF 'AcceptEnv BELLA_VERSION' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_VERSION' | sudo tee -a /etc/ssh/sshd_config"
				if [ ${systemd} == "1" ]; then
					ssh ${server_user}@${server_ip} -p ${server_port} "sudo systemctl restart sshd"
				else
					ssh ${server_user}@${server_ip} -p ${server_port} "sudo /etc/init.d/ssh restart"
				fi
			fi
			if [ -z ${bsa64} ]; then
				ssh ${server_user}@${server_ip} -p ${server_port} "rm -f cloud_bella_cli.bsa"
			else
				ssh ${server_user}@${server_ip} -p ${server_port} "echo ${bsa64} | base64 --decode > cloud_bella_cli.bsa"
			fi
			if [ -z ${anim64} ]; then
				ssh ${server_user}@${server_ip} -p ${server_port} "rm -f cloud_bella_cli.anim"
			else
				ssh ${server_user}@${server_ip} -p ${server_port} "echo ${anim64} | base64 --decode > cloud_bella_cli.anim"
			fi


			ssh ${server_user}@${server_ip} -p ${server_port} "echo ${render_sh} | base64 --decode > render.sh"
			ssh ${server_user}@${server_ip} -p ${server_port} "echo ${pf64} | base64 --decode > pf.txt"
			ssh ${server_user}@${server_ip} -p ${server_port} bash render.sh &
		elif [[ $action == "server" ]]; then
			select setting in set_server set_port set_user systemd delete_files delete_bella_cli stop_bella back
			do
				break
			done
			if ! [ ${setting} == "back" ];then
				if [[ $setting == "set_server" ]]; then
					echo -e "\nLinux server internet address"
					current=${server_ip}
					read -p "Enter: ${current}:" server_ip
					if [ -z ${server_ip} ]; then
						server_ip=${current}
					fi
				elif [[ $setting == "delete_files" ]]; then
					echo -e "\nDeleting *${file_ext}"
					ssh ${server_user}@${server_ip} -p ${server_port} "rm -f *.${file_ext}"
				elif [[ $setting == "delete_bella_cli" ]]; then
					echo -e "\nDeleting bella_cli"
					ssh ${server_user}@${server_ip} -p ${server_port} "rm -f bella_cli"
				elif [[ $setting == "stop_bella" ]]; then
					echo -e "\nStopping bella_cli"
					ssh ${server_user}@${server_ip} -p ${server_port} "pkill -2 -e bella_cli"
				elif [[ $setting == "set_user" ]]; then
					echo -e "\nLinux username"
					current=${server_user}
					read -p "Enter: (current: ${current}):" server_user
					if [ -z ${server_user} ]; then
						server_user=${current}
					fi
				elif [[ $setting == "systemd" ]]; then
					echo -e "\nset to 0 for init.d"
					read -p "Enter systemd: (default 1):" systemd
					if [ -z ${systemd} ]; then
						systemd="1"
					fi
				elif [[ $setting == "set_port" ]]; then
					echo -e "\nLinux server internet port"
					current=${server_port}
					read -p "Enter: default(${current}):" server_port
					if [ -z ${server_port} ]; then
						server_port="${current}"
					fi
				fi
			fi
		elif [[ $action == "settings" ]]; then
			select setting in download_extension back
			do
				break
			done
			if ! [ ${setting} == "back" ];then
				if [[ $setting == "download_extension" ]]; then
					read -p "Enter download extension no period: (default png):" download_ext
					if [ -z ${download_ext} ]; then
						download_ext="png"
					fi
				fi
			fi
		elif [[ $action == "download" ]]; then
			echo "Downloading *.${file_ext}"
			scp -P ${server_port} ${server_user}@${server_ip}:./*.${file_ext} ./

		elif [[ $action == "advanced" ]]; then
			select advanced in bsa anim cleanup_server back
			do
				break
			done
			if [[ $advanced == "bsa" ]]; then
				list_bsa="$(ls *.bsa 2>&1)"
				select bsa in ${list_bsa} skip
				do
					break
				done
				if ! [ ${bsa} == "skip" ];then
					echo "new render will include -pf:\"./${bsa}\""
					cat $bsa
					bsa64="$(cat ${bsa} | base64 -i - )"
				else
					bsa64=""
				fi
			elif [[ $advanced == "anim" ]]; then
				list_anim="$(ls *.anim 2>&1)"
				select anim in ${list_anim} disable_anim
				do
					break
				done
				if [ ${anim} == "disable_anim" ];then
					anim64=""
				else
					prefix=${anim%.*}
					echo -e "\nAnim mode activated with .bsa and .anim:"
					echo -e "\n"
					echo "${prefix}.bsa"
					cat ${prefix}.bsa
					echo -e "\n$anim"
					cat $anim
					bsa64="$(cat ${prefix}.bsa | base64 -i - )"
					anim64="$(cat ${anim} | base64 -i - )"
				fi

			elif [ $advanced == "clear_server" ];then
				echo -e "\nDeleting *.bsa"
				ssh ${server_user}@${server_ip} -p ${server_port} "rm -f *.bsa; rm -f *.anim"
			fi
		else
			exit

		fi
	fi
done
