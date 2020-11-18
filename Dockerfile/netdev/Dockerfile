FROM python:3.7-slim as BUILDER

ARG BUILD_DATE="2020-11-16"
ARG BUILD_VERSION="1.0.0"
ARG VCS_REF="master"

WORKDIR /tmp

# FROM python:3.7-slim AS compile-image
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential gcc wget git

RUN useradd -md /home/netdev -s /bin/zsh -u 1000 netdev
USER netdev

ENV PATH=$PATH:/home/netdev/.local/bin
COPY requirements.* /tmp/
RUN pip3 install --upgrade pip
RUN pip3 install --user -r requirements.txt
RUN ansible-galaxy collection install -r requirements.yml

FROM python:3.7-slim as BASE

LABEL maintainer="Ryan Merolle"
LABEL com.example.version="1.0.0"
LABEL com.example.release-date="2020-11-18"

ENV DEBIAN_FRONTEND noninteractive
ENV PROJECT_DIR /projects/

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    git \
    git-extras \
    less \
    netcat \
    make \
    openssh-client \
    sshpass \
    vim \
    wget \
    zsh \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

RUN useradd -md /home/netdev -s /bin/zsh -u 1000 netdev
USER netdev

# Copy python collection
COPY --from=BUILDER /home/netdev/.local/ /home/netdev/.local
ENV PATH=$PATH:/home/netdev/.local/bin

# Install Oh My ZSH to provide improved shell
RUN wget --quiet https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true \
    && echo 'plugins=(ansible common-aliases safe-paste git jsontools history git-extras)' >> $HOME/.zshrc \
    && echo 'eval `ssh-agent -s`' >> $HOME/.zshrc \
    && echo 'export TERM=xterm' >>  $HOME/.zshrc \
    && echo 'export PATH=$PATH:/home/netdev/.local/bin' >> $HOME/.zshrc

# Set default folder
WORKDIR /projects
VOLUME ["/projects"]

# Use ZSH as default shell with default oh-my-zsh theme
USER root
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
CMD [ "/bin/entrypoint.sh" ]
