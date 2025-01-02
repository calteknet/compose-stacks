# Build stage
FROM node:alpine AS builder
WORKDIR /app

# Copy package files from staging directory
COPY Queen-Theresa-King-staging/package*.json ./

# Install dependencies
RUN npm install

# Copy all other files from staging directory
COPY Queen-Theresa-King-staging/ .

# Build the app
RUN npm run build

# Production stage
FROM nginx:alpine
# Copy built assets from builder
COPY --from=builder /app/build /usr/share/nginx/html
# Add nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
