# Use Node.js 22 base image
FROM node:22

# Install system dependencies
RUN apt-get update && apt-get install -y git curl

# Set the working directory where we want to install ODK Central
WORKDIR /app

# Clone the ODK Central backend repo
RUN git clone https://github.com/getodk/central-backend.git .

# Install dependencies inside the server folder
WORKDIR /app/server
RUN npm install

# Expose port 80 (or the port your app listens on)
EXPOSE 80

# Start ODK Central server (for debugging)
CMD ["npm", "run", "start"]   # Ensure the start script in package.json runs the server
