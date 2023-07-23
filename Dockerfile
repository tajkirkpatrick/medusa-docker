FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install -g pnpm

RUN pnpm install

COPY . /usr/src/app

RUN chmod +x ./develop.sh

EXPOSE 9000

ENV JWT_SECRET="secret"
ENV COOKIE_SECRET="secret"
ENV DATABASE_TYPE="postgres"
ENV DATABASE_URL="postgres://postgres:postgres@postgres:5432/medusa-docker"
ENV REDIS_URL="redis://redis:6379"

CMD ["./develop.sh", "start"]