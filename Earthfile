VERSION 0.6
FROM busybox:1
ARG DEVCONTAINER_IMAGE_NAME=andyli/onthewings_terraform_devcontainer

image:
    ARG IMAGE
    FROM ${IMAGE}

echo:
    ARG MSG
    RUN --no-cache echo $MSG

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
