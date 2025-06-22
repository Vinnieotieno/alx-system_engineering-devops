## 1-distributed_web_infrastructure

### Overview
Expands infrastructure to include redundancy and a load balancer.

### Infrastructure Components
- **3 Servers**
  - Load Balancer (HAProxy)
  - Web Server (Nginx)
  - App Server (Gunicorn)
- **MySQL Database**
- **DNS Record**: Points to load balancer IP

### Enhancements
- **Load Balancer** distributes traffic using **Round Robin** algorithm
- **Active-Active Setup** (both app servers handle traffic)
- **App Files** are synced via Git or shared FS
- **DB is configured as Master-Slave (Primary-Replica)**

### Primary vs Replica
- **Primary**: Handles all writes + reads
- **Replica**: Handles only reads

### Weaknesses
- **SPOF in Load Balancer** if not replicated
- **No HTTPS or firewall**
- **No monitoring tools implemented**

---