cd ..
START /WAIT ng build --prod
mv dist/ build/
cd build

mkdir php
xcopy ../../brentedwardsonline_phpapi/api/* ./php
xcopy ../../brentedwardsonline_phpapi/.htaccess ./php

pause
