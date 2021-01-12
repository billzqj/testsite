#！/bin/bash

if [ $(curl -I -m 10 -o /dev/null -s -w %{http_code} http://localhost:80) -eq 200 ]
then
        echo "website publish successful!" 
else
        echo "website publish failed!"
        exit 1
fi
