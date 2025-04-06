# Use Node.js image from DockerHub
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files & install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Expose the app port
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
