FROM gitpod/workspace-full

RUN bash -lc "nvm install --lts; nvm use --lts; nvm install-latest-npm" \
    && brew install hadolint shellcheck