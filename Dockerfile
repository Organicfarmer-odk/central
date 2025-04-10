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

# Start the ODK Central server
CMD ["npm", "start"]
