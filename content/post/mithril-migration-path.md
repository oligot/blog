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

## Migration

Here are the various steps to create a shared component that support both APIs.
Note that you can also checkout [this project on Github](https://github.com/oligot/mithril-migration) which gather all the steps in a single Git project.

### From m.prop to stream

You can replace _m.prop_ with [stream](http://mithril.js.org/stream.html), which is available as a [separate npm package](https://www.npmjs.com/package/mithril-stream), which means it can be used by Mithril 0.2 and 1.x.
If you don't use a build tool (Browserify, Webpack), you can include mithril-stream just after mithril in your index.html file:

```
<script src="https://unpkg.com/mithril/mithril.js"></script>
<script src="https://unpkg.com/mithril-stream/stream.js"></script>
```

Then in your code, you can replace
```js
var prop = m.prop('');
```

with
```js
var prop = stream('');
```

### From m.startComputation/m.endComputation to m.redraw

Replace _m.startComputation_/_m.endComputation_ with _m.redraw_

### Controller

* move most of your _controller_ code to _oninit_
* call _oninit_ from _controller_

### View

Slighty change the signature of _view_ so that it supports both API
