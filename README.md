
# OpenSlidePlay

![Project Logo](https://github.com/damithkothalawala/OpenSlidePlay/blob/main/OpenSlidePlay.png?raw=true)


**OpenSlidePlay** is an open-source project designed to simplify the process of controlling and displaying slides (PDFs) and videos for presentations. The project is built using PHP, WebSocket, and Docker to offer a unified, real-time, and easy-to-use solution for managing media.

## The Story

This project originated as a solution to a real-world problem faced by **Damith Rushika Kothalawala**, the newly appointed Head of IT for the **Buddhist Institute Sunday Dhamma School** in Kuala Lumpur, Malaysia. The Dhamma school, conducted every Sunday, teaches Buddhist principles and values to children.

Every Sunday morning, a significant amount of time was spent setting up a random laptop, transferring slides, and connecting it to a projector to support the **Buddha Puja (Buddhist Devotion)** session. This setup required a dedicated volunteer, creating dependencies and inefficiencies in the process.

Damith approached **ChatGPT** (developed by OpenAI) with the idea to create a solution that could:

- Reduce dependencies on specific hardware (like laptops).
- Centralize and streamline the slide/video setup process.
- Make life easier for volunteers who handle the technical setup.

Together, we built **OpenSlidePlay** as a way to address these challenges and bring simplicity to the setup process.

## Features

1. **Unified URL Access**: Both Control and Player pages, as well as WebSocket communication, are served from the same domain.
2. **Dynamic Playlist**: Fetches playlist data (PDFs and videos) from a remote JSON file, allowing easy updates.
3. **Real-Time Interaction**: Control Page sends commands via WebSocket to update the Player Page instantly.
4. **Dockerized Solution**: Runs everything (web server and WebSocket server) in a single Docker container.
5. **Customizable and Open Source**: Built to be extensible and open for contributions.

## How to Run

1. Build and Run the Docker Container:

```bash
docker-compose up --build
```

2. Access the Application:

- **Control Page**: [http://localhost/control.html](http://localhost/control.html)
- **Player Page**: [http://localhost/player.html](http://localhost/player.html)


## Deploy the Application for Public Use for example.com

### 1. Update WebSocket URL and Create Apache Config with Required Modules
#### Using Apache with WebSocket Proxy on Host Machine
Ensure the following Apache modules are enabled:
```bash
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod proxy_wstunnel
```
Configure the VirtualHost to proxy WebSocket traffic and serve the application.

Example VirtualHost configuration:
```apache
<VirtualHost *:80>
    ServerName example.com

    ProxyPreserveHost On
    ProxyRequests Off
    ProxyPass /ws ws://localhost:7788/
    ProxyPassReverse /ws ws://localhost:7788/

    ProxyPass / http://localhost:7788/
    ProxyPassReverse / http://localhost:7788/

    <Location /ws>
        Require all granted
        ProxyPass ws://localhost:7788/
        ProxyPassReverse ws://localhost:7788/
    </Location>
</VirtualHost>
```
Restart Apache:
```bash
sudo systemctl restart apache2
```

### 3. Update WebSocket URL
Ensure the WebSocket URL in both the Control and Player Pages points to your domain:
```javascript
const ws = new WebSocket('ws://example.com/ws');
```

## Post Public Deployment Usage

### Control Page
1. Open the Control Page: [http://example.com/public/control.html](http://example.com/public/control.html).
2. Generate a session code and share it with the Player Page.
3. Use the buttons to:
   - Play items (PDFs or videos).
   - Navigate PDFs (Back, Forward, Jump to specific pages).
   - Control videos (Pause, Loop, Restart).

### Player Page
1. Open the Player Page: [http://example.com/public/player.html](http://example.com/public/player.html).
2. Enter the session code provided by the Control Page.
3. The Player Page will respond to commands sent from the Control Page.

## Credits
- **Bootstrap**: Used for responsive design on the Control Page. [https://getbootstrap.com](https://getbootstrap.com)
- **PDF.js**: Used for rendering PDFs in the Player Page. [https://mozilla.github.io/pdf.js/](https://mozilla.github.io/pdf.js/)

## License
This project is licensed under the Apache 2.0 License.

## Authors
- **Damith Rushika Kothalawala**
- **ChatGPT**

