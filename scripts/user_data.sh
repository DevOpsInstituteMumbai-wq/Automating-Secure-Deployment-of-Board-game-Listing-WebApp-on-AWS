#!/bin/bash
sudo apt update -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo docker run -d -p 8080:8080 devopsinstitute/board-game-listing-app

