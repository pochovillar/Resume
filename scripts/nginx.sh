#!/usr/bin/bash

# Reload systemd to apply changes in the service configuration
sudo systemctl daemon-reload

# Remove default site link if it exists
sudo rm -f /etc/nginx/sites-enabled/default

# Ensure no existing symbolic link for the 'resume' site
if [ -L /etc/nginx/sites-enabled/resume ]; then
    sudo rm /etc/nginx/sites-enabled/resume
fi

# Copy the Nginx configuration file for the resume site to sites-available
sudo cp /home/ubuntu/Resume/nginx/nginx.conf /etc/nginx/sites-available/resume

# Create a symbolic link in sites-enabled
sudo ln -s /etc/nginx/sites-available/resume /etc/nginx/sites-enabled/

# Add www-data user to the ubuntu group
sudo gpasswd -a www-data ubuntu

# Test the Nginx configuration
sudo nginx -t

# Restart Nginx to apply changes
sudo systemctl restart nginx
  