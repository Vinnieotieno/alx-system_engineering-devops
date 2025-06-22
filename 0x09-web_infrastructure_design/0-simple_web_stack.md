## 0-simple_web_stack

### Overview
A user opens a browser and enters `www.foobar.com`. The DNS translates this to IP `8.8.8.8`, sending the request to a single server.

### Infrastructure Components
- **1 Server** (public IP: 8.8.8.8)
- **1 Nginx Web Server** (serves static files and proxies dynamic requests)
- **1 Application Server** (e.g., Gunicorn or uWSGI)
- **1 Set of Application Files** (e.g., a Django or PHP app)
- **1 MySQL Database**
- **1 DNS A Record**: `www.foobar.com -> 8.8.8.8`

### Flow
User → DNS → Nginx (Web Server) → App Server → MySQL → Response → User

### Key Concepts
- **Server**: A machine providing services (web, database, etc.)
- **Domain Name**: Maps human-friendly name to server IP
- **DNS www Record**: A-type DNS record
- **Web Server**: Handles HTTP, proxies requests to application
- **App Server**: Executes backend logic
- **Database**: Stores and retrieves data
- **Communication Protocol**: TCP/IP and HTTP/S

### Weaknesses
- **Single Point of Failure (SPOF)**
- **Downtime during deployment/restart**
- **No scalability for high traffic**

---