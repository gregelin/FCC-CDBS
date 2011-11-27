#!/bin/tcsh -f

############################ template.sh ###########################
# Author Name | greg.elin@fotonotes.net
# Copyright 2011 Greg Elin 
####################################################################


### Description ###
#
# This unix shell script automatically downloads FCC CDBS files.
# CDBS files are updated daily at 2:00 AM EST.
# This has been tested on Mac OS X.


### Properties ###
#
# These items must be modified to suit your environment before
# implementing this script! 
# 
#

set srcUrlPath = 'http://transition.fcc.gov/ftp/Bureaus/MB/Databases/cdbs/'
set srcFile = 'all-cdbs-files.zip'
set srcDownload = $srcUrlPath$srcFile
set trgDir = '/codedata/FCC/data/public/cdbs/'
set trgFile = $trgDir$srcFile
set defVar2 = value

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

echo "All done."

# mysql -v -u root -p cdbs < fcc_cdbs_ddl_mysql.sql
# mysql -v -u root -p cdbs < fcc_cdbs_load_mysql.sql 