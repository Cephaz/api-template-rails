# Build: docker build -t ui .
FROM node:21-alpine

# Define working directory
WORKDIR /app

# Copy dependencies
COPY package*.json ./

# Install
RUN npm install

# Copy app
COPY . .

# Build server
# RUN npm run build

# Expose
EXPOSE 8080

# Run
CMD ["npm", "run", "dev"]
