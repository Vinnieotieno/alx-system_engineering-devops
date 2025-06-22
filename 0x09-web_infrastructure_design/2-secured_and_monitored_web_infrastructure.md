## 2-secured_and_monitored_web_infrastructure

### Additions
- **SSL certificate (HTTPS)**
- **3 Firewalls** (Web, App, DB layer restrictions)
- **Monitoring Clients** (e.g. SumoLogic agents)

### Benefits
- **HTTPS** secures data in transit
- **Firewalls** prevent unauthorized access (e.g., only port 443 on web server)
- **Monitoring** tracks logs, performance, QPS, system load

### Monitoring QPS
- Use monitoring tools to set counters on HTTP logs or Nginx metrics

### Limitations
- **SSL termination at Load Balancer** = unencrypted backend traffic
- **Single MySQL write node** = high availability risk
- **All-in-one server config** = scaling/security issues

---