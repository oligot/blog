+++
title = "Building ARM containers with Podman"
date = "2025-03-23T13:59:07+01:00"
tags = ["podman", "arm"]
+++

## TLDR;

How to build ARM containers with Podman.

## Context

ARM architecture is a hot topic for me right now.
It all started with the Raspberry Pi (obviously), followed by the Apple M1 processor, and lately the [AWS Graviton Processors](https://aws.amazon.com/ec2/graviton/).

Despite all the buzz around it, docker images are not really universal: an amd64 image won't work out of the box on an ARM processor.
This article describes how to build ARM containers using Podman instead of Docker.

## Steps

### Build

To build [multi-arch images with Podman](https://blog.while-true-do.io/podman-multi-arch-images/), one can use the `--platform` flag.

```bash
podman build --platform linux/amd64,linux/arm64 --manifest localhost/myapp .
```

This resulted in the following error on my Arch Linux machine:

```
[linux/arm64] STEP 6/8: RUN uv sync --frozen
exec container process `/bin/sh`: Exec format error
```

The fix was not easy to find, as it was "hidden" in a [comment on a Github issue](https://github.com/containers/podman/issues/13924#issuecomment-1103434554), but it turns out that I needed to install [`qemu-user-static`](https://archlinux.org/packages/extra/x86_64/qemu-user-static/) and [`qemu-user-static-binfmt`](https://archlinux.org/packages/extra/x86_64/qemu-user-static-binfmt/) on my machine.

Once installed, I was able to build multi-arch images with Podman :tada:

### Publish

To publish the manifest and the images to a private registry, we first need to install one (at least in a homelab setup).

I followed the excellent article [Creating a private http Docker registry on Kubernetes](https://rpi4cluster.com/k3s-docker-registry/) but once finished, I discovered that Forgejo comes with a [built-in container registry](https://forgejo.org/docs/latest/user/packages/container/) but it didn't worked for me (making it work could be a great subject for another article).

Note also that by default, Podman forbid publishing images to insecure registries that only listen on HTTP.
To bypass this restriction (start with enabling HTTPS if you can), one can [add the insecure registry to the Podman configuration file](https://williamlieurance.com/insecure-podman-registry/).

We can then finally push the image to the registry with:

```bash
podman manifest push localhost/myapp:latest docker-registry-url/myapp
```

Next step: automate the building and publishing parts and trigger them from a CI pipeline.
