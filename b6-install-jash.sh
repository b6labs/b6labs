#! /bin/sh


#Experimental installer for the B6Launch IoT agent

#by John Ash


#----------------Property of Basic6-----------------

#---Use of this software is limited to use in conjunction---

#--with B6Launch technology which is owned and controlled---

#--by Basic6. Features and installation procedures subject---

#--to change without notice. For more visit B6Launch.com---
#----------------------------------------------------




user_name=""

device_token=""



echo -e "\n\n Installing Basic6 B6Launch agent.."

cd ~

mkdir basic6



#enter user name with a test for non-zero length

while [ -z "$user_name" ]

do

echo -e "\n Please enter your User Name from B6Launch:"

read user_name

done



#enter device token with a test for non-zero length

while [ -z "$device_token" ]

do

echo -e "\n Please enter the Token ID from your B6Launch account:"

read device_token

done



#create the ini file

echo "user_name=$user_name" > basic6/b6-reg.ini

echo "device_token=$device_token" >> basic6/b6-reg.ini



#get the files, unzip and delete the seeds

echo -e "\n\n Getting files..."

curl -k  https://b6tech-1.3.s3.amazonaws.com/rpi/demo/release/b6.zip > basic6/b6temp.zip

unzip -o -j basic6/b6temp.zip Archive/rpi/demo/b6.zip -d basic6

unzip -o basic6/b6.zip -d basic6
rm basic6/b6/temp.zip

rm basic6/b6.zip


echo -e "\n Installing Basic6 components..."





python basic6/b6-install.pyc > basic6/b6-install.log

echo -e "\n Success!"
