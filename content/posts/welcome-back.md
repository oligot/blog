---
title: "Welcome Back"
date: 2025-01-31T09:48:24+01:00
---

It's been a long time but I'm back now !
A lot has changed since my last post (8 years ago), both personally and professionally.

Regarding this blog, it's still powered by Hugo but a few things have changed, notably:
- I've moved from Netflify to Github Pages (more on this below)
- I've switched from Gandi to OVH for the domain name
- I've switched from Vim to Neovim as my main editor, and rewrote my config in Lua
- I'm using Nix to manage my development environment (still need to use it for Github Actions)

## Netlify

I used to use Netlify Large Media to store my images.
When cloning this blog on a new machine, this error occurred:

```bash
Error downloading object: ... (...): Smudge error: Error downloading ... (...): batch response: Repository or object not found: https://....netlify.com/.netlify/large-media/objects/batch
Check that it exists and that you have proper access to it
```

It turns out that [Netlify Large Media has been deprecated](https://docs.netlify.com/git/large-media/overview/) and I can't retrieve my images anymore.
Fortunately, those images were only used on one of my blog.
Following this incident, I searched for an alternative and chose Github Pages, as I'm already hosting the source code on Github (and they also support [Git LFS](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-git-large-file-storage) which I don't currently use, but who knows).
The migration was quite smooth: I even found [multiple](https://da-sha1.me/configuration/2019/03/03/redirect-custom-domain-to-github-pages.html) [articles](https://medium.com/@rayan.khalilsebbar/github-pages-custom-domain-with-ovhcloud-5c66b13314e1) on how to use OVH custom domain with Github Pages.

## Blogumentation

I've recently read this great article named [Blogumentation](https://www.jvt.me/posts/2017/06/25/blogumentation/), namely writing blog posts as a method of documentation.
I find this method very interesting: in fact, some of my blog posts are already blogumentation, and this motivates me to write more posts (not really hard when you haven't write anything in 8 years).
More to come in the near future !
