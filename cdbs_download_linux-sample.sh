#!/bin/bash

############################ template.sh ###########################
# Author Name | greg.elin@fotonotes.net
# Copyright 2011 Greg Elin 
####################################################################


### Description ###
#
# This Linux shell script automatically downloads FCC CDBS files.
# CDBS files are updated daily at 2:00 AM EST.
# This has been tested on Ubuntu Server.


### Properties ###
#
# These items must be modified to suit your environment before
# implementing this script! 
# 
#

srcUrlPath='http://transition.fcc.gov/Bureaus/MB/Databases/cdbs/'
srcFile='all-cdbs-files.zip'
srcDownload=$srcUrlPath$srcFile
# Update path to directory on your computer to store
trgDir='cdbs_files/'
trgFile=$trgDir$srcFile
defVar2=value

echo ""
echo "Downloading CDBS files $srcDownload"
echo ""
curl $srcDownload > $trgFile


echo ""
echo "$trgFile file written."

echo "Unzipping into $trgDir."
unzip -ao $trgFile -d $trgDir	

echo ""
echo "Removing  into $trgFile."
rm $trgFile

echo ""
echo "Create MySQL tables"
# Update the line with your MySQL 'username' and 'password'
mysql -v -uusername -ppassword cdbs < fcc_cdbs_ddl_mysql.sql

echo ""
echo "Load data into MySQL tables"
# Update the line with your MySQL 'username' and 'password'
mysql -v -uusername -ppassword cdbs < fcc_cdbs_load_mysql.sql 

echo ""
echo "Removing all .dat files from $trgDir"
rm $trgDir*.dat
echo "All done."

