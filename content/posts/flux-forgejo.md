+++
title = "Flux and Forgejo"
date = "2025-02-21T22:35:47+01:00"
tags = ["k8s", "git"]
+++

## TLDR;

How to bootstrap Flux with Forgejo.

## Context

I'm currently using a Raspberry Pi as a home lab, mainly to learn Kubernetes "the hard way" by installing and configuring as much as possible, instead of relying on managed services like EKS or GKE.
See for example my [previous post on Longhorn and Tailscale](/posts/longhorn-tailscale).

The next tool I wanted to try is [Flux](https://fluxcd.io/), a GitOps operator for Kubernetes.
Reading their [Getting started guide](https://fluxcd.io/flux/get-started/), I discovered that they [support multiple Git providers](https://fluxcd.io/flux/installation/bootstrap/), and one that I find particularly interesting for my home lab, which is Gitea.
Unfortunately, a for profit company took over the Gitea project.
Fortunately, a fork took place in the name of Forgejo (see their [Comparison with Gitea](https://forgejo.org/compare-to-gitea/)).
[Gitea is officially supported by Flux](https://fluxcd.io/flux/installation/bootstrap/gitea/) but AFAIK [Forgejo is not](https://github.com/fluxcd/flux2/discussions/4924).

As Forgejo is mainly backward compatible with Gitea (for now at least), I wanted to know if it's possible to use Forgejo instead of Gitea with Flux.
It turns out we can !

## Steps

### Install Forgejo

Installing Forgejo from the binary is quite manual but the [offical documentation](https://forgejo.org/docs/next/admin/installation-binary/) is really well written and quite easy to follow.

Once installed, I created a Forgejo personal access token and tried to bootstrap Flux with Forgejo but it failed with this error:

```
✗ failed to create Gitea client: user does not exist [uid: 0, name: ]
```

It turns out I forgot to specify the domain name where Forgejo is running, so adding the `--hostname http://hostname:3000` solved this problem, but then it returns this new error:

```
⚠️  clone failure: basic auth cannot be sent over HTTP
```

### Enable HTTPS

Ok, so now we have to enable HTTPS. 
Setting the `PROTOCOL=https` wasn't enough, and using Let's Encrypt was not possible, as I'm on a private network.
I could either use a self signed certificate (which is quite annoying as browser don't trust self-signed certificates) or set up my own PKI, which is good for learning but clearly out of scope for what I was trying to achieve (use Forgejo with Flux).

So, for now, I'm using [Tailscale to generate certificates](https://tailscale.com/kb/1153/enabling-https) via `sudo tailscale cert domain`: it isn't "home lab friendly" as I'm relying on a third party to generate my certificates but it works.
I'll probably try to install and configure a private PKI in the future but for now, I'll keep using Tailsale.

### Bootstrap

Now that HTTPS is enabled in Forgejo, I relauched the bootstrap command 

```bash
flux bootstrap gitea \
  --token-auth \
  --hostname https://hostname:3000 \
  --owner=$GITEA_USER \
  --repository=fleet-infra \
  --branch=main \
  --path=./clusters/my-cluster \
  --personal
```

and it finally worked :tada:
Following the getting started guide, I could 
* install Flux on the cluster
* add the [podinfo repository](https://github.com/stefanprodan/podinfo) to Flux
* deploy the podinfo application
* check that podinfo has been deployed

```bash
kubectl -n default get deployments,services
```

```bash
NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/podinfo   2/2     2            2           15h

NAME                 TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)             AGE
service/podinfo      ClusterIP   XX.XX.XX.XX   <none>        9898/TCP,9999/TCP   15h
```

### Contribute

The next step is to [create a PR on the Flux website repository](https://github.com/fluxcd/website/pull/2156) to mention that the Gitea bootstrap command also works with Forgejo, so that other folks know that it works.

Update: PR merged, it's now [live](https://fluxcd.io/flux/installation/bootstrap/gitea/) :tada:
