
# Day 14 – Networking Fundamentals & Hands-on Checks

## Objective

Learn the basic networking concepts and practice common troubleshooting commands used by DevOps engineers.

---

# Networking Concepts

## OSI Model (7 Layers)

| Layer | Purpose |
|--------|----------|
| Layer 7 – Application | User-facing applications like HTTP, HTTPS, DNS |
| Layer 6 – Presentation | Data formatting, encryption, compression |
| Layer 5 – Session | Starts and manages communication sessions |
| Layer 4 – Transport | Reliable data transfer using TCP or fast transfer using UDP |
| Layer 3 – Network | Routing packets using IP addresses |
| Layer 2 – Data Link | Transfers data between devices in the same network |
| Layer 1 – Physical | Cables, switches, electrical signals |

### Summary

- OSI is a reference model used to understand how networking works.
- Each layer has its own responsibility.

---

## TCP/IP Model

| Layer | Protocol Examples |
|--------|-------------------|
| Application | HTTP, HTTPS, DNS, FTP, SSH |
| Transport | TCP, UDP |
| Internet | IP, ICMP |
| Link | Ethernet, Wi-Fi |

### Summary

- TCP/IP is the practical networking model used on the Internet.
- It combines some OSI layers into four layers.

---

## Where Common Protocols Fit

| Protocol | Layer |
|----------|-------|
| HTTP / HTTPS | Application |
| DNS | Application |
| TCP | Transport |
| UDP | Transport |
| IP | Internet |
| Ethernet | Link |

---

## Example

```
curl https://example.com
```

Flow:

Application Layer (HTTP)

↓

Transport Layer (TCP)

↓

Internet Layer (IP)

↓

Link Layer (Ethernet/Wi-Fi)

---

# Hands-on Commands

## 1. Check IP Address

```bash
hostname -I
```

or

```bash
ip addr show
```

### Observation

- Displays the IP address assigned to the system.
- Useful for identifying the machine on the network.

Example Output

```
172.31.44.111
```

---

## 2. Test Reachability

```bash
ping google.com
```

### Observation

- Confirms whether the destination is reachable.
- Shows latency and packet loss.

Example

```
0% packet loss
Average latency: 18 ms
```

---

## 3. Check Network Path

```bash
tracepath google.com
```

or

```bash
traceroute google.com
```

### Observation

- Displays every network hop.
- Helps identify where delays or failures occur.

Example

```
Hop 1 → Router
Hop 2 → ISP
Hop 3 → Google Network
```

---

## 4. Check Listening Ports

```bash
ss -tulpn
```

### Observation

One listening service:

```
SSH
Port: 22
State: LISTEN
```

---

## 5. DNS Resolution

```bash
dig google.com
```

or

```bash
nslookup google.com
```

### Observation

Example resolved IP:

```
142.250.xxx.xxx
```

DNS successfully translated the domain name into an IP address.

---

## 6. HTTP Check

```bash
curl -I https://google.com
```

### Observation

Example

```
HTTP/2 200
```

Status code **200** means the website is reachable.

---

## 7. Active Connections

```bash
netstat -an | head
```

### Observation

Approximate count:

- LISTEN : 5
- ESTABLISHED : 2

Shows current network connections.

---

# Mini Task – Port Probe

Listening Port:

```
22 (SSH)
```

Check Port

```bash
nc -zv localhost 22
```

Example Output

```
Connection to localhost 22 port [tcp/ssh] succeeded!
```

### Interpretation

- The SSH service is reachable.
- If the connection failed, I would check:
  - Whether the service is running.
  - Firewall rules.
  - Port configuration.

---

# Reflection

### Which command gives the fastest signal when something is broken?

`ping` quickly tells whether the target is reachable.

---

### Which layer would you inspect next?

If DNS fails:

- Application Layer
- DNS service
- Internet Layer connectivity

If HTTP 500 appears:

- Application Layer
- Web server
- Backend application
- Logs

---

### Two follow-up checks during a real incident

1. Check service status

```bash
systemctl status nginx
```

2. Check application logs

```bash
journalctl -xe
```

or

```bash
tail -f /var/log/nginx/error.log
```

---

# Conclusion

Today I learned how networking works through the OSI and TCP/IP models and practiced important troubleshooting commands such as `ping`, `tracepath`, `ss`, `dig`, `curl`, and `netstat`. These commands help quickly identify connectivity, DNS, port, and HTTP-related issues.
