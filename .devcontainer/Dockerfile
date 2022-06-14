FROM mcr.microsoft.com/vscode/devcontainers/base:0-bionic

ARG TARGETARCH

ARG INSTALL_ZSH="false"
ARG UPGRADE_PACKAGES="false"
ARG ENABLE_NONROOT_DOCKER="true"

# Earthly doesn't work well with moby
ARG USE_MOBY="false"
# ENV DOCKER_BUILDKIT=1

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
COPY library-scripts/*.sh /tmp/library-scripts/
RUN apt-get update \
    && /bin/bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" \
    && /bin/bash /tmp/library-scripts/docker-debian.sh "${ENABLE_NONROOT_DOCKER}" "/var/run/docker-host.sock" "/var/run/docker.sock" "${USERNAME}" "${USE_MOBY}" \
    # Clean up
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/

# Setting the ENTRYPOINT to docker-init.sh will configure non-root access 
# to the Docker socket. The script will also execute CMD as needed.
ENTRYPOINT [ "/usr/local/share/docker-init.sh" ]
CMD [ "sleep", "infinity" ]

SHELL [ "/bin/bash", "-c" ]

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        bash-completion \
        make \
        jq \
        direnv \
        software-properties-common \
        build-essential \
    # Install python
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get -y install --no-install-recommends  \
        python3.9-full \
        python3.9-distutils \
        python3.9-dev \
    # Install haxe
    && add-apt-repository ppa:haxe/haxe4.2 \
    && apt-get -y install --no-install-recommends haxe=1:4.2.* \
    # Install kubectl
    && curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends kubectl \
    # Install helm
    && curl -fsSL https://baltocdn.com/helm/signing.asc | apt-key add - \
    && echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends helm \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Setup python
RUN update-alternatives --install /usr/bin/python3 python /usr/bin/python3.9 1
RUN python3 -m ensurepip --upgrade
RUN python3 -m pip install --upgrade setuptools pip

# Install ansible
RUN python3 -m pip install ansible==5.0.1 ansible-core==2.12.1 argcomplete==1.12.3
RUN activate-global-python-argcomplete

# Install aws-iam-authenticator
RUN curl -fsSL -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/${TARGETARCH}/aws-iam-authenticator \
    && chmod +x ./aws-iam-authenticator \
    && mv ./aws-iam-authenticator /usr/local/bin/

# Install AWS cli
RUN cd / \
    && curl -fsSL -o awscliv2.zip "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" \
    && unzip -qq awscliv2.zip \
    && ./aws/install \
    && rm -rf ./aws awscliv2.zip

# Install earthly
RUN curl -fsSL https://github.com/earthly/earthly/releases/download/v0.6.15/earthly-linux-${TARGETARCH} -o /usr/local/bin/earthly \
    && chmod +x /usr/local/bin/earthly
RUN earthly bootstrap --no-buildkit --with-autocomplete

# Install tfenv
RUN git clone --depth 1 https://github.com/tfutils/tfenv.git /tfenv \
    && ln -s /tfenv/bin/* /usr/local/bin
ARG TERRAFORM_VERSION=1.2.2
RUN tfenv install "$TERRAFORM_VERSION"
RUN tfenv use "$TERRAFORM_VERSION"

# Install Terraform Language Server
ARG TERRAFORM_LS_VERSION=0.28.1
RUN curl -fsSL -o terraform-ls.zip https://github.com/hashicorp/terraform-ls/releases/download/v${TERRAFORM_LS_VERSION}/terraform-ls_${TERRAFORM_LS_VERSION}_linux_${TARGETARCH}.zip \
    && unzip -qq terraform-ls.zip \
    && mv ./terraform-ls /usr/local/bin/ \
    && rm terraform-ls.zip

USER $USERNAME
WORKDIR /workspace

# Create kubeconfig for storing current-context,
# such that the workspace kubeconfig files wouldn't be touched.
RUN mkdir -p ~/.kube && install -m 600 /dev/null ~/.kube/config

# Config bash completion
RUN echo 'complete -C terraform terraform' >> ~/.bashrc \
    && echo 'source <(kubectl completion bash)' >> ~/.bashrc \
    && echo 'source <(helm completion bash)' >> ~/.bashrc \
    && echo "complete -C '/usr/local/bin/aws_completer' aws" >> ~/.bashrc

# Config direnv
COPY --chown=$USER_UID:$USER_GID ./direnv.toml /home/$USERNAME/.config/direnv/config.toml
RUN echo 'eval "$(direnv hook bash)"' >> ~/.bashrc

USER root
