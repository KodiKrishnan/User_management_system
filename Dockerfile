# Stage 1: Build
FROM node:18-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies (including dev dependencies)
RUN npm install

# Copy the rest of the application code
COPY . .

# Stage 2: Production
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy only the necessary files from the builder stage
COPY --from=builder /app .

# Install only production dependencies
RUN npm install --only=production

# Expose the port on which the app will listen
EXPOSE 4000

# Start the app when the container starts
CMD ["node", "server.js"]
