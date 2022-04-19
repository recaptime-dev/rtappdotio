# Custom domains for your shortlinks

> Currently work in progress, we'll update you once we're ready.

## Manual

1. Point your custom domain's CNAME records to `rtappdotio.up.railway.app` (`rtapp.tk`) or `rtappdotio-development.up.railway.app` (`dev.rtapp.tk`).
2. Visit your account settings page and add the domsin. Optionally, set an homepage if you don't like to point into the homepage. (e.g. our abuse report form: <https://reportabuse.rtapp.tk/url-shortener>)
3. Request your custom domain to be added into our projrct's custom domains [here](https://github.com/RecapTime/rtappdotio-custom-domains/issues).

## Allow us to manage your DNS records

### Allow access into your DNS records

* Cloudflare:
   * Go to your Cloudflare account that has `Super Admin` permission.
   * Click `Members`
   * Enter `custom-domains-support@rtapp.tk` to the box and hit **Invite**.
   * Then go back to GitHub and comment `/verify cloudflare-shared-access` to notify humans. This may take up to 72 hours for us to accept the invite and atleast 30 minutes for adding DNS records and doing checks.
* Netlify:
   * 

### Completely let us handle the rest

#### Cloudflare

To use our Cloudflare nameservers, go to your domain registar to change your nameservers into these:

```
null.ns.cloudlfare.com
```

```
null.ns.cloudflate.com
```

If you're currently an Cloudflare user, please invite us instead to keep your DNS records and settings.


#### Netlify

Since Netlify uses DNS1 as their nameservers, contact us first using
