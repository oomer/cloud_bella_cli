#!/bin/bash

server_user="root"
server_port="22"
file_ext="png"
systemd="1"
bsa64=""
anim64=""


render_sh="IyEvYmluL2Jhc2gKb3NfbmFtZT0kKGF3ayAtRj0gJyQxPT0iTkFNRSIgeyBwcmludCAkMiA7fScgL2V0Yy9vcy1yZWxlYXNlKQpwbGF0Zm9ybV9pZD0kKGF3ayAtRj0gJyQxPT0iUExBVEZPUk1fSUQiIHsgcHJpbnQgJDIgO30nIC9ldGMvb3MtcmVsZWFzZSkKdXNlcj0kKHdob2FtaSkKCmlmICEgdGVzdCAtZiBiZWxsYV9jbGk7IHRoZW4KCSMgUkhFTCA4LnggYW5kIDkueCAKCWlmIFsgIiRwbGF0Zm9ybV9pZCIgPT0gIlwicGxhdGZvcm06ZWw4XCIiIF0gfHwgWyAiJHBsYXRmb3JtX2lkIiA9PSAiXCJwbGF0Zm9ybTplbDlcIiIgXTsgdGhlbgoJCWlmIFsgJHt1c2VyfSA9PSAicm9vdCIgXTsgdGhlbgoJCQlkbmYgLXkgaW5zdGFsbCBtZXNhLXZ1bGthbi1kcml2ZXJzCgkJCWRuZiAteSBpbnN0YWxsIG1lc2EtbGliR0wKCQllbHNlCgkJCXN1ZG8gZG5mIC15IGluc3RhbGwgbWVzYS12dWxrYW4tZHJpdmVycwoJCQlzdWRvIGRuZiAteSBpbnN0YWxsIG1lc2EtbGliR0wKCQlmaQoJIyAgRGViaWFuIGJhc2VkCgllbHNlCgkJaWYgWyAke3VzZXJ9ID09ICJyb290IiBdOyB0aGVuCgkJCWFwdCAteSB1cGRhdGUKCQkJYXB0IC15IGluc3RhbGwgbWVzYS12dWxrYW4tZHJpdmVycwoJCQlhcHQgLXkgaW5zdGFsbCBsaWJnbDEtbWVzYS1nbHgKCQllbHNlCgkJCXN1ZG8gYXB0IC15IHVwZGF0ZQoJCQlzdWRvIGFwdCAteSBpbnN0YWxsIG1lc2EtdnVsa2FuLWRyaXZlcnMKCQkJc3VkbyBhcHQgLXkgaW5zdGFsbCBsaWJnbDEtbWVzYS1nbHgKCQlmaQoJZmkKCWlmIFsgLXogJHtCRUxMQV9WRVJTSU9OfSBdOyB0aGVuCgkJY3VybCAtTyBodHRwczovL2Rvd25sb2Fkcy5iZWxsYXJlbmRlci5jb20vYmVsbGFfY2xpLTIzLjYuMC50YXIuZ3oKCQl0YXIgLXh2ZiBiZWxsYV9jbGktMjMuNi4wLnRhci5negoJZWxzZQoJCWN1cmwgLU8gaHR0cHM6Ly9kb3dubG9hZHMuYmVsbGFyZW5kZXIuY29tL2JlbGxhX2NsaS0ke0JFTExBX1ZFUlNJT059LnRhci5negoJCXRhciAteHZmIGJlbGxhX2NsaS0ke0JFTExBX1ZFUlNJT059LnRhci5negoJZmkKZmkKCmJzel9maWxlcz0qLmJzegoKaWYgISB0ZXN0IC1mICJiZWxsYS5sb2ciIDsgdGhlbgoJaWRsZT0iMSIKZWxzZQoJaXNfaWRsZT0iJChwZ3JlcCBiZWxsYV9jbGkpIgoKCWlmIFsgLXogJHtpc19pZGxlfSBdOyB0aGVuCgkJaWRsZT0iMSIKCWVsc2UKCQlpZGxlPSIwIgoJZmkKZmkKCgppZiBbICR7aWRsZX0gPT0gIjEiIF07IHRoZW4KCWZvciBlYWNoIGluICRic3pfZmlsZXMKCWRvCgkJcHJlZml4PSR7ZWFjaCUuKn0KCQllY2hvICJSZW5kZXJpbmcgc3RhcnRlZCBmb3I6ICRlYWNoIgoJCWlmIFsgIiR7QkVMTEFfUEFSU0VfRlJBR01FTlQ6LW51bGx9IiA9PSAibnVsbCIgXTsgdGhlbgoJCQlpZiB0ZXN0IC1mIGNsb3VkX2JlbGxhX2NsaS5hbmltOyB0aGVuCgkJCQlhbmltMXN0YXJ0bGluZT0kKHNlZCAnMSFkJyBjbG91ZF9iZWxsYV9jbGkuYW5pbSkKCQkJCWF0dHI9JHthbmltMXN0YXJ0bGluZSU9Kn0KCQkJCWFuaW0xc3RhcnQwPSR7YW5pbTFzdGFydGxpbmUjKj19CgkJCQlhbmltMXN0YXJ0PSR7YW5pbTFzdGFydDA6MDokeyNhbmltMXN0YXJ0MH0tMn0KCQkJCWFuaW0xZW5kbGluZT0kKHNlZCAnMiFkJyBjbG91ZF9iZWxsYV9jbGkuYW5pbSkKCQkJCWFuaW0xZW5kMD0ke2FuaW0xZW5kbGluZSMqPX0KCQkJCWFuaW0xZW5kPSR7YW5pbTFlbmQwOjA6JHsjYW5pbTFlbmQwfS0yfQoJCQkJZm9yICgoaSA9IDAgOyBpIDw9IDEwIDsgaSsrICkpOyBkbyAKCQkJCQlwYWRkZWQ9JChwcmludGYgIiUwNGQiICRpKQoJCQkJCWVjaG8gInNjYWxlPTU7ICgke2FuaW0xZW5kfS0ke2FuaW0xc3RhcnR9KSooJGkvMTAwLjApKyR7YW5pbTFzdGFydH0iIHwgYmMKCQkJCQllY2hvIC4vYmVsbGFfY2xpIC1pOiIkZWFjaCIgLW9uOiIke3ByZWZpeH0ke3BhZGRlZH0iIC1wZjoiLi9jbG91ZF9iZWxsYV9jbGkuYnNhIiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAgCgkJCQkJLi9iZWxsYV9jbGkgLWk6IiRlYWNoIiAtb246IiR7cHJlZml4fSR7cGFkZGVkfSIgLXBmOiIuL2Nsb3VkX2JlbGxhX2NsaS5ic2EiIC1wZjoic2V0dGluZ3MudGhyZWFkcz0wOyIgIC1vZDoiLi8iICA+IGJlbGxhLmxvZwoJCQkJZG9uZQoJCQllbGlmIHRlc3QgLWYgY2xvdWRfYmVsbGFfY2xpLmJzYTsgdGhlbgoJCQkJZWNobyAuL2JlbGxhX2NsaSAtaToiJGVhY2giIC1wZjoiLi9jbG91ZF9iZWxsYV9jbGkuYnNhIiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAgCgkJCQkuL2JlbGxhX2NsaSAtaToiJGVhY2giIC1wZjoiLi9jbG91ZF9iZWxsYV9jbGkuYnNhIiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAgPiBiZWxsYS5sb2cKCgkJCWVsc2UKCQkJCWVjaG8gLi9iZWxsYV9jbGkgLWk6IiRlYWNoIiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAgCgkJCQkuL2JlbGxhX2NsaSAtaToiJGVhY2giIC1wZjoic2V0dGluZ3MudGhyZWFkcz0wOyIgIC1vZDoiLi8iICA+IGJlbGxhLmxvZwoJCQlmaQoJCWVsc2UKCQkJaWYgdGVzdCAtZiBjbG91ZF9iZWxsYV9jbGkuYW5pbTsgdGhlbgoJCQkJYW5pbTFzdGFydGxpbmU9JChzZWQgJzEhZCcgY2xvdWRfYmVsbGFfY2xpLmFuaW0pCgkJCQlhdHRyPSR7YW5pbTFzdGFydGxpbmUlPSp9CgkJCQlhbmltMXN0YXJ0MD0ke2FuaW0xc3RhcnRsaW5lIyo9fQoJCQkJYW5pbTFzdGFydD0ke2FuaW0xc3RhcnQwOjA6JHsjYW5pbTFzdGFydDB9LTJ9CgkJCQlhbmltMWVuZGxpbmU9JChzZWQgJzIhZCcgY2xvdWRfYmVsbGFfY2xpLmFuaW0pCgkJCQlhbmltMWVuZDA9JHthbmltMWVuZGxpbmUjKj19CgkJCQlhbmltMWVuZD0ke2FuaW0xZW5kMDowOiR7I2FuaW0xZW5kMH0tMn0KCQkJCWZvciAoKGkgPSAwIDsgaSA8PSAxMCA7IGkrKyApKTsgZG8gCgkJCQkJcGFkZGVkPSQocHJpbnRmICIlMDRkIiAkaSkKCQkJCQllY2hvICJzY2FsZT01OyAoJHthbmltMWVuZH0tJHthbmltMXN0YXJ0fSkqKCRpLzEwMC4wKSske2FuaW0xc3RhcnR9IiB8IGJjCgkJCQkJZWNobyAuL2JlbGxhX2NsaSAtaToiJGVhY2giIC1vbjoiJHtwcmVmaXh9JHtwYWRkZWR9IiAtcGY6IiR7QkVMTEFfUEFSU0VfRlJBR01FTlR9IiAtcGY6Ii4vY2xvdWRfYmVsbGFfY2xpLmJzYSIgLXBmOiJzZXR0aW5ncy50aHJlYWRzPTA7IiAgLW9kOiIuLyIgCgkJCQkJLi9iZWxsYV9jbGkgLWk6IiRlYWNoIiAtb246IiR7cHJlZml4fSR7cGFkZGVkfSIgLXBmOiIke0JFTExBX1BBUlNFX0ZSQUdNRU5UfSIgLXBmOiIuL2Nsb3VkX2JlbGxhX2NsaS5ic2EiIC1wZjoic2V0dGluZ3MudGhyZWFkcz0wOyIgIC1vZDoiLi8iID4gYmVsbGEubG9nCgkJCQlkb25lCQoJCQllbGlmIHRlc3QgLWYgY2xvdWRfYmVsbGFfY2xpLmJzYTsgdGhlbgoJCQkJZWNobyAuL2JlbGxhX2NsaSAtaToiJGVhY2giIC1wZjoiJHtCRUxMQV9QQVJTRV9GUkFHTUVOVH0iIC1wZjoiLi9jbG91ZF9iZWxsYV9jbGkuYnNhIiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAKCQkJCS4vYmVsbGFfY2xpIC1pOiIkZWFjaCIgLXBmOiIke0JFTExBX1BBUlNFX0ZSQUdNRU5UfSIgLXBmOiIuL2Nsb3VkX2JlbGxhX2NsaS5ic2EiIC1wZjoic2V0dGluZ3MudGhyZWFkcz0wOyIgIC1vZDoiLi8iID4gYmVsbGEubG9nCgkJCWVsc2UKCQkJCWVjaG8gLi9iZWxsYV9jbGkgLWk6IiRlYWNoIiAtcGY6IiR7QkVMTEFfUEFSU0VfRlJBR01FTlR9IiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAKCQkJCS4vYmVsbGFfY2xpIC1pOiIkZWFjaCIgLXBmOiIke0JFTExBX1BBUlNFX0ZSQUdNRU5UfSIgLXBmOiJzZXR0aW5ncy50aHJlYWRzPTA7IiAgLW9kOiIuLyIgPiBiZWxsYS5sb2cKCQkJZmkKCQlmaQoJCXJtICR7ZWFjaH0KCWRvbmUKZmkK"

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
					if test -f "${prefix}.bsa"; then
						echo -e "\nAnim mode activated with .bsa and .anim:"
						echo -e "\n"
						echo "${prefix}.bsa"
						cat ${prefix}.bsa
						echo -e "\n$anim"
						cat $anim
						bsa64="$(cat ${prefix}.bsa | base64 -i - )"
						anim64="$(cat ${anim} | base64 -i - )"
					else
						echo -e "\nA corresponding ${prefix}.bsa not found, anim mode skipped:"
						anim64=""
						break
					fi
					
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
