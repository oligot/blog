+++
title = "Longhorn and Tailscale"
date = "2025-02-05T10:36:23+01:00"
tags = ['k8s', 'tailscale']
+++

## TLDR;

How to expose the Longhorn UI through Tailscale.

## Context

[Longhorn](https://longhorn.io/) is a cloud native distributed block storage system for Kubernetes.
To access their [web UI](https://longhorn.io/docs/1.8.0/deploy/accessing-the-ui/), we have to create an Ingress to allow external traffic to reach the Longhorn UI.
The documentation uses the [Nginx Ingress Controller](https://kubernetes.github.io/ingress-nginx/), but as I'm using Tailscale instead, I wanted to see if it's possible to expose the Longhorn UI to my [tailnet](https://tailscale.com/kb/1136/tailnet). It turns out it is possible, and here is how to do it.

## Documentation

First, you have to [setup the Tailscale Kubernetes operator](https://tailscale.com/kb/1236/kubernetes-operator#setting-up-the-kubernetes-operator).


Follow the Longhorn documentation to [create an Ingress](https://longhorn.io/docs/1.8.0/deploy/accessing-the-ui/longhorn-ingress/), and change the `ingressClassName` from nginx to tailscale, as explained in [Exposing cluster workloads using a Kubernetes Ingress](https://tailscale.com/kb/1439/kubernetes-operator-cluster-ingress#ingress-resource):
```diff
- ingressClassName: nginx
+ ingressClassName: tailscale
```

Create the Ingress with:
```bash
kubectl -n longhorn-system apply -f longhorn-ingress.yml
```

Wait a few moment for the Ingress to be created, and then run:

```bash
kubectl get ingress -n longhorn-system
NAME               CLASS       HOSTS   ADDRESS                                                      PORTS   AGE
longhorn-ingress   tailscale   *       longhorn-system-longhorn-ingress-ingress.tailxxxxxx.ts.net   80      2d5h
```

You can now access the Longhorn UI at the address shown above (to be replaced, this is a template response) :tada:
