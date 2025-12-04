+++
title = "Switching from Linux to MacOS"
date = "2025-11-11T19:29:10+01:00"
tags = ["macos", "linux"]
+++

## TLDR;

I've switched from ArchLinux to MacOS and it's been smoother than I initially thought.

## Context

I've been using Linux for more than 20 years and used a bunch of distributions in the past: Ubuntu, Fedora, Gentoo (yay, building those packages from sources with flags...), and last but not least ArchLinux (stock + derivates like Manjaro and EndeavourOS).

I recently had the opportunity, both personally and professionally, to switch to MacOS. As a long time Linux user, my first reaction was "no way", I'm using Linux for so long, my muscle memories are too strong to change.

And then something clicked: most of the tools I use on Linux are actually cross platform programs (mainly [modern Unix CLI](https://github.com/ibraheemdev/modern-unix) + some GUI like Firefox) which are also available on MacOS.
And MacOS being Unix based (like Linux), I should feel mostly at home.

## Show stoppers

There were still two main show stoppers: tiling window manager (i3 in my case) and a really great package manager (pacman on ArchLinux). 

### Tiling window manager

There are some tiling window manager on MacOS and after a bit of research, I choose to use Aerospace, after viewing this particular video: [Aerospace Is The Best Tiling Window Manager I've Tried On macOS](https://www.youtube.com/watch?v=-FoWClVHG5g).

But after using it a bit, it was not as smooth as I was used to with i3. Reading the video comments, I discovered that the author switched to another technique which work without using a dedicated tiling window manager: [This Simple macOS Window Management Workflow Is All I Need](https://www.youtube.com/watch?v=DBifQv9AYhc).
The basic idea is that most of the time, I'm using a single maximized window and I want to be able to quickly switch between apps without using Alt + Tab. And when I'm on a big screen, I have 2 applications side by side (terminal on the left, browser on the right).
And this can be done with a single program named [Raycast](https://www.raycast.com/) (the one I use but there are other options too).

### Package manager

Once you are used to a great package manager like Pacman on ArchLinux, it's very difficult to switch to another OS that doesn't have a native package manager.
However, the Nix package manager is available on MacOS and works really well.
I already covered this in a [previous blog post]({{< ref "posts/macos-setup.md" >}}) so feel free to read it if you want to learn more about it.

The purist could also say that declarative is better than iterative but I assume it's also doable with other package managers, using tools like Ansible for example.

## Future

Now that I'm productive on MacOS, the next step is to see if I can ditch Tmux and use the native functionality available in modern terminals like Ghostty, Wezterm, and Kitty:

- [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim) which would replace [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [combining Ghostty with hammerspoon](https://github.com/ghostty-org/ghostty/discussions/2353#discussioncomment-13963141) to switch between windows / panes
