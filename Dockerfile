FROM node:18 AS builder
WORKDIR /app
COPY package.json ./
RUN npm install
COPY src/ ./src


FROM node:18-slim
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/src ./src
COPY package.json .
CMD ["node", "src/server.js"]
