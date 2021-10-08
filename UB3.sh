##Ubuntu 16 base script - ##
## in term use ./FILENAME or ./DIRECTORY/FILENAME to run##
#!/bin/sh

##All Logs will be put on desktop for ease of access##

#I don't code much, sorry for the mess#
##-------------------------------------------------------------------------------------------------
read -n 1 -s -r -p "PHello, Press any key to Start!"


echo Before you begin, do this to set a secure password policy
#Initiating secure password policy
#Instructions:
echo  sudo apt install libpam-pwquality

echo  sudo nano /etc/pam.d/common-password

echo replace: Password   requisite   pam_pwquality.so retry=3
echo with:   pam_pwquality.so retry=4 minlen=9 difok=4 lcredit=-2 ucredit=-2 dcredit=-1 ocredit=-1 reject_username enforce_for_root
echo DO NOT REBOOT


read -n 1 -s -r -p "Now hit any key to change root password"

echo changing root password

sudo passwd




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
read -n 1 -s -r -p "Make Sure all Reps's are up to date, - under software and updates -  then Press any key to update all programs"


sudo apt-get update 
sudo apt-get -y upgrade
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
echo - Thats all I got folks, time to dig around and find the other security flaws in the system!
#-----------------------------------------------------------------------------------------------

##I am having some issues with locking a user account after so may login attempts, luckily that section is not worth too many points##
#Initiating secure password policy
#Instructions:
#$ sudo apt install libpam-pwquality

#$ sudo nano /etc/pam.d/common-password

#replace: Password   requisite   pam_pwquality.so retry=3
#with:   pam_pwquality.so retry=4 minlen=9 difok=4 lcredit=-2 ucredit=-2 dcredit=-1 ocredit=-1 reject_username enforce_for_root
## DO NOT REBOOT
##---------------------------------------------------------------------------------------------
#find /DIRECTORY -type f -name "*.conf"



