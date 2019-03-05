+++
title = "Moving to a static site generator"
draft = false
date = "2017-02-17T20:54:24+01:00"

+++

Until a few days ago, I was using [Ghost](https://ghost.org) as a blogging platform.
While the project is great, maintaining it is not so great: you have to (sometimes) update Node.js, install new dependencies, update the database, ...
While all these tasks are quite easy, you have to do it every time there is a new release, which is quite cumbersome for a simple blog like this one.

Recently, I've been looking for an alternative, and quickly found static site generators.
There are quite a lot of them (there is even a [dedicated website](https://www.staticgen.com) to choose from).
I wanted something that was relatively easy to install and decided to test [Hugo](http://gohugo.io) which corresponded to my needs.
Being written in Go, starting Hugo is really fast (I've worked with Node.js tools for the past years and the difference is quite huge).

Migrating to Hugo was relatively easy, as articles are written in Markdown just like Ghost.
Most of the time was actually finding a theme.
I'm still not 100% satisfied with the result but at the end of the day, the content of a blog is what really matters.

One nice benefit of a static site generator is that I can now write my articles in Vim on my local computer.
While there is a [Ghost desktop application](https://blog.ghost.org/desktop/), I still prefer to use this old and venerable Vim text editor to write code (and now articles).
So hopefully, I'll be writing more articles now (even if finding time is still a challenge for me).

Anyway, here we are, with a (mostly) static site powered by Hugo.
Until the next time !
