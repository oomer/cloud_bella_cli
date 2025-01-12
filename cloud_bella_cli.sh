#!/bin/bash

server_user="root"
server_port="22"
image_ext="png"
systemd="1"
bsa64=""
anim64=""
#cat render.sh | base64 -w0
render_sh="IyEvYmluL2Jhc2gKb3NfbmFtZT0kKGF3ayAtRj0gJyQxPT0iTkFNRSIgeyBwcmludCAkMiA7fScgL2V0Yy9vcy1yZWxlYXNlKQpwbGF0Zm9ybV9pZD0kKGF3ayAtRj0gJyQxPT0iUExBVEZPUk1fSUQiIHsgcHJpbnQgJDIgO30nIC9ldGMvb3MtcmVsZWFzZSkKdXNlcj0kKHdob2FtaSkKZ3JvdXA9JChpZCAtZykKaG9zdG5hbWU9JChob3N0bmFtZSkKaWYgWyAke2hvc3RuYW1lfSA9PSAiYmVsbGExIiBdOyB0aGVuCgliZWxsYV9iaW49Ii91c3IvbG9jYWwvYmluL2JlbGxhX2NsaSIKZWxzZQoJYmVsbGFfYmluPSIuL2JlbGxhX2NsaSIKCWlmICEgdGVzdCAtZiBiZWxsYV9jbGk7IHRoZW4KCQkjIFJIRUwgOC54IGFuZCA5LnggCgkJaWYgWyAiJHBsYXRmb3JtX2lkIiA9PSAiXCJwbGF0Zm9ybTplbDhcIiIgXSB8fCBbICIkcGxhdGZvcm1faWQiID09ICJcInBsYXRmb3JtOmVsOVwiIiBdOyB0aGVuCgkJCWlmIFsgJHtVU0VSfSA9PSAicm9vdCIgXTsgdGhlbgoJCQkJZG5mIC15IGluc3RhbGwgbWVzYS12dWxrYW4tZHJpdmVycwoJCQkJZG5mIC15IGluc3RhbGwgbWVzYS1saWJHTAoJCQkJZG5mIC15IGluc3RhbGwgYmMKCQkJZWxzZQoJCQkJc3VkbyBkbmYgLXkgaW5zdGFsbCBtZXNhLXZ1bGthbi1kcml2ZXJzCgkJCQlzdWRvIGRuZiAteSBpbnN0YWxsIG1lc2EtbGliR0wKCQkJCXN1ZG8gZG5mIC15IGluc3RhbGwgYmMKCQkJZmkKCQkjICBEZWJpYW4gYmFzZWQKCQllbHNlCgkJCWlmIFsgJHtVU0VSfSA9PSAicm9vdCIgXTsgdGhlbgoJCQkJYXB0IC15IHVwZGF0ZQoJCQkJYXB0IC15IGluc3RhbGwgbWVzYS12dWxrYW4tZHJpdmVycwoJCQkJYXB0IC15IGluc3RhbGwgbGliZ2wxCgkJCQlhcHQgLXkgaW5zdGFsbCBiYwoJCQllbHNlCgkJCQlzdWRvIGFwdCAteSB1cGRhdGUKCQkJCXN1ZG8gYXB0IC15IGluc3RhbGwgbWVzYS12dWxrYW4tZHJpdmVycwoJCQkJc3VkbyBhcHQgLXkgaW5zdGFsbCBsaWJnbDEKCQkJCXN1ZG8gYXB0IC15IGluc3RhbGwgYmMKCQkJZmkKCQlmaQoJCWlmIFsgLXogJHtCRUxMQV9WRVJTSU9OfSBdOyB0aGVuCgkJCWN1cmwgLU8gaHR0cHM6Ly9kb3dubG9hZHMuYmVsbGFyZW5kZXIuY29tL2JlbGxhX2NsaS0yNC42LjEudGFyLmd6CgkJCXRhciAteHZmIGJlbGxhX2NsaS0yNC42LjEudGFyLmd6CgkJZWxzZQoJCQljdXJsIC1PIGh0dHBzOi8vZG93bmxvYWRzLmJlbGxhcmVuZGVyLmNvbS9iZWxsYV9jbGktJHtCRUxMQV9WRVJTSU9OfS50YXIuZ3oKCQkJdGFyIC14dmYgYmVsbGFfY2xpLSR7QkVMTEFfVkVSU0lPTn0udGFyLmd6CgkJZmkKCWZpCmZpCgpic3pfZmlsZXM9Ki5ic3oKCmlmICEgdGVzdCAtZiAiYmVsbGEubG9nIiA7IHRoZW4KCWlkbGU9IjEiCmVsc2UKCWlzX2lkbGU9IiQocGdyZXAgLUcgJHtncm91cH0gYmVsbGFfY2xpKSIKCglpZiBbIC16ICR7aXNfaWRsZX0gXTsgdGhlbgoJCWlkbGU9IjEiCgllbHNlCgkJaWRsZT0iMCIKCWZpCmZpCgppZiBbICR7aWRsZX0gPT0gIjEiIF07IHRoZW4KCWZvciBlYWNoIGluICRic3pfZmlsZXMKCWRvCgkJcHJlZml4PSR7ZWFjaCUuKn0KCQllY2hvICJSZW5kZXJpbmcgc3RhcnRlZCBmb3I6ICRlYWNoIgoJCWlmIHRlc3QgLWYgY2xvdWRfYmVsbGFfY2xpLmFuaW07IHRoZW4KCQkJYW5pbTFzdGFydGxpbmU9JChzZWQgJzEhZCcgY2xvdWRfYmVsbGFfY2xpLmFuaW0pCgkJCWF0dHI9JHthbmltMXN0YXJ0bGluZSU9Kn0KCQkJYW5pbTFzdGFydDA9JHthbmltMXN0YXJ0bGluZSMqPX0KCQkJYW5pbTFzdGFydD0ke2FuaW0xc3RhcnQwOjA6JHsjYW5pbTFzdGFydDB9LTJ9CgkJCWFuaW0xZW5kbGluZT0kKHNlZCAnMiFkJyBjbG91ZF9iZWxsYV9jbGkuYW5pbSkKCQkJYW5pbTFlbmQwPSR7YW5pbTFlbmRsaW5lIyo9fQoJCQlhbmltMWVuZD0ke2FuaW0xZW5kMDowOiR7I2FuaW0xZW5kMH0tMn0KCQkJZnJhbWVzPSQoc2VkICczIWQnIGNsb3VkX2JlbGxhX2NsaS5hbmltKQoJCQlmb3IgKChpID0gMCA7IGkgPD0gJHtmcmFtZXN9IDsgaSsrICkpOyBkbyAKCQkJCXBhZGRlZD0kKHByaW50ZiAiJTA0ZCIgJCgoaSsxKSkpCgkJCQllY2hvICJzY2FsZT01OyAoJHthbmltMWVuZH0tKCR7YW5pbTFzdGFydH0pKSooJHtpfS8ke2ZyYW1lc30uMCkrJHthbmltMXN0YXJ0fSIgfCBiYwoJCQkJYW5pbWF0ZWQ9JChlY2hvICJzY2FsZT01OyAoKCR7YW5pbTFlbmR9LSgke2FuaW0xc3RhcnR9KSkqKCR7aX0vJHtmcmFtZXN9LjApKSske2FuaW0xc3RhcnR9IiB8IGJjKQoJCQkJaWYgWyAke2FuaW1hdGVkOjA6MX0gPT0gIi4iIF07IHRoZW4KCQkJCQlhbmltYXRlZD0iMCR7YW5pbWF0ZWR9IgoJCQkJZWxpZiBbICR7YW5pbWF0ZWQ6MDoyfSA9PSAiLS4iIF07IHRoZW4KCQkJCQlhbmltYXRlZD0iLTAke2FuaW1hdGVkOjF9IgoJCQkJZmkKCQkJCWVjaG8gJHtiZWxsYV9iaW59IC1pOiIkZWFjaCIgLW9uOiIke3ByZWZpeH0ke3BhZGRlZH0iIC1wZjoiJHtCRUxMQV9QQVJTRV9GUkFHTUVOVH0iIC1wZjoiJHthdHRyfT0ke2FuaW1hdGVkfWY7IiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiAKCQkJCXN0ZGJ1ZiAtb0wgJHtiZWxsYV9iaW59IC1pOiIkZWFjaCIgLW9uOiIke3ByZWZpeH0ke3BhZGRlZH0iIC1wZjoiJHtCRUxMQV9QQVJTRV9GUkFHTUVOVH0iIC1wZjoiJHthdHRyfT0ke2FuaW1hdGVkfWY7IiAtcGY6InNldHRpbmdzLnRocmVhZHM9MDsiICAtb2Q6Ii4vIiA+IGJlbGxhLmxvZwoJCQlkb25lCQoJCWVsc2UKCgkJCXN0ZGJ1ZiAtb0wgJHtiZWxsYV9iaW59IC1pOiIke2VhY2h9IiAtcGY6IiR7QkVMTEFfUEFSU0VfRlJBR01FTlR9IiAtcGY6IiR7aW5zZXJ0MX0iIC1wZjoic2V0dGluZ3MudGhyZWFkcz0wOyIgLW9kOiIuLyIgPiBiZWxsYS5sb2cgCgkJZmkKCQlybSAke2VhY2h9Cglkb25lCmVsc2UKCWVjaG8gImJlbGxhX2NsaSBpcyBhbHJlYWR5IHJ1bm5pbmcsIG5vdGhpbmcgbmV3IGlzIGJlaW5nIGRvbmUiCmZpCg=="

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
		if [ ${server_ip} == "masey.indoodle.com" ]; then
			server_user="oomer"
			server_port="222"
		fi
		
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
			elif [ ${server_ip} == "masey.indoodle.com" ]; then
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
				ssh ${server_user}@${server_ip} -p ${server_port} "grep -qxF 'AcceptEnv BELLA_LICENSE_TEXT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_LICENSE_TEXT' | sudo tee -a /etc/ssh/sshd_config"
				ssh ${server_user}@${server_ip} -p ${server_port} "grep -qxF 'AcceptEnv BELLA_PARSE_FRAGMENT' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_PARSE_FRAGMENT' | sudo tee -a /etc/ssh/sshd_config"
				ssh ${server_user}@${server_ip} -p ${server_port} "grep -qxF 'AcceptEnv BELLA_VERSION' /etc/ssh/sshd_config || echo 'AcceptEnv BELLA_VERSION' | sudo tee -a /etc/ssh/sshd_config"
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
			ssh ${server_user}@${server_ip} -p ${server_port} "nohup bash render.sh >./nohup.out 2>./nohup.err &"
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
