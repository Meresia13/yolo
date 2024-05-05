Explanation for Docker Setup
Choice of Base Image

For the backend container, I opted for the official Node.js 16 image as it provides a solid foundation for running Node.js applications. Specifically, I used node:16-alpine for its lightweight nature, which helps minimize the overall size of the Docker image.

Similarly, for the client container, I also chose the official Node.js 16 image (node:16-alpine) for consistency and efficiency in managing dependencies and running the React application.
Dockerfile Directives
Backend Dockerfile:

    Build Stage:
        The build stage begins with FROM node:16 as build, which sets up the environment for building the Node.js application.
        It sets the working directory, installs dependencies, and copies the application code.
    Production Stage:
        In the production stage, I switch to a lightweight Node.js image (node:16-alpine) to reduce image size.
        I copy the built output from the previous stage and expose port 5000, specifying the command to run the application.

Frontend Dockerfile:

    Build Stage:
        Similar to the backend, I start with a build stage using node:16-alpine as the base image.
        Dependencies are installed, and the React application is built.
    Production Stage:
        Again, I switch to node:16-alpine for the production stage.
        The build artifacts are copied from the previous stage, and port 3000 is exposed for serving the React app.

Docker-compose Networking

I've defined a custom bridge network named yolomy-network to facilitate communication between the containers. Both the backend and client services are connected to this network, allowing them to communicate with each other using their service names as hostnames (backend and client).
Docker-compose Volume Definition

A named volume mongodbdata is defined for the MongoDB service. This volume is mounted to /data/db within the MongoDB container, ensuring that data persists across container restarts or recreations.
Git Workflow

Throughout the task, I followed a typical Git workflow, utilizing branches for different features or fixes and merging them into the main branch upon completion. This approach helps maintain a clean history and facilitates collaboration.
Successful Running & Debugging Measures

After setting up the Docker configuration, I tested the setup locally to ensure successful deployment of the applications. In case of any issues, I employed standard debugging techniques such as checking container logs (docker logs <container_name>), inspecting Dockerfile configurations, and verifying network connectivity between containers.
Docker Image Tag Naming Standards

I adhered to a consistent naming convention for Docker images to enhance clarity and ease of identification. Each image is tagged with a version number (v1.0.0), reflecting the release version of the respective application component.
DockerHub Screenshot

I've attached a screenshot of the deployed images on DockerHub, clearly indicating the tagged versions (v1.0.0). This provides a visual reference for the published images and their versions.