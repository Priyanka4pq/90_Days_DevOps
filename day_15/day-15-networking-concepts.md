
# Day 15 – Networking Concepts: DNS, IP, Subnets & Ports

## Objective

Today I learned the fundamental networking concepts every DevOps engineer should understand. These include DNS, IP addressing, subnetting using CIDR notation, and networking ports.

---

# Task 1: DNS – How Names Become IPs

## What happens when you type google.com in a browser?

When I type **google.com** in a browser, my computer first asks a DNS server to find the IP address of google.com. The DNS server responds with the corresponding IP address. Then my browser uses that IP address to connect to Google's server and download the webpage. Finally, the webpage is displayed in the browser.

---

## DNS Record Types

### A Record
Maps a domain name to an IPv4 address.

Example:
```
google.com → 142.250.193.78
```

### AAAA Record

Maps a domain name to an IPv6 address.

---

### CNAME Record

Creates an alias from one domain name to another.

Example:

```
www.example.com → example.com
```

---

### MX Record

Specifies the mail server responsible for receiving emails for a domain.

---

### NS Record

Specifies the authoritative DNS servers for a domain.

---

## Command

```bash
dig google.com
```

Example Output

```text
;; ANSWER SECTION:
google.com.    300    IN    A    142.250.193.78
```

**A Record:** `142.250.193.78`

**TTL:** `300 seconds`

---

# Task 2: IP Addressing

## What is an IPv4 Address?

An IPv4 address is a unique 32-bit address used to identify a device on a network. It is written as four numbers separated by dots.

Example:

```
192.168.1.10
```

Each number ranges from **0 to 255**.

---

## Public vs Private IP

### Public IP

A public IP address is accessible over the Internet.

Example:

```
8.8.8.8
```

---

### Private IP

A private IP address is used inside private networks and cannot be accessed directly from the Internet.

Example:

```
192.168.1.20
```

---

## Private IPv4 Ranges

```
10.0.0.0 – 10.255.255.255

172.16.0.0 – 172.31.255.255

192.168.0.0 – 192.168.255.255
```

---

## Command

```bash
ip addr show
```

Example

```
inet 192.168.29.15/24
```

My private IP address is:

```
192.168.29.15
```

*(Replace this with your own IP from your system.)*

---

# Task 3: CIDR & Subnetting

## What does /24 mean?

In `192.168.1.0/24`, the first **24 bits** represent the network portion and the remaining **8 bits** represent the host portion.

---

## Number of Usable Hosts

### /24

Total IPs = **256**

Usable Hosts = **254**

---

### /16

Total IPs = **65,536**

Usable Hosts = **65,534**

---

### /28

Total IPs = **16**

Usable Hosts = **14**

---

## Why do we subnet?

Subnetting divides a large network into smaller networks. This improves network performance, reduces unnecessary traffic, improves security, and allows IP addresses to be used efficiently.

---

## CIDR Table

| CIDR | Subnet Mask | Total IPs | Usable Hosts |
|------|-------------|-----------|--------------|
| /24 | 255.255.255.0 | 256 | 254 |
| /16 | 255.255.0.0 | 65,536 | 65,534 |
| /28 | 255.255.255.240 | 16 | 14 |

---

# Task 4: Ports – The Doors to Services

## What is a Port?

A port is a logical communication endpoint used by applications and services. While an IP address identifies a device, a port identifies the specific service running on that device.

---

## Common Ports

| Port | Service |
|------|----------|
| 22 | SSH |
| 80 | HTTP |
| 443 | HTTPS |
| 53 | DNS |
| 3306 | MySQL |
| 6379 | Redis |
| 27017 | MongoDB |

---

## Command

```bash
ss -tulpn
```

Example Output

```text
tcp LISTEN 0 128 0.0.0.0:22
users:(("sshd"))

tcp LISTEN 0 4096 127.0.0.53:53
users:(("systemd-resolved"))
```

### Listening Services

| Port | Service |
|------|----------|
| 22 | SSH Server |
| 53 | DNS Resolver |

*(Replace these with your actual output if different.)*

---

# Task 5: Putting It Together

## Q1. You run:

```bash
curl http://myapp.com:8080
```

What networking concepts are involved?

The DNS server first resolves **myapp.com** into an IP address. Then the request is sent to that IP using **HTTP** over **port 8080**. The server receives the request and returns the response to the client.

---

## Q2. Your application cannot reach a database at:

```
10.0.1.50:3306
```

What would you check first?

I would first check whether the database service is running and listening on port **3306**. Then I would verify network connectivity, firewall or security group rules, and ensure the application can reach the database's private IP address.

---

# Commands Used

```bash
dig google.com

ip addr show

ss -tulpn
```

---

# What I Learned

1. DNS converts domain names into IP addresses so computers can communicate.

2. CIDR notation defines network size and helps divide networks efficiently using subnetting.

3. Ports identify services running on a device, allowing multiple applications to use the same IP address.

---

# Conclusion

Today I learned the core networking concepts that are essential for DevOps engineers. Understanding DNS, IP addresses, subnetting, and ports helps in troubleshooting applications, configuring servers, and managing cloud infrastructure effectively.
