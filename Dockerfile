FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install -g @medusajs/medusa-cli

# Install pnpm
RUN npm install -g pnpm

# Install dependencies
RUN pnpm install

# Bundle app source
COPY . /usr/src/app

# Make Entrypoint executable
RUN chmod +x ./develop.sh

# Expose port 9000
EXPOSE 9000

# Set environment variables
ENV JWT_SECRET="secret"
ENV COOKIE_SECRET="secret"
ENV DATABASE_TYPE="postgres"
ENV DATABASE_URL="postgres://postgres:postgres@postgres:5432/medusa-docker"
ENV REDIS_URL="redis://redis:6379"
ENV ADMIN_CORS="/http:\/\/*/"

# Paypal Payment Variables
ENV PAYPAL_SANDBOX=true
ENV PAYPAL_CLIENT_ID=
ENV PAYPAL_CLIENT_SECRET=
ENV PAYPAL_AUTH_WEBHOOK_ID=

# Set default command to start server
CMD ["./develop.sh", "start"]