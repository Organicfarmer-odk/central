FROM node:18

# Install system dependencies
RUN apt-get update && apt-get install -y git curl

# Set the working directory to where we want to install ODK Central
WORKDIR /app

# Clone the ODK Central repo
RUN git clone https://github.com/getodk/central.git .

# Install dependencies
WORKDIR /app/server
RUN npm install

# Start ODK Central server
CMD ["npm", "start"]
