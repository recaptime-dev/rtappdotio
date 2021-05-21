require("dotenv").config();
const config = new process.env;

module.exports = {
  publicRuntimeConfig: {
    CONTACT_EMAIL: config.CONTACT_EMAIL || "yourfriends@madebythepins.tk",
    SITE_NAME: config.SITE_NAME || "rtappdotio",
    DEFAULT_DOMAIN: config.DEFAULT_DOMAIN || "rtapp.io",
    RECAPTCHA_SITE_KEY: config.RECAPTCHA_SITE_KEY,
    GOOGLE_ANALYTICS: config.GOOGLE_ANALYTICS,
    REPORT_EMAIL: config.REPORT_EMAIL || "abuse@madebythepins.tk",
    DISALLOW_ANONYMOUS_LINKS: config.DISALLOW_ANONYMOUS_LINKS || "false",
    DISALLOW_REGISTRATION: config.DISALLOW_REGISTRATION || "false",
    SENTRY_PUBLIC_DSN: config..SENTRY_PUBLIC_DSN,
  }
};
