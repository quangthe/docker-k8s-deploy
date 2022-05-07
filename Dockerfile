FROM alpine:3.15.4

# https://github.com/helm/helm/releases
ARG HELM_VERSION=v3.8.2

# https://github.com/kubernetes/kubernetes/releases
ARG KUBECTL_VERSION=v1.24.0

RUN apk --no-cache add gomplate

WORKDIR /sre

RUN wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar xz \
  && chmod +x linux-amd64/helm \
  && mv linux-amd64/helm /usr/bin/helm \
  && rm -rf linux-amd64 \
  && wget  https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -P /usr/bin/ \
  && chmod +x /usr/bin/kubectl
