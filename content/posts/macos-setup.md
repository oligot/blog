+++
title = "MacOS Setup"
date = "2025-07-21T11:42:19+02:00"
tags = ["macos", "nix"]
+++

## TLDR;

How to setup MacOS with Nix.

## Context

Being a long time Linux user, I wanted to know if I can reproduce my development environment on a brand new ARM 64 MacOS machine.

## Package Manager

MacOS doesn't have a builtin package manager, which is quite confusing when coming from the Linux world.
I already tried MacPorts and Homebrew in the past but was not convinced by them.

### Nix

This time, I wanted to try something new, namely Nix, which I already use in other projects to setup my development environment (via nix-shell).
Thanks to the package [nix-darwin](https://github.com/nix-darwin/nix-darwin), this is in fact quite powerful: you can install all the Nix packages, as well as configuring your MacOS declaratively (ex: use the Touch ID to unlock sudo).
I followed the article [Setting up Nix on macOS](https://nixcademy.com/posts/nix-on-macos/) and this works extremely well :tada:

### Config

The config I use is available here: [macosinstall](https://github.com/oligot/macosinstall). There is basically one single config file named flake.nix where you typically declare the packages you want to install, then you run one command and Nix figures out what to install:

```bash
sudo darwin-rebuild switch --flake .
```
