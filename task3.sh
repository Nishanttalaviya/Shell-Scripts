#deployment automation (CD part)
#!/bin/bash

APP_DIR="/var/www/your-app"
SERVICE_NAME="your-app.service"
TO_EMAIL="admin@example.com"

cd $APP_DIR || exit 1

echo "Ì¥Ñ Pulling latest code from GitHub..."
git pull origin main

if [ $? -ne 0 ]; then
    echo "‚ùå Git pull failed at $(date)" | mail -s "‚ùå Deployment Failed" $TO_EMAIL
    exit 1
fi

echo "Ì¥ß Building or preparing the application..."
# Uncomment if needed
# npm install
# pip install -r requirements.txt

echo "Ì¥Å Restarting the service..."
sudo systemctl restart $SERVICE_NAME

if [ $? -ne 0 ]; then
    echo "‚ùå Service restart failed at $(date)" | mail -s "‚ùå Deployment Failed" $TO_EMAIL
    exit 1
fi

echo "‚úÖ Deployment successful at $(date)" | mail -s "‚úÖ Deployment Successful" $TO_EMAIL

