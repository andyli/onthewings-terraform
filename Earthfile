VERSION 0.6
FROM busybox:1
ARG DEVCONTAINER_IMAGE_NAME=andyli/onthewings_terraform_devcontainer

image:
    ARG IMAGE
    FROM ${IMAGE}

devcontainer-library-scripts:
    FROM curlimages/curl:7.83.1
    WORKDIR /tmp
    RUN curl -fsSLO https://raw.githubusercontent.com/microsoft/vscode-dev-containers/main/script-library/common-debian.sh
    RUN curl -fsSLO https://raw.githubusercontent.com/microsoft/vscode-dev-containers/main/script-library/docker-debian.sh
    SAVE ARTIFACT --keep-ts *.sh AS LOCAL .devcontainer/library-scripts/

devcontainer:
    COPY .devcontainer/docker-compose.yml docker-compose.yml
    RUN grep -oE "$DEVCONTAINER_IMAGE_NAME:[a-z0-9]*" docker-compose.yml | tee IMAGE
    FROM +image \
        --IMAGE="$(cat IMAGE)"

devcontainer-build:
    ARG DEVCONTAINER_IMAGE_TAG
    FROM DOCKERFILE \
        .devcontainer \
        --DEVCONTAINER_IMAGE_NAME="$DEVCONTAINER_IMAGE_NAME" \
        --DEVCONTAINER_IMAGE_TAG="$DEVCONTAINER_IMAGE_TAG"
    SAVE IMAGE --push "$DEVCONTAINER_IMAGE_NAME:$DEVCONTAINER_IMAGE_TAG"

devcontainer-rebuild:
    RUN --no-cache date +%Y%m%d%H%M%S | tee buildtime
    BUILD \
        --platform=linux/amd64 \
        --platform=linux/arm64 \
        +devcontainer-build \
        --DEVCONTAINER_IMAGE_TAG="$(cat buildtime)"
    BUILD +devcontainer-update-refs \
        --DEVCONTAINER_IMAGE_TAG="$(cat buildtime)"

devcontainer-update-refs:
    ARG DEVCONTAINER_IMAGE_TAG
    BUILD +devcontainer-update-ref \
        --DEVCONTAINER_IMAGE_TAG="$DEVCONTAINER_IMAGE_TAG" \
        --FILE='./.devcontainer/docker-compose.yml'

devcontainer-update-ref:
    ARG DEVCONTAINER_IMAGE_TAG
    ARG FILE
    COPY "$FILE" file.src
    RUN sed -e "s#$DEVCONTAINER_IMAGE_NAME:[a-z0-9]*#$DEVCONTAINER_IMAGE_NAME:$DEVCONTAINER_IMAGE_TAG#g" file.src > file.out
    SAVE ARTIFACT --keep-ts file.out $FILE AS LOCAL $FILE

cf-terraforming:
    FROM +devcontainer
    ARG TARGETARCH
    RUN curl -fsSL https://github.com/cloudflare/cf-terraforming/releases/download/v0.5.0/cf-terraforming_0.5.0_linux_${TARGETARCH}.tar.gz | tar -C /usr/local/bin -xz cf-terraforming \
        && chmod +x /usr/local/bin/cf-terraforming
    COPY *.tf .
    ENV CLOUDFLARE_EMAIL=andy@onthewings.net
    ENV CLOUDFLARE_ACCOUNT_ID=9ea7e5ce059cce330bb0b339099e74b6
    RUN --secret CLOUDFLARE_API_KEY cf-terraforming generate --resource-type "cloudflare_record" --zone "fe07cc86b0ddbb11b6a0fb9476aba111" > cloudflare.tf
    SAVE ARTIFACT --keep-ts cloudflare.tf AS LOCAL .
    RUN --secret CLOUDFLARE_API_KEY cf-terraforming import --resource-type "cloudflare_record" --zone "fe07cc86b0ddbb11b6a0fb9476aba111" > import_cloudflare.sh
    SAVE ARTIFACT --keep-ts import_cloudflare.sh AS LOCAL .
