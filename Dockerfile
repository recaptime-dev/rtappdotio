FROM node:16-alpine

# Only used for Railway to force-rebuild minus the cache.
ENV LAYER_CACHE=1

RUN LAYER_CACHE=$LAYER_CACHE apk add --no-cache --update bash coreutils

# Setting working directory.
WORKDIR /app

# Installing dependencies (ensuring that package-lock.json is up-to-date)
COPY package*.json ./
RUN LAYER_CACHE=$LAYER_CACHE npm cache clean --force && npm install --package-lock

# Copying source files
COPY . .

# Build files
RUN LAYER_CACHE=$LAYER_CACHE npm run build

# Expose ports
ENV PORT=3000
EXPOSE 3000

# Running the app
CMD [ "/app/start-rtappdotio" ]
