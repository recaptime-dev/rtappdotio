# Reporting security-related issues

We value security seriously, so we want you to disclose security vulnerabilities in an responsible way. This document will detail about the do's and don'ts, how to contact us and things you should include in your report.

## Acceptable Cases

* Built-in Shortened Link Stats
* hCaptcha/reCaptcha v3 Implementation
* Password Protection on Shortlink
* Prvillege Esclation on API endpoints

## Unacceptable Cases

* Denial-of-Service / DNS posioning attacks
* Brute-force attacks
* Social engineering attacks

## How to report?

[Submit through our Hacker One page]() or email <security@madebythepins.tk> and we'll try to deploy an fix as soon as possible.

If you made an fix, please submit an PR after we've evaluated and approced your report. We'll then make an security advisory regarding that.
Any issues that doesn't affect our Kutt instance should be directed at one of our dependencies' maintainers instead. If the issue affects both this repo and the upstream, please contact the upstream maintainers instead.

## Do's amd Don'ts

**DO THESE**:
* provide as much information as possible, including any reproduicibility information when ran in an self-hosted instance
* attach logs and screenshots of the vunlerability
* submit the security report in English

**DO THESE, BUT THEY'RE OPTIONAL**:
* send an working, production-ready patch as an PR (we recommend to do it after the investigation)

**DO NOT DO THESE**:
* submit an report that only affects one of dependencies we use OR both affects this fork and the upstream
* submit an abuse report, you should use [this form]() instead
* submitting in non-Englisj language, we only speak English
