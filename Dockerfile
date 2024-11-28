# Use a lightweight Node.js image as the base
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port on which the app will listen
EXPOSE 4000

# Start the app when the container starts
CMD ["node", "index.js"]  # Replace 'index.js' with your main script
