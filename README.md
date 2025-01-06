
# OpenSlidePlay

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

## File Structure

```
OpenSlidePlay/
├── docker-compose.yml
├── Dockerfile
├── apache.conf            # Custom Apache configuration
├── src/
│   ├── ws_server.php      # WebSocket server script
│   ├── public/
│   │   ├── control.html   # Control page
│   │   ├── player.html    # Player page
├── README.md
├── LICENSE
```

## How to Run

1. Build and Run the Docker Container:

```bash
docker-compose up --build
```

2. Access the Application:

- **Control Page**: [http://localhost/control.html](http://localhost/control.html)
- **Player Page**: [http://localhost/player.html](http://localhost/player.html)
