#!/bin/bash

server_user="root"
server_port="22"
image_ext="png"
systemd="1"
bsa64=""
anim64=""
#cat render.sh | base64
render_sh="IyEvYmluL2Jhc2gKb3NfbmFtZT0kKGF3ayAtRj0gJyQxPT0iTkFNRSIgeyBwcmludCAkMiA7fScgL2V0Yy9vcy1yZWxlYXNlKQpwbGF0Zm9ybV9pZD0kKGF3ayAtRj0gJyQxPT0iUExBVEZPUk1fSUQiIHsgcHJpbnQgJDIgO30nIC9ldGMvb3MtcmVsZWFzZSkKdXNlcj0kKHdob2FtaSkKCmlmICEgdGVzdCAtZiBiZWxsYV9jbGk7IHRoZW4KCSMgUkhFTCA4LnggYW5kIDkueCAKCWlmIFsgIiRwbGF0Zm9ybV9pZCIgPT0gIlwicGxhdGZvcm06ZWw4XCIiIF0gfHwgWyAiJHBsYXRmb3JtX2lkIiA9PSAiXCJwbGF0Zm9ybTplbDlcIiIgXTsgdGhlbgoJCWlmIFsgJHtVU0VSfSA9PSAiYmVsbGEiIF07IHRoZW4KCQkJZWNobyAiYnlwYXNzIgoJCWVsaWYgWyAke1VTRVJ9ID09ICJyb290IiBdOyB0aGVuCgkJCWRuZiAteSBpbnN0YWxsIG1lc2EtdnVsa2FuLWRyaXZlcnMKCQkJZG5mIC15IGluc3RhbGwgbWVzYS1saWJHTAoJCQlkbmYgLXkgaW5zdGFsbCBiYwoJCWVsc2UKCQkJc3VkbyBkbmYgLXkgaW5zdGFsbCBtZXNhLXZ1bGthbi1kcml2ZXJzCgkJCXN1ZG8gZG5mIC15IGluc3RhbGwgbWVzYS1saWJHTAoJCQlzdWRvIGRuZiAteSBpbnN0YWxsIGJjCgkJZmkKCSMgIERlYmlhbiBiYXNlZAoJZWxzZQoJCWlmIFsgJHtVU0VSfSA9PSAiYmVsbGEiIF07IHRoZW4KCQkJZWNobyAiYnlwYXNzIgoJCWVsaWYgWyAke1VTRVJ9ID09ICJyb290IiBdOyB0aGVuCgkJCWFwdCAteSB1cGRhdGUKCQkJYXB0IC15IGluc3RhbGwgbWVzYS12dWxrYW4tZHJpdmVycwoJCQlhcHQgLXkgaW5zdGFsbCBsaWJnbDEtbWVzYS1nbHgKCQkJYXB0IC15IGluc3RhbGwgYmMKCQllbHNlCgkJCXN1ZG8gYXB0IC15IHVwZGF0ZQoJCQlzdWRvIGFwdCAteSBpbnN0YWxsIG1lc2EtdnVsa2FuLWRyaXZlcnMKCQkJc3VkbyBhcHQgLXkgaW5zdGFsbCBsaWJnbDEtbWVzYS1nbHgKCQkJc3VkbyBhcHQgLXkgaW5zdGFsbCBiYwoJCWZpCglmaQoJaWYgWyAteiAke0JFTExBX1ZFUlNJT059IF07IHRoZW4KCQljdXJsIC1PIGh0dHBzOi8vZG93bmxvYWRzLmJlbGxhcmVuZGVyLmNvbS9iZWxsYV9jbGktMjQuMi4wLnRhci5negoJCXRhciAteHZmIGJlbGxhX2NsaS0yNC4yLjAudGFyLmd6CgllbHNlCgkJY3VybCAtTyBodHRwczovL2Rvd25sb2Fkcy5iZWxsYXJlbmRlci5jb20vYmVsbGFfY2xpLSR7QkVMTEFfVkVSU0lPTn0udGFyLmd6CgkJdGFyIC14dmYgYmVsbGFfY2xpLSR7QkVMTEFfVkVSU0lPTn0udGFyLmd6CglmaQpmaQoKYnN6X2ZpbGVzPSouYnN6CgppZiAhIHRlc3QgLWYgImJlbGxhLmxvZyIgOyB0aGVuCglpZGxlPSIxIgplbHNlCglpc19pZGxlPSIkKHBncmVwIGJlbGxhX2NsaSkiCgoJaWYgWyAteiAke2lzX2lkbGV9IF07IHRoZW4KCQlpZGxlPSIxIgoJZWxzZQoJCWlkbGU9IjAiCglmaQpmaQoKCmlmIFsgJHtpZGxlfSA9PSAiMSIgXTsgdGhlbgoJZm9yIGVhY2ggaW4gJGJzel9maWxlcwoJZG8KCQlwcmVmaXg9JHtlYWNoJS4qfQoJCWVjaG8gIlJlbmRlcmluZyBzdGFydGVkIGZvcjogJGVhY2giCgkJaWYgdGVzdCAtZiBjbG91ZF9iZWxsYV9jbGkuYW5pbTsgdGhlbgoJCQlhbmltMXN0YXJ0bGluZT0kKHNlZCAnMSFkJyBjbG91ZF9iZWxsYV9jbGkuYW5pbSkKCQkJYXR0cj0ke2FuaW0xc3RhcnRsaW5lJT0qfQoJCQlhbmltMXN0YXJ0MD0ke2FuaW0xc3RhcnRsaW5lIyo9fQoJCQlhbmltMXN0YXJ0PSR7YW5pbTFzdGFydDA6MDokeyNhbmltMXN0YXJ0MH0tMn0KCQkJYW5pbTFlbmRsaW5lPSQoc2VkICcyIWQnIGNsb3VkX2JlbGxhX2NsaS5hbmltKQoJCQlhbmltMWVuZDA9JHthbmltMWVuZGxpbmUjKj19CgkJCWFuaW0xZW5kPSR7YW5pbTFlbmQwOjA6JHsjYW5pbTFlbmQwfS0yfQoJCQlmcmFtZXM9JChzZWQgJzMhZCcgY2xvdWRfYmVsbGFfY2xpLmFuaW0pCgkJCWZvciAoKGkgPSAwIDsgaSA8PSAke2ZyYW1lc30gOyBpKysgKSk7IGRvIAoJCQkJcGFkZGVkPSQocHJpbnRmICIlMDRkIiAkKChpKzEpKSkKCQkJCWVjaG8gInNjYWxlPTU7ICgke2FuaW0xZW5kfS0oJHthbmltMXN0YXJ0fSkpKigke2l9LyR7ZnJhbWVzfS4wKSske2FuaW0xc3RhcnR9IiB8IGJjCgkJCQlhbmltYXRlZD0kKGVjaG8gInNjYWxlPTU7ICgoJHthbmltMWVuZH0tKCR7YW5pbTFzdGFydH0pKSooJHtpfS8ke2ZyYW1lc30uMCkpKyR7YW5pbTFzdGFydH0iIHwgYmMpCgkJCQlpZiBbICR7YW5pbWF0ZWQ6MDoxfSA9PSAiLiIgXTsgdGhlbgoJCQkJCWFuaW1hdGVkPSIwJHthbmltYXRlZH0iCgkJCQllbGlmIFsgJHthbmltYXRlZDowOjJ9ID09ICItLiIgXTsgdGhlbgoJCQkJCWFuaW1hdGVkPSItMCR7YW5pbWF0ZWQ6MX0iCgkJCQlmaQoJCQkJZWNobyAuL2JlbGxhX2NsaSAtaToiJGVhY2giIC1vbjoiJHtwcmVmaXh9JHtwYWRkZWR9IiAtcGY6IiR7QkVMTEFfUEFSU0VfRlJBR01FTlR9IiAtcGY6IiR7YXR0cn09JHthbmltYXRlZH1mOyIgLXBmOiJzZXR0aW5ncy50aHJlYWRzPTA7IiAgLW9kOiIuLyIgCgkJCQkuL2JlbGxhX2NsaSAtaToiJGVhY2giIC1vbjoiJHtwcmVmaXh9JHtwYWRkZWR9IiAtcGY6IiR7QkVMTEFfUEFSU0VfRlJBR01FTlR9IiAtcGY6IiR7YXR0cn09JHthbmltYXRlZH1mOyIgLXBmOiJzZXR0aW5ncy50aHJlYWRzPTA7IiAgLW9kOiIuLyIgPiBiZWxsYS5sb2cKCQkJZG9uZQkKCQllbHNlCgoJCQkuL2JlbGxhX2NsaSAtaToiJHtlYWNofSIgLXBmOiIke0JFTExBX1BBUlNFX0ZSQUdNRU5UfSIgLXBmOiIke2luc2VydDF9IiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiIC1vZDoiLi8iID4gYmVsbGEubG9nCgkJZmkKCQlybSAke2VhY2h9Cglkb25lCmZpCg=="

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
				ssh -o PasswordAuthentication=no -o PubkeyAuthentication=yes root@${server_ip} "exit" 
				PUBKEY_RESULT=$?
				echo $PUBKEY_RESULT
				if ! [ $PUBKEY_RESULT -eq 0 ]; then
					echo -e "\nYour Linux server does not expect the username root"
					echo -e "\nRemember to edit the username in the server menu to match your provider"
					echo -e "\nOtherwise this script will fail to render"
				fi
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
			vast_host=$(ssh ${server_user}@${server_ip} -p ${server_port} test -f .vast_containerlabel; echo $?)
			if [ ${server_user} == "bella" ]; then
				echo "bypass"
			elif [ ${server_user} == "root" ]; then
				ssh ${server_user}@${server_ip} -p ${server_port} "sed -i /'AcceptEnv LANG LC_*'/d /etc/ssh/sshd_config"
				ssh ${server_user}@${server_ip} -p ${server_port} "grep -qxF 'AcceptEnv BELLA_LICENSE_TEXT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_LICENSE_TEXT' >> /etc/ssh/sshd_config"
				ssh ${server_user}@${server_ip} -p ${server_port} "grep -qxF 'AcceptEnv BELLA_PARSE_FRAGMENT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_PARSE_FRAGMENT' >> /etc/ssh/sshd_config"
				ssh ${server_user}@${server_ip} -p ${server_port} "grep -qxF 'AcceptEnv BELLA_VERSION' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_VERSION' >> /etc/ssh/sshd_config"
				echo -e "\n${vast_host}"
				if [ ${vast_host} == "1" ]; then
					ssh ${server_user}@${server_ip} -p ${server_port} "systemctl restart sshd"
				else
					ssh ${server_user}@${server_ip} -p ${server_port} "/etc/init.d/ssh restart"
				fi
			else
				ssh ${server_user}@${server_ip} -p ${server_port} "sudo grep -qxF 'AcceptEnv BELLA_LICENSE_TEXT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_LICENSE_TEXT' | sudo tee -a /etc/ssh/sshd_config"
				ssh ${server_user}@${server_ip} -p ${server_port} "sudo grep -qxF 'AcceptEnv BELLA_PARSE_FRAGMENT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_PARSE_FRAGMENT' | sudo tee -a /etc/ssh/sshd_config"
				ssh ${server_user}@${server_ip} -p ${server_port} "sudo grep -qxF 'AcceptEnv BELLA_VERSION' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_VERSION' | sudo tee -a /etc/ssh/sshd_config"
				echo -e "\n${vast_host}"
				if [ ${vast_host} == "1" ]; then
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
			ssh ${server_user}@${server_ip} -o SendEnv=BELLA_LICENSE_TEXT -p ${server_port} "nohup bash render.sh >./nohup.out 2>./nohup.err &"
			echo "The render is running on your Linux server in the background. Occasionally use the 3) progress option and look for the word DONE. You can close this window. Remember to shut down any hourly cloud computers you are running to avoid unexpected charges"
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
					read -p "Enter download extension no period: (default png):" image_ext
					if [ -z ${image_ext} ]; then
						image_ext="png"
					fi
				fi
			fi
		elif [[ $action == "download" ]]; then
			echo "Downloading *.${file_ext}"
			scp -P ${server_port} ${server_user}@${server_ip}:./*.${image_ext} ./

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
