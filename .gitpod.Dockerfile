FROM gitpod/workspace-full:latest

RUN bash -lc "source ~/.nvm/nvm-lazy.sh && nvm install --lts && nvm use --lts && nvm install-latest-npm"
RUN brew install hadolint shellcheck
RUN sudo install-packages gettext