SIT323/SIT737: Cloud Native Application Development - Task 5.1P

Overview

This task involves containerizing a simple Node.js web application using Docker. The steps include creating a Dockerfile to build the Docker image, deploying it with Docker Compose, testing the application, and pushing the Docker image to a registry (DockerHub).

Tools Required

Before starting, make sure you have the following tools installed:

Git: Version control for your code (Download Git)

Visual Studio Code (VS Code): Code editor (Download VS Code)

Node.js: JavaScript runtime (Download Node.js)

Docker: Platform to create and run containers (Download Docker)

Steps to Dockerize the Application

1. Install Docker

After installing Docker, you can verify it’s working by running the following command in your terminal:

docker --version


2. Clone the Sample Web Application

You can either:

Clone the app from your previous OnTrack task, or

If you’re creating a new application, follow the setup steps to create your Node.js app (for example, using Express and Docker).

To clone an existing repository:

git clone https://github.com/username/your-repository.git

cd your-repository

If you are starting a new project, follow the steps to create index.js, package.json, and Dockerize the app.


3. Create a Dockerfile

In the root of your project, create a file named Dockerfile (no file extension). Add the following content:

dockerfile

# Use Node.js image from DockerHub
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./

RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 8080 (port your app listens on)
EXPOSE 8080

# Start the application
CMD ["npm", "start"]

This Dockerfile performs the following actions:

Uses the official Node.js image.

Sets the working directory inside the container.

Installs necessary dependencies.

Copies the application code into the container.

Exposes port 8080 (the app’s listening port).

Runs the application with npm start.


4. Build the Docker Image

Once your Dockerfile is in place, build the Docker image by running the following command in your terminal:


docker build -t your-dockerhub-username/node-web-app . (Replace your-dockerhub-username with your DockerHub username.)

After the build completes, verify that the image was created:

docker images


5. Create a Docker Compose File

In the project folder, create a docker-compose.yml file with the following content:

version: '3'
services:
  web:
    build: .
    ports:
      - "49160:8080"
This docker-compose.yml file:

Defines the web service, which will build the Docker image.

Maps the container’s port 8080 to port 49160 on the host machine.


6. Start the Docker Compose Environment

Run the following command to start the app using Docker Compose:

docker-compose up
This will build and run the container, and you can access the app by navigating to:


http://localhost:49160


7. Test the Application

Open your browser and go to:

http://localhost:49160
You should see the message: Hello from Dockerized Node.js App!


8. Push the Docker Image to DockerHub

Login to DockerHub:
Run the following command to log in to DockerHub:

docker login

Push the Docker Image:
Push your Docker image to DockerHub using:


docker push your-dockerhub-username/node-web-app

Now your app is available for others to pull and run from DockerHub.

