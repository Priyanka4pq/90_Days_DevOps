# Day 08 – Cloud Server Setup: Docker, Nginx & Web Deployment

## Objective

Today I launched a cloud server on AWS EC2, connected to it using SSH, installed Docker and Nginx, configured the security group for web access, viewed Nginx logs, and learned how to manage a remote Linux server.

---

## Commands Used

```bash
chmod 400 your-key.pem

ssh -i your-key.pem ubuntu@<PUBLIC-IP>

sudo apt update
sudo apt upgrade -y

sudo apt install docker.io -y
docker --version
sudo systemctl start docker
sudo systemctl enable docker
sudo docker run hello-world

sudo apt install nginx -y
sudo systemctl status nginx
sudo systemctl start nginx
sudo systemctl enable nginx

curl http://localhost

sudo cat /var/log/nginx/access.log
sudo cp /var/log/nginx/access.log ~/nginx-logs.txt
```

---

## Challenges Faced

- Initially, I was unable to access the Nginx welcome page from my browser.
- I checked whether the Nginx service was running and verified that HTTP (Port 80) was allowed in the EC2 Security Group.
- After correcting the configuration, the web server became accessible.

*(If your issue isn't solved yet, write: "I am currently troubleshooting why the Nginx webpage is not accessible from the internet." It's better to be truthful than to claim success.)*

---

## What I Learned

- How to launch an AWS EC2 instance.
- How to connect to a remote server using SSH.
- How to install and manage Docker and Nginx.
- How to use systemctl to manage Linux services.
- How to view and save Nginx log files.
- Why Security Groups are important for controlling network access.

---

## Why This Matters for DevOps

Cloud servers are used to host applications in production. A DevOps engineer must know how to provision servers, connect securely using SSH, install and manage services, configure firewall rules, monitor logs, and troubleshoot deployment issues. These skills form the foundation of real-world DevOps work.


---

## Log File

- nginx-logs.txt
