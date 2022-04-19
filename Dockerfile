FROM node:16-alpine

# Only used for Railway to force-rebuild minus the cache.
ARG LAYER_CACHE=1
ENV LAYER_CACHE=$LAYER_CACHE
# apk add is needed for our script to be working
RUN LAYER_CACHE=$LAYER_CACHE apk add --no-cache --update bash coreutils dumb-init

# Set working directory to /app
WORKDIR /app

# Install Node.js dependencies with npm (ensuring that package-lock.json is up-to-date)
COPY package*.json ./
RUN LAYER_CACHE=$LAYER_CACHE npm cache clean --force && npm install --package-lock

# After that, copy the rest of the codebase
COPY . .

# Build-time envvars for npm run build, especially you don't want to pay more if
# FORCE_REBUILD_CLIENT is set to 1 and you're on Railway's free plan and don't have money yet.
# Contact and Abuse Report Emails
ARG CONTACT_EMAIL="hi@rtapp.tk"
ARG REPORT_EMAIL="abuse@rtapp.tk"
# Whenever generating shortlinks on anonymous users and registration should be allowed
ARG DISALLOW_ANONYMOUS_LINKS="false"
ARG DISALLOW_REGISTRATION="false"
ARG SITE_NAME="rtapp.io"
# Depending on our DNS provider, we can't just add an CNAME to root record, unless
# ANAMEs or CNAME flattening is supported.
ARG DEFAULT_DOMAIN="https://prod.rtapp.tk"
# The From address we're using
ARG MAIL_FROM_ADDRESS="noreply@mail.rtapp.tk"
# Google Analytics and ReCaptcha stuff
# We'll work to switch to hCaptcha and Ackee in the future.
ARG RECAPTCHA_SITE_KEY
ARG GOOGLE_ANALYTICS
# Sentry DSN
ARG SENTRY_PUBLIC_DSN

# Build files
RUN LAYER_CACHE=$LAYER_CACHE npm run build

# Expose ports
ENV PORT=3000
EXPOSE 3000

# Running the app
ENTRYPOINT [ "dumb-init" ]
CMD [ "/app/start-rtappdotio" ]
