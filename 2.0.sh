##Ubuntu 16 base script - ##
## in term use ./FILENAME or ./DIRECTORY/FILENAME to run##
#!/bin/sh

##All Logs will be put on desktop for ease of access##

#I don't code much, sorry for the mess#
#Necessary Software Installers
echo -- Performing First Time Setup --
#installs clamav, a linux malware scanner
		sudo apt-get install clamav

		#this adds the database
		sudo freshclam
clear
echo --Setup Complete--
#---------------------------------------------------------------------------------------------
echo -
echo --Finding Users --
echo -
touch Desktop/log.txt

##username list to cover potentially unwanted users##
##keep in mind most users will/should show up near the bottom of the list - it's a little confusing##


awk -F: '{ print $1}' /etc/passwd &> Desktop/Userslog.txt

echo Users list is now in log.txt on desktop - use "userdel ___" to remove user
echo -

#----------------------------------------------------------------------------------------------
##Initiates updates##


echo --time for updates-- 
echo -
read -n 1 -s -r -p "Press any key to update all programs"


sudo apt-get update 

echo -
echo - 
echo -

echo --updates complete--

#----------------------------------------------------------------------------------------------
##listing all installed programs on desktop in InstalledPrograms.txt##

touch Desktop/InstalledPrograms.txt

read -n 1 -s -r -p "Press any key to create Installed Programs list - use CTRL+F to search the document"


apt list --installed > Desktop/InstalledPrograms.txt
echo -
echo --Ignore the warning, its linux being linux--
echo -

#-----------------------------------------------------------------------------------------------

##I am having some issues with locking a user account after so may login attempts, luckily that section is not worth too many points##


##---------------------------------------------------------------------------------------------
##Options Menu
echo Alright Time to choose your own adventure: 
echo - 
echo - Option 1= Malware Scan
echo - Option 2= idk
echo - Option 3= RickRoll
echo - 
PS3='Please enter your choice (enter only the number, ex '3': '
options=("Malware Scan 1" "Option 2" "RickRoll 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Malware Scan 1")
            echo --Malware Scan Time--

		

		read -n 1 -s -r -p "--Press any key to run malware scan--"
		echo -
		echo -
		#gotta add personality right?##
		echo --Running... Beep Beep Boop Boop, this may take awhile - 10-15min--  
		echo - 
		echo --In the meantime check the users, and installed programs for anything sus--

		#runs clamscan on ENTIRE system - outputs txt file to dsktp#
		clamscan -r --bell -i / > Desktop/MalwareHits.txt
            ;;
        "Option 2")
            echo "option 2 - Currently useless"
            ;;
        "RickRoll 3")
            xdg-open https://www.youtube.com/watch?v=xvFZjo5PgG0
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done








##------------------------------------------------------------------------------------------------



