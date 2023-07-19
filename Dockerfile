FROM node:lts-alpine

# Set the working directory
WORKDIR /app

# RUN apt-get update && apt-get install -y curl
# Install curl
RUN apk --no-cache add curl

# Copy package.json, pnpm-lock.yaml and run pnpm install
COPY package.json .
COPY package-lock.json .

# Copy the entire monorepo directory
COPY . .

# Set environment variables
#ENV NODE_ENV production

RUN npm install

# Expose the required ports (if applicable)
EXPOSE 3000

# Set the startup command
CMD ["npm", "run", "dev"]
