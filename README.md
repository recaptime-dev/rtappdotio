# Source code for rtapp-link-shortener service (rtapp.tk/rtapp.io)

This repo contains the source code for our Kutt instance on [rtapp.tk](https://rtapp.tk), based on [Kutt.it source code](https://github.com/thedevs-network/kutt) by [friends at The Devs Network](https://github.com/thedevs-network).

While our Kutt instance is used internally for our social posts and placing links with spoilers under an link shortener in Recap Time newsletter issues, you can register for an account and create links.

[![Contributions](https://img.shields.io/badge/contributions-welcome-brightgreen.svg)](https://github.com/MadeByThePinsHub/rtappdotio/#contributing)
[![GitHub license](https://img.shields.io/github/license/thedevs-network/kutt.svg)](https://github.com/MadeByThePinsHub/rtappdotio/blob/develop/LICENSE)

## Table of Contents

- [Instance Information](#instance-information)
- [Key Features](#key-features)
- [Stack](#stack)
- [Setup](#setup)
- [Browser Extensions](#browser-extensions)
- [API](#api)
- [Integrations](#integrations)
- [3rd Party Packages](#3rd-party-packages)
- [Donate](#donate)
- [Contributing](#contributing)

## Instance Information

- **Instance domains**: <https://dev.rtapp.tk> (dev branch), <https://rtapp.tk> (stable)
- **Hosting Provider and type**: Railway - PaaS (Dockerized containers)
- **Plan**: Free (managed on our shared account, soon to be moved to paid team)
- **DNS and CDN provider**: Cloudflare, as usual
- **Contact email**: <yourfriends@madebythepins.tk>
- **Abuse Team contacts**: <abuse@madebythepins.tk> and <https://reportabuse.rtapp.tk> (soon)
- **Adminstration contacts**:
  - [Andrei Jiroh](
- **ToS**: <https://legal.madebythepins.tk/link-shortener/tos/legalese>
- **Privacy info**:
  - Full text: <>
  - Third-party services we use in website:
    - Google APIs: Safe Browsing API
    - hCaptcha (will implemented soon)

## Key Features

- Free and open source.
- Custom domain support.
- Custom URLs for shortened links
- Set password for links.
- Set description for links.
- Expiration time for links.
- Private statistics for shortened URLs.
- View, edit, delete and manage your links.
- Admin account to view, delete and ban links.
- Ability to disable registration and anonymous link creation for private use.
- RESTful API.

## Stack

- Node (Web server)
- Express (Web server framework)
- Passport (Authentication)
- React (UI library)
- Next (Universal/server-side rendered React)
- Easy Peasy (State management)
- styled-components (CSS styling solution library)
- Recharts (Chart library)
- PostgreSQL (database)
- Redis (Cache layer)
- Docker (containerization for deploying to Railway, and formerly on Divio)

## Setup

### Manual

You need to have [Node.js](https://nodejs.org/), [PostgreSQL](https://www.postgresql.org/) and [Redis](https://redis.io/) installed.

1. Clone this repository with `git clone git://github.com/MadeByThePinsHub/rtappdotio`.
2. Copy `.example.env` to `.env` and fill it properly ([see below](#configuration)).
3. Install dependencies: `npm install`.
4. To run in dev mode, run `./start-rtappdotio dev` or `npm run dev` Otherwise, run `./start-rtappdotio prod` or `npm start`
  * Postgres database migrations aren't included when using `npm start` or `npm run dev`, so please use the `start-rtappdotio` script or do `npm run migrate` first

### Docker

#### With Compose

Download the [`docker-compose.yml`](docker-compose.yml) and the [`.docker.env`](.docker.env)-file from the repository and configure the `.docker.env` ([see below](#configuration)). 
To execute Kutt you simply have to run `docker-compose up -d` command and then the app should be ready on port "3000".

The `docker-compose.yml` configuration uses our own Kutt image available on [GitHub Container Registry](https://ghcr.io/MadeByThePinsHub/rtappdotio), with mirrors on [Red Hat Quay Registry](https://quay.io/MadeByThePinsHub/rtappdotio) and [Docker Hub](https://hub.docker.com/MadeByThePinsHub/rtappdotio)

#### With vanila Docker

* Pull the Docker image first into your machine. Use the same command if you need to update.

```
# latest tag is same as develop, so please use the stable tag instead
# if Docker Hub is down or want to use other registries, prefix
# either quay.io/ or ghcr.io/ to the image name.
docker pull MadeByThePinsHub/rtappdotio:latest
```
* Then repeat step 2 in manual setup for configuring the instance.
* And then, run `npm run docker:prod` (uses the remote image with `stable` tag from GHCR) or `npm run docker:dev` (uses the `develop`.
* If you prefer to build the image, do `npm run docker:build` then `npm run docker:start` (production mode will br used by default)

#### With Railway

TODO

### Configuration

For the minimal configuration the following settings have to be changed in the `.env`-file:

- **DEFAULT_DOMAIN**: The domain of your kutt instance
- **DB_**: The DB credentials (when you use docker-compose you can skip these)
- **ADMIN_EMAILS**: A comma-separated list of the administrator-accounts
- **RECAPTCHA_**: Get your reCaptcha v3 API keys or delete this setting if you don't want to use it. We're working on adding hCaptcha soon.
- **MAIL_**: Enter the SMTP-server's credentials (The experience shows SSL works better than STARTTLS; The mail config is required to easily create accounts, see [this comment](https://github.com/thedevs-network/kutt/issues/269#issuecomment-628604256) how it can be done manually)
- **REPORT_EMAIL**: Kutt offers a form to report malicious links which are sent to this mail-address

## Browser Extensions

Download the official Kutt extension for web browsers via below links. You can also find the source code on [kutt-extension](https://github.com/abhijithvijayan/kutt-extension).

- [Chrome](https://chrome.google.com/webstore/detail/kutt/pklakpjfiegjacoppcodencchehlfnpd)
- [Firefox](https://addons.mozilla.org/en-US/firefox/addon/kutt/)

After installing the extension, you need to point into our instance at either `rtapp.tk` (`rtapp.io` soon) for the production branch (`stable`) or `dev.rtapp.tk` (`dev.rtapp.io` soon) for the development branch (`develop`)

## API

Visit API v2 documentation [here](https://docs.rtapp.tk).

## Integrations

### ShareX

You can use Kutt as your default URL shortener in [ShareX](https://getsharex.com/). If you host your custom instance of Kutt, refer to [ShareX documentation in the upstream project](https://github.com/thedevs-network/kutt/wiki/ShareX) on how to setup.

### Alfred Workflow

Download Kutt's official workflow for [Alfred](https://www.alfredapp.com/) app from [alfred-kutt](https://github.com/thedevs-network/alfred-kutt) repository.

## 3rd Party packages
| Language   | Link                                                                              | Description                                        |
| ---------- | --------------------------------------------------------------------------------- | -------------------------------------------------- |
| C# (.NET)  | [KuttSharp](https://github.com/0xaryan/KuttSharp)                                 | .NET package for Kutt.it url shortener             |
| Python     | [kutt-cli](https://github.com/RealAmirali/kutt-cli)                               | Command-line client for Kutt written in Python     |
| Ruby       | [kutt.rb](https://github.com/RealAmirali/kutt.rb)                                 | Kutt library written in Ruby                       |
| Rust       | [urlshortener](https://github.com/vityafx/urlshortener-rs)                        | URL shortener library written in Rust              |
| Rust       | [kutt-rs](https://github.com/robatipoor/kutt-rs)                                  | Command line tool written in Rust                  |
| Node.js    | [node-kutt](https://github.com/ardalanamini/node-kutt)                            | Node.js client for Kutt.it url shortener           |
| JavaScript | [kutt-vscode](https://github.com/mehrad77/kutt-vscode)                            | Visual Studio Code extention for Kutt              |
| Java       | [kutt-desktop](https://github.com/cipher812/kutt-desktop)                         | A Cross platform Java desktop application for Kutt |
| Go         | [kutt-go](https://github.com/raahii/kutt-go)                                      | Go client for Kutt.it url shortener                |
| BASH       | [GitHub Gist](https://gist.github.com/hashworks/6d6e4eae8984a5018f7692a796d570b4) | Simple BASH function to access the API             |
| BASH       | [url-shortener](https://gitlab.tim-peters.org/tim/url-shortener)                  | Simple BASH script with GUI                        |

## Donate/Support

[Support us](https://donate.madebythepins.tk) to help us maintain projects like these and keep developers motivated and happy.

An portion of donations we receive from one-time and recurring support from you will be used to keep the upstream project's instance online and support The Devs Network's team members in general, as an way of giving back to open-source projects we use and love.

If you prefer to donate directly, their BTC wallet is `1P89WxNTinKxxDQ4FmC4jis3KUdfA9fLJB`
`

## Contributing

Pull requests are welcome. You'll probably find lots of improvements to be made.

Open issues for feedback, requesting features, reporting bugs or discussing ideas

Any issues or PRs related to the main instance (<kutt.it>) or the upstream will be closed and asked to submit there.

Special thanks to [Pouria](https://github.com/poeti8), [Thomas](https://github.com/trgwii) and [Muthu](https://github.com/MKRhere) for maintaining Kutt.
