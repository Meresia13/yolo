# Stage 1: Build the application
FROM node:16-alpine as build


# Set the working directory inside the container
WORKDIR /app/client


# Copy package.json and package-lock.json
COPY ./package*.json ./


# Install all dependencies including devDependencies
RUN npm install


# Copy the rest of the application code
COPY . .


# Build the application
RUN npm run build


# Stage 2: Create the production image
FROM node:16-alpine


# Set the working directory inside the container
WORKDIR /app/client


# install the serve to run the app
RUN npm install -g serve


# Copy the build artifacts from the previous stage
COPY --from=build /app/client/build ./build
COPY --from=build /app/client/package.json /app/client/package-lock.json ./


# Expose port 3000
EXPOSE 3000


# Command to run the React app
CMD ["serve", "-s", "build"]
