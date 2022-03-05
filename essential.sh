#!/bin/bash


printf "Enter what to check:\n (file/directory/website/ip)\n"
read check
if [[ $check = file ]]
then 
	printf "Enter what to file check:\n"
	read filename
	if [[ -f $filename ]]
	then
		printf "\n$filename exist:\n"
		printf "\nDo you want to investigate file bigtime? (y/n)\n"
		read command
		if [[ $command = y ]]
		then
			printf "\nfile:\n "
			file $filename 
			
			printf "\n\ncat:\n" 
			cat $filename
			
			printf "\n\nstrings:\n" 
			strings $filename
			
			printf "\n\nbinwalk:\n"
			binwalk $filename
			
			printf "\n\ndiscusage:\n"
			du $filename
			
			printf "\n\nls -l:\n"
			ls -l $filename
			
			
			printf "\nZipfile?:\n\n"
			gzip -t file 2>/dev/null
			if [[ $? -eq 0 ]]&&echo "Compessed file"
			then
				unzip $filename
			else 
				printf "Not a Zipfile"
			fi
		elif [[ $command = n ]]
		then
				printf "\nDo you want to investigate smalltime? (y/n)\n "
				read smallcmd
				if [[ $smallcmd = y ]]
				then
					printf "\nfile:\n "
					file $filename 
					
					printf "\n\ncat:\n" 
					cat $filename
				elif [[ $smallcmd = n ]]
				then
					printf "\nWhat you doing then mannen?\n"
					
				fi
					
		
			
		fi
	else
		echo "$filename dosnt exist bruh"
	fi

elif [[ $check = directory ]]
then
	printf "Enter what to directory check:\n"
	read directoryname
	if [[ -d $directoryname ]]
	then
		printf "\n$directoryname exist:\n"
		printf "\nDo you want to investigate directory (y/n)\n"
		read command_direct
		if [[ $command_direct = y ]]
		then
			printf "\nls:\n "
			ls -ls -d $directoryname 
			ls -la $directoryname
		else
			printf "\nDirectory does not exist:\n "
			break

		fi
	else
		printf "\nThats  not a directory\n"
		break	
	fi	
			
			
elif [[ $check = website ]]
then
	printf "Enter what to website check:\n"
	read webname
	if wget --spider "$webname" 2>/dev/null;
	then
		printf "\n$webname exist:\n"
		printf "\nDo you want to investigate website (y/n)\n"
		read command_web
		if [[ $command_web = y ]]
		then
			printf "\nnmap:\n\n "
			nmap $webname 
			
			printf "\ncurl:\n\n "
			curl $webname 
		else
			printf "\nWebsite does not exist:\n "

		fi
	else
		printf "\nThats  not a website\n"
	fi	
			
			
			
elif [[ $check = ip ]]
then
	printf "Enter what to ip check:\n"
	read ip
	if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]];
	then
		printf "\n$ip exist:\n"
		printf "\nDo you want to investigate ip (y/n)\n"
		read command_ip
		if [[ $command_ip = y ]]
		then
			printf "\nnmap:\n\n "
			nmap $ip 
			
			printf "\nping:\n\n "
			ping -c 5 $ip 
		else
			printf "\n ip does not exist:\n "

		fi
	else
		printf "\nThats  not a ip\n"
	fi	
			
			






fi
