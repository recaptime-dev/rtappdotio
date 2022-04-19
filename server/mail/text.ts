/* eslint-disable max-len */
export const verifyMailText = `You're attempting to change your email address on {{site_name}}.

Please verify your email address using the link below. If you didn't request this, your account maybe compromised. If so, please change your password through the Setting page.

https://{{domain}}/verify/{{verification}}`;

export const changeEmailText = `Thanks for creating an account on {{site_name}}.

Please verify your email address using the link below.

https://{{domain}}/verify-email/{{verification}}`;

export const resetMailText = `Somebody, probably you, has jsut requested an password reset for your account.

Please click on the button below to reset your password. There's no need to take any action if you didn't request this.

https://{{domain}}/reset-password/{{resetpassword}}`;
