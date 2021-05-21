FROM node:14-alpine

# Only used for Railway to force-rebuild minus the cache.
ENV LAYER_CACHE=1

RUN LAYER_CACHE=$LAYER_CACHE apk add --no-cache --update bash coreutils

# Setting working directory.
WORKDIR /app

# Installing dependencies
COPY package*.json ./
RUN LAYER_CACHE=$LAYER_CACHE npm install

# Copying source files
COPY . .

# Build files
RUN LAYER_CACHE=$LAYER_CACHE npm run build

# Expose ports
ENV PORT=3000
EXPOSE 3000

# Running the app
CMD [ "/app/start-rtappdotio" ]
