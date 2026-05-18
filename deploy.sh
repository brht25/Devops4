#!/bin/bash
sudo systemctl start docker 2>/dev/null || true
sudo docker pull brht13/devops3:latest
sudo /usr/local/bin/docker-compose -f /home/$USER/docker-compose.yml down
sudo /usr/local/bin/docker-compose -f /home/$USER/docker-compose.yml up -d
sudo docker image prune -f
