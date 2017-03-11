+++
date = "2017-03-11T20:55:48+01:00"
title = "Mithril migration path"
draft = true

+++

## TLDR;

This article describes a way to gradually migrate shared Mithril components from version 0.2 to 1.x.

## Documentation

Mithril has a great [migration page](http://mithril.js.org/change-log.html#migrating-from-v02x) which you should definitely check out before reading this article.
There is even a tool named [mithril-codemods](https://www.npmjs.com/package/mithril-codemods) which will automatically convert your code.

## Context

Here is the context: you've written multiple applications with Mithril 0.2 and you have extracted some of your components as npm modules so that they can be shared among your projects. 
You are now starting a new project and you'd like to use Mithril 1.x.
The question is: how do you structure your shared components so that they can be used by your new application written with Mithril 1.x and your other applications written with Mithril 0.2 ?

## Approach

* move most of your _controller_ code to _oninit_
* call _oninit_ from _controller_
* slighty change the signature of _view_ so that it supports both API
