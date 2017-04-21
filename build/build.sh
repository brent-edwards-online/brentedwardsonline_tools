#!/bin/bash

function mydelay()
{
	printf "  "
	for (( i = 1 ; i <= $1 ; i++ )); do
		printf "*"
		sleep 0.5
	done
	echo ""
}

ANGULAR_DIR="../../brentedwardsonline_angular2"
PHP_API="../../brentedwardsonline_phpapi"

clear
echo "Building BrentEdwardsOnline Angular2" 
rm -rf dist/
mydelay 5
echo ""

echo "Compiling Angular2 Application" 
echo ""
pushd $ANGULAR_DIR
echo ""
ng build --prod
popd

echo "Adding Php Api" 
mydelay 5
cp -r ../../brentedwardsonline_phpapi/api/ dist/
cp ./.htaccess dist/
rm dist/api/includes/config_to_save.php

echo "Zipping Files" 
mydelay 5
DATE_STRING="`date +%Y%m%d_%H%M%S`"
pushd dist/
zip -r "../beol_ng2_$DATE_STRING.zip" ./* ./.htaccess
popd
echo ""
echo "  Finished Building BrentEdwardsOnline Angular2" 
mydelay 5
echo "  Filename: beol_$DATE_STRING.zip"