# Explanation for Docker Setup

## 1. Choice of Base Image
#### Backend Dockerfile:
Base image used : the official Node.js 16 image as it provides a solid foundation for running Node.js applications. Specifically, used `node:16-alpine` for its lightweight nature, which helps minimize the overall size of the Docker image.

#### Frontend Dockerfile:
Base image used : the official Node.js 16 image (`node:16-alpine`) for consistency and efficiency in managing dependencies and running the React application.

## 2. Dockerfile Directives

#### Backend Dockerfile:

Directives Used: FROM, WORKDIR, COPY, RUN, EXPOSE, CMD Explanation: These directives establish the environment for the backend container, define the working directory, copy application files, install necessary dependencies, expose the essential port, and specify the command to initiate the backend server.

Specify the base image for the build stage.  
`FROM node:16-as build`

Set the working directory inside the container for subsequent instructions.  
`WORKDIR /app/backend`

Copy the package.json and package-lock.json files from the host to the container's working directory  
`COPY package*.json ./`

Install dependencies defined in the package.json file using npm.  
`RUN npm install`

Copy the rest of the application code
`COPY . .`

Initiate a new stage using a lightweight Node.js 16 Alpine image for the production stage.
``FROM node:16-alpine``

Set the working directory inside the container for subsequent instructions.  
`WORKDIR /app/backend`

Copy the built output from the previous 'build' stage (identified by the name) into the current production stage.
`COPY --from=build /app/backend .`

Expose port 5000, indicating that the container will listen on this port at runtime.  
`EXPOSE 5000`

Define the command to start the backend server using npm start.  
`CMD ["npm", "start"]`

#### Frontend Dockerfile:
Directives Used: FROM, WORKDIR, COPY, RUN, EXPOSE, CMD Explanation: These directives are applied to configure the environment for the frontend container, establish the working directory, transfer application files, install necessary dependencies, compile the React application, expose the essential port, and specify the command to serve the compiled application.

Pull the official Node.js 16 Alpine image as the base and labeling this stage as 'build'.  
`FROM node:16-alpine as build`

Set the working directory inside the container for subsequent instructions.  
`WORKDIR /app/client`

Copy `package.json` and `package-lock.json` from the host machine to the working directory within the container.  
`COPY package*.json ./`

Install dependencies defined in the package.json file using npm.  
`RUN npm install`

Copy the rest of the application code.  
`COPY . .`

Build the React app  
`RUN npm run build`

Use a lightweight Node.js image for the production stage  
`FROM node:16-alpine`

Set the working directory inside the container  
`WORKDIR /app/client`

Install the `serve` package globally using npm, which is a lightweight HTTP server for serving static files.  
`RUN npm install -g serve`

Copy the build artifacts (the compiled React application) from the previous 'build' stage into the current production stage.
`COPY --from=build /app/client/build ./build`  

Copy`package.json` and `package-lock.json` from the previous 'build' stage into the current production stage.  
`COPY --from=build /app/client/package.json /app/client/package-lock.json ./`

Exposes port 3000, indicating that the container will listen on this port at runtime.  
`EXPOSE 3000`

Specify the command to run the React application within the container.  
`CMD ["serve","-s","build"]`

## 3. Docker-compose Networking

A custom bridge network named `yolomy-network` is established to facilitate communication between the containers. Both the backend and client services are connected to this network, enabling them to communicate with each other using their service names as hostnames (`backend` and `client`).

## 4. Docker-compose Volume Definition

A volume named `mongodbdata` is designated for the MongoDB service, ensuring persistent data storage. This volume is attached to `/data/db` within the MongoDB container, guaranteeing data retention across container restarts or recreations.
 
## 5. Git Workflow

Throughout the task, a typical Git workflow was followed, ensuring descriptive commits and the creation of required files within the appropriate folder structure. This approach aids in maintaining a clear history and facilitating collaboration.

## 6.  Successful Running & Debugging Measures

The applications was launched using the `docker-compose up` command as the initial step. Following that, the setup was tested on the designated ports to ensure the successful deployment of the applications. In case of any issues, standard debugging techniques were employed, including checking container logs (`docker logs <container_name>`), examining Dockerfile configurations, and ensuring network connectivity between containers.

## 7. Docker Image Tag Naming Standards

A consistent naming convention was followed for Docker images to improve clarity and facilitate easy identification. Each image was tagged with a version number (`v1.0.0`), representing the release version of the corresponding application component.

## 8.  DockerHub Screenshot

Screenshots of the deployed images on DockerHub have been provided below, clearly indicating the tagged versions (`v1.0.0`). This serves as a visual reference for the published images and their versions.
![Screenshot from 2024-05-05 03-56-31](https://github.com/Meresia13/alx-pre_course/assets/106277094/eac6e8e5-166f-4475-a1a7-bd4032042b2b)
![Screenshot from 2024-05-05 04-13-00](https://github.com/Meresia13/alx-pre_course/assets/106277094/8698c9fc-c56c-4ca5-8694-8abc1a2557dd)
![Screenshot from 2024-05-05 04-13-00](https://github.com/Meresia13/alx-pre_course/assets/106277094/32310534-964b-48d0-98f1-bcd2c9ecf3e9)
Below is the list of Docker images related to this project on the local system, displaying the tags and sizes of the images.
![Screenshot from 2024-05-05 04-18-15](https://github.com/Meresia13/alx-pre_course/assets/106277094/d4e040b2-1443-4575-9fab-b4345add7658)
