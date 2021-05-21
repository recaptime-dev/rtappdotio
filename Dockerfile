FROM node:14-alpine

RUN apk add --update bash coreutils

# Setting working directory.
WORKDIR /usr/src/app

# Installing dependencies
COPY package*.json ./
RUN npm install

# Copying source files
COPY . .

# Build files
RUN npm run build

# Expose ports
ENV PORT=3000
EXPOSE 3000

# Running the app
CMD [ "/usr/src/app/start-rtappdotio" ]
