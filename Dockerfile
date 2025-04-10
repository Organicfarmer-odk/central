FROM node:18

# Install system dependencies
RUN apt-get update && apt-get install -y git curl

# Set the working directory
WORKDIR /app

# Clone ODK Central (or use your own code if already there)
RUN git clone https://github.com/getodk/central.git .

# Install server dependencies
WORKDIR /app/server
RUN npm install

# Start ODK Central server
CMD ["npm", "start"]
