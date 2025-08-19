+++
title = "Rewriting Neovim config from scratch"
date = "2025-08-15T17:53:32+02:00"
tags = ["neovim", "lua"]
+++

## TLDR;

I rewrote my Neovim config from scratch in pure Lua.

## Context

I'm using Vim / Neovim for more than 20 years now (times flies) and my config has always improved gradually.

When I switched to Neovim a few years ago, I started to use Lua to configure new plugins but kept the "old" Vim config in Vimscript just in case I wanted to switch back to Vim.
It turns out I never went back to Vim once I switched to Neovim so having a dual config in VimScript and Lua was not as beneficial as originally considered.

Moreover, I also tried some plugins / config just to see if there were really useful but never removed them, even if some of them were never used.
And every new version of Neovim came with new features that overlapped with my current config so I never really took the time to incorporate them in my config.

So, after viewing a ton of videos from the great [TJ DeVries](https://www.youtube.com/@teej_dv), and looking at the [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) repo, I decided to rewrote my Neovim config from scratch in pure Lua.

## Goals

Here are some goals I settled when rewriting my config:

* try to use the builtin features when they are available
* try to keep the number of plugins fairly minimal
* use a Lua plugin manager (lazy.nvim instead of vim-plug)
* replace telescope.nvim with fzf.lua
* use Nix instead of Mason to install global packages like LSP for the different programming languages

Thanks to these goals, I went from 1292 lines of code down to 367 lines, an impressive code reduction!
The new config is available in a [dedicated branch](https://github.com/oligot/dotfiles/tree/nvim-lua/dot_config/nvim) for now as I'm iterating on it but I intend to merge it soon in the main branch.

Another side effect of the rewrite is that Neovim now starts really fast !
Switching to the old config feels "slow" compared to the new config.
You may ask: why is it important ? Don't you start Neovim once and then leave it open ?
Well, every time I commit in Git, the commit message is written in a new Neovim instance and starting it fast is really useful as I commit fairly frequently.

## Future

Neovim will soon have a built-in plugin manager and people are already using it: [Migrating to Neovim's new built-in plugin manager](https://bower.sh/nvim-builtin-plugin-mgr).
So in the future, I may be able to remove lazy.nvim.

I may also try another theme (hello [catppuccin](https://github.com/catppuccin/catppuccin)): I'm currently using the Nord theme but this is a good opportunity to change this as well.
