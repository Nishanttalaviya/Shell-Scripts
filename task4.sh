#project environment setup (install required packages)
#!/bin/bash

echo " Starting environment setup..."
:
# --- Update system ---
echo " Updating package list..."
sudo apt update -y && sudo apt upgrade -y

# --- Install common tools ---
echo " Installing Git, curl, unzip, build tools..."
sudo apt install -y git curl unzip build-essential

# --- Install Node.js + npm (Optional) ---
echo " Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# --- Install Python + pip (Optional) ---
echo " Installing Python and pip..."
sudo apt install -y python3 python3-pip python3-venv

# --- Install NGINX (Optional for web apps) ---
echo " Installing NGINX..."
sudo apt install -y nginx

# --- Install PM2 (for Node.js process management) ---
echo " Installing PM2..."
sudo npm install -g pm2

# --- Set up Python virtual environment (if needed) ---
if [ -f "requirements.txt" ]; then
    echo " Setting up Python virtual environment..."
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
fi

# --- Install Node.js dependencies (if package.json exists) ---
if [ -f "package.json" ]; then
    echo " Installing Node.js dependencies..."
    npm install
fi

echo "✅ Environment setup complete!"

