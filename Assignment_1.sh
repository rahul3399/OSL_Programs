
#Name:- Rahul Mashere
#Class:- TE-IT-B
#Roll No:- 37032



#!/bin/bash

create()
{
if [ -e addressbook.txt ]; #-e is checking exitence of addressbook.txt 
then
	echo -e "ADDRESSBOOK ALREADY EXISTS!! \n" 
else
	touch addressbook.txt #touch creates a new adressbook if not already exiting . 
	echo -e "NEW ADDRESSBOOK CREATED SUCCESSFULLY!!!!! \n"
fi
}


insert()
{

echo -e "ENTER THE FIRST NAME:- \n" # -e is used to  make \n available for use 
read fname
echo -e "ENTER THE LAST NAME:- \n"
read lname
echo -e "ENTER THE EMAIL-ID:- \n"
read email
echo -e "ENTER THE MOBILE NUMBER:- \n"
read mno
echo -e "ENTER THE ADDRESS:- \n"
read addr

echo "$fname	$lname	$email	$mno	$addr" >> addressbook.txt 
echo -e "RECORD INSERTION SUCCESSFUL !! \n"
}


view()
{
if [ ! -s addressbook.txt ];  
then 
	echo -e "THE ADDRESSBOOK IS EMPTY !!! \n"
else
	sed -n 'p' addressbook.txt  
	
fi
}


delete()
{
if [ ! -s addressbook.txt ];
then
	echo -e "ADDRESSBOOK EMPTY !!! \n"
else
	echo -e "ENTER THE FIRST NAME OR EMAIL-ID FOR DELETING RECORD:- \n"
	read fnem
	grep -n "$fnem" addressbook.txt
	
	echo -e "ENTER THE LINE NUMBER TO DELETE:- \n"
	read lineno

	for line in `grep -n "$fnem" addressbook.txt` 
	do
	
	number=`echo $line|cut -c1`

		if [ "$number" == "$lineno" ];
		then
			sed -i -e "${lineno}d" addressbook.txt #ratta maro 
			echo -e "RECORD DELETION SUCCESSFUL!!!! \n"
		fi

	done
fi

}

modify()
{
if [ ! -s addressbook.txt ];
then
	echo -e "ADDRESSBOOK EMPTY !!! \n"
else
	echo -e "ENTER THE NAME(FIRST NAME/LAST NAME) OF THE PERSON TO BE EDITED:- \N"
	read name
	grep -n "$name" addressbook.txt
		
			echo -e "ENTER THE LINE NUMBER OF THE RECORD TO BE EDITED:- \n"
			read lineno
			
			for line in `grep -n "$name" addressbook.txt`
			do
				number=`echo "$line"|cut -c1`
				if [ "$number" == "$lineno" ]
					then
					echo -e "ENTER THE MODIFICATION DETAILS:- \n"
					insert
					sed -i -e "${lineno}s/.*/$insert/" addressbook.txt # ratta maro 
				echo -e "MODIFICATION SUCCESSFUL !!! \n"
				fi

			done
		fi
}

ch=1;
while [ $ch -lt 6 ]; # less than 
do
echo -e "1) CREATE ADDRESSBOOK \n"
echo -e "2) VIEW ADDRESSBOOK \n"
echo -e "3) INSERT RECORD IN ADDRESSBOOK \n"  
echo -e "4) DELETE RECORD FROM ADDRESSBOOK \n"
echo -e "5) MODIFY ADRESSBOOK \n"
echo -e "6) EXIT"

read -p "ENTER YOUR CHOICE:-" ch

case $ch in 
1)create;;
2)view;;
3)insert;;
4)delete;;
5)modify;;
6)echo "ADDRESSBOOK EXITED!!"
esac

done












