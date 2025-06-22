## 3-scale_up

### Overview
Enhances system with component separation and load-balancer clustering.

### Additions
- **1 additional server** for component separation
- **HAProxy cluster** (2 LBs in active-passive)
- **Split responsibilities**:
  - Web server (Nginx)
  - App server (Gunicorn)
  - DB server (MySQL)

### Benefits
- Fault tolerance
- Easier to scale horizontally
- Clean separation of roles

### Flow
User → LB Cluster → Web → App → DB → Response

---

## Diagram (Mermaid syntax)
```mermaid
graph TD;
  User[User] --> DNS[DNS: foobar.com]
  DNS --> LB[Load Balancer]
  LB --> Web1[Web Server]
  LB --> Web2[Web Server]
  Web1 --> App1[App Server]
  Web2 --> App2[App Server]
  App1 --> DB[MySQL DB Primary]
  App2 --> DB
  DB --> Replica[MySQL Replica]
```