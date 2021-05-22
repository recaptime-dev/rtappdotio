import React, { FC, useEffect } from "react";
import getConfig from "next/config";

import showRecaptcha from "../helpers/recaptcha";
import { useStoreState } from "../store";
import { ColCenter } from "./Layout";
import ReCaptcha from "./ReCaptcha";
import ALink from "./ALink";
import Text from "./Text";

const { publicRuntimeConfig } = getConfig();

const Footer: FC = () => {
  const { isAuthenticated } = useStoreState(s => s.auth);

  useEffect(() => {
    showRecaptcha();
  }, []);

  return (
    <ColCenter
      as="footer"
      width={1}
      backgroundColor="white"
      p={isAuthenticated ? 2 : 24}
    >
      {!isAuthenticated && <ReCaptcha />}
      <Text fontSize={[12, 13]} py={2}>
        Made with love by developers at{" "}
        <ALink href="https://github.com/thedevs-network/kutt" title="The Devs">
          The Devs
        </ALink>
        , and improved by{" "}
        <ALink href="https://madebythepins.tk" title="friends at The Pins Team">
          The Pins Team
        </ALink>
        .{" | "}
        <ALink
          href="https://github.com/MadeByThePinsHub/rtappdotio"
          title="Our fork's sauce on GitHub"
          target="_blank"
        >
          Our fork's sauce on GitHub
        </ALink>
        {" | "}
        <ALink href="/terms" title="Terms of Service">
          Terms of Service
        </ALink>
        {" | "}
        <ALink href="/report" title="Report abuse">
          Report Abuse
        </ALink>
        {publicRuntimeConfig.CONTACT_EMAIL && (
          <>
            {" | "}
            <ALink
              href={`mailto:${publicRuntimeConfig.CONTACT_EMAIL}`}
              title="Contact us"
            >
              Contact us
            </ALink>
          </>
        )}
        .
      </Text>
    </ColCenter>
  );
};

export default Footer;
