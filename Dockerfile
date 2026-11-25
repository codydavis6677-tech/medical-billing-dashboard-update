FROM node:20-alpine

WORKDIR /app

# Install Prisma and dependencies
COPY package.json package-lock.json* ./
RUN npm install --legacy-peer-deps

# Copy Prisma schema
COPY prisma ./prisma/

# Copy source code
COPY . .

# Generate Prisma client
RUN npx prisma generate

# Build the application
RUN npm run build

EXPOSE 3000

# Start the application
CMD ["npm", "start"]