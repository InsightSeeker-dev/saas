# Development
FROM node:lts AS development
WORKDIR /app
COPY package*.json ./
RUN npm install
EXPOSE 3000

# Production
FROM node:lts AS production
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm run build && npm install --production
EXPOSE 3000
ENV NODE_ENV=production
CMD ["node", ".output/server/index.mjs"]
