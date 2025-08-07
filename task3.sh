#deployment automation (CD part)
#!/bin/bash

APP_DIR="/var/www/your-app"
SERVICE_NAME="your-app.service"
TO_EMAIL="admin@example.com"

cd $APP_DIR || exit 1

echo "� Pulling latest code from GitHub..."
git pull origin main

if [ $? -ne 0 ]; then
    echo "❌ Git pull failed at $(date)" | mail -s "❌ Deployment Failed" $TO_EMAIL
    exit 1
fi

echo "� Building or preparing the application..."
# Uncomment if needed
# npm install
# pip install -r requirements.txt

echo "� Restarting the service..."
sudo systemctl restart $SERVICE_NAME

if [ $? -ne 0 ]; then
    echo "❌ Service restart failed at $(date)" | mail -s "❌ Deployment Failed" $TO_EMAIL
    exit 1
fi

echo "✅ Deployment successful at $(date)" | mail -s "✅ Deployment Successful" $TO_EMAIL

