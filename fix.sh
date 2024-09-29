#!/bin/bash

# Update the system
echo "Updating system..."
yum update -y

# Install Java (required by Jenkins)
echo "Installing Java (OpenJDK 11)..."
yum install -y java-11-openjdk

# Add Jenkins repository
echo "Adding Jenkins repository..."
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# Install Jenkins
echo "Installing Jenkins..."
yum install -y jenkins

# Start and enable Jenkins service
echo "Starting and enabling Jenkins service..."
systemctl start jenkins
systemctl enable jenkins

# Open firewall port for Jenkins (port 8080 by default)
echo "Configuring firewall to allow Jenkins (port 8080)..."
firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --reload

echo "Done."
