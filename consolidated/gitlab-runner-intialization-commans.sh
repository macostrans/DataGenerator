#!/bin/sh
curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb"
dpkg -i gitlab-runner_amd64.deb
sudo gitlab-runner register
sudo usermod -aG dockergitlab-runner
sudo nano /etc/sudoers
gitlab-runner ALL=(ALL) NOPASSWD: ALL