FROM node:12-alpine

RUN apk add --update bash

# Setting working directory. 
WORKDIR /usr/src/app

# Installing dependencies
COPY package*.json ./
RUN npm install

# Copying source files
COPY . .

# Give permission to run script
RUN chmod +x ./wait-for-it.sh

# Build files
RUN npm run build

# Expose ports
ENV PORT=3000
EXPOSE 3000

# Import build args as envs - START #
## Database and caching ##
ARG PGHOST \
    PGPORT \
    PGUSER \
    PGDATABASE \
    PGPASSWORD
ENV DB_HOST=${PGHOST} \
    DB_PORT=${PGPORT} \
    DB_USER=${PGUSER} \
    DB_PASSWORD=${PGPASSWORD} \
    DB_NAME=${PGDATABASE}
ARG REDISHOST \
    REDISUSER \
    REDISPORT \
    REDISPASSWORD	
ENV REDIS_HOST=${REDISHOST} \
    REDIS_USER=${REDISUSER} \
    REDIS_PORT=${REDISPORT} \
    REDIS_PASSWORD=${REDISPASSWORD}
    
## Email ##
ARG MAIL_HOST \
    MAIL_PORT \
    MAIL_SECURE=true \
    MAIL_USER \
    MAIL_FROM="Recap Time Bot <shortlinks-noreply@mail.rtapp.tk>" \
    MAIL_PASSWORD
ENV MAIL_HOST=${MAIL_HOST} \
    MAIL_PORT=${MAIL_PORT} \
    MAIL_SECURE=${MAIL_SECURE} \
    MAIL_USER=${MAIL_USER} \
    MAIL_FROM=${MAIL_FROM} \
    MAIL_PASSWORD=${MAIL_PASSWORD}

## Instance config ##
ARG SITE_NAME \
    DEFAULT_DOMAIN=https://link.rtapp.tk \
    ADMIN_EMAILS \
    REPORT_EMAIL=abuse@madebythepins.tk \
    CONTACT_EMAIL=yourfriends@madebythepins.tk \
    DISALLOW_REGISTRATION=false \
    DISALLOW_ANONYMOUS_LINKS=false \
    USER_LIMIT_PER_DAY=50 \
    JWT_SECRET=securekey \
    LINK_LENGTH=6 \
    DEFAULT_MAX_STATS_PER_LINK=5000 \
    NON_USER_COOLDOWN=0
ENV SITE_NAME=${SITE_NAME} \
    DEFAULT_DOMAIN=$DEFAULT_DOMAIN} \
    ADMIN_EMAILS=${ADMIN_EMAILS} \
    REPORT_EMAIL=${REPORT_EMAIL} \
    CONTACT_EMAil=${CONTACT_EMAIL} \
    DISALLOW_REGISTRATION=${DISALLOW_REGISTRATION} \
    DISALLOW_ANONYMOUS_LINKS=${DISALLOW_ANONYMOUS_LINKS} \
    USER_LIMIT_PER_DAY=${USER_LIMIT_PER_DAY} \
    JWT_SECRET=${JWT_SECRET} \
    LINK_LENGTH=${LINK_LENGTH} \
    DEFAULT_MAX_STATS_PER_LINK=${DEFAULT_MAX_STATS_PER_LINK} \
    NON_USER_COOLDOWN=${NON_USER_COOLDOWN}

## Google APIs
## NOTE: Google Analytics are excluded due to privacy reasons. ##
# Invisible reCaptcha secret key, get one at https://www.google.com/recaptcha/intro/
ARG RECAPTCHA_SITE_KEY \
    RECAPTCHA_SECRET_KEY \
    # Google Cloud API to prevent from users from submitting malware URLs.
    # API Docs: https://developers.google.com/safe-browsing/v4/get-started
    GOOGLE_SAFE_BROWSING_KEY
ENV RECAPTCHA_SITE_KEY=${RECAPTCHA_SITE_KEY} \
    RECAPTCHA_SECRET_KEY=${RECAPTCHA_SECRET_KEY} \
    GOOGLE_SAFE_BROWSING_KEY=${GOOGLE_SAFE_BROWSING_KEY}
# Import build args as envs - END #

# Running the app
CMD [ "npm", "start" ]
