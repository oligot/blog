+++
date = "2014-12-24T12:38:10+01:00"
title = "Hybrid desktop application"
draft = false

+++

## Intro
What does it look like to develop a modern desktop application ? 
Traditionnaly, people think there are only 2 ways to do it :

* using proven technologies like Java or C#, you build a native application which integrates greatly with your operating system (like Word or Excel)
* using web technologies like HTML, CSS and JavaScript, you create a web application that runs inside a web browser (like Gmail or Facebook)

Well, there is actually a third approach : building native application using web technologies like HTML, CSS and JavaScript.

## Goal
This article will show you 3 tools that you can use to build such an hybrid application. We will just scratch the surface, so don't hesitate to look around for other resources (as always, Google is your friend).

## How it works
Before diving, let's first see how these tools work.
The idea is actually quite simple: you take a modern browser, you write some HTML, CSS and JavaScript files, you package the whole thing as a single binary that people can then download and run on their computer as any other desktop app.

As a side note, this technique can also be used to build native mobile applications but we won't cover it here. If you are interested, you can have a look at [Apache Cordova](http://cordova.apache.org).

So, which browser to choose from ? It turns out all the tools described here are based on [Chromium](http://www.chromium.org/Home), which is the open source project that powers [Chrome](http://www.google.com/chrome/), the popular Google web browser. 

## Tools
Let's dive in !

### Chromium Embedded Framework

The first tool is called [Chromium Embedded Framework](https://code.google.com/p/chromiumembedded/). CEF, as it's often called, allows you to embed the Chromium browser in another application. It exposes C and C++ API but third party bindings also exist for different programming languages like C#, Java or Python.

The easiest way to get started is to [download the binary distribution](http://www.magpcss.net/cef_downloads/) and read the [tutorial](https://code.google.com/p/chromiumembedded/wiki/Tutorial) to learn how to create a simple application.

![Spotify](/spotify.jpg)

While playing a bit with it, I discoverd that CEF is more a foundation framework that you build upon, than a full featured solution that you can directly consume. Depending on your needs, you may find the alternatives easier.

### Node-webkit
[Node-webkit](https://github.com/rogerwang/node-webkit) is an application runtime based on Chromium and Node.js. Despite it's name, it's not based on Webkit. Webkit was the layout engine used in Chromium but has since been replaced by [Blink](http://www.chromium.org/blink), a fork initiated by Google.

Getting started with node-webkit is really easy: download the binary for your platform, create 2 files (index.html and package.json), and run it. Another great stuff is that you'll find a [lot](http://thejackalofjavascript.com/getting-started-with-node-webkit-apps/) [of](http://code.tutsplus.com/tutorials/introduction-to-html5-desktop-apps-with-node-webkit--net-36296) [resources](http://www.sitepoint.com/building-chat-app-node-webkit-firebase-angularjs/) on the internet. You'll even find support for Web IDE like [WebStorm](https://www.jetbrains.com/webstorm/help/run-debug-configuration-node-webkit.html).

![Popcorn Time](/popcorn-time.png?nf_resize=fit&w=630)

People are also using Node.js to build entire IDE, like [Atom](https://atom.io) and [Brackets](http://brackets.io). For a comparaison of the various techniques using Node.js, feel free to read [The State of Desktop Applications in Node.js](https://nodesource.com/blog/node-desktop-applications).

### OpenFin
[OpenFin](http://openfin.co/index.html) is a contender I found while writing this article. It was build on top of Chromium Embedded Framework, but they've since decided to [directly use and extend the Chromium browser](http://blog.openfin.co/post/56138831504/why-weve-moved-on-from-chromium-embedded). They also wrote a [comparaison with CEF and Node-webkit](http://blog.openfin.co/post/94756024375/10-things-cef-and-nodewebkit-dont-do).

I wanted to try it out on my Mac but failed to find a way to download the runtime for OS X (the [download page](http://openfin.co/developers.html?url=developers/getting-started/downloading.html) only shows Windows).

![Parity One](/parity-one.jpg)

OpenFin seems to be oriented toward the financial industry, which may explain why the runtime is only available on Windows. Nevertheless, I found it odd that there are no OS X installer (even if it seems to be supported) and no Linux installer. Don't choose OpenFin if you want to build true cross plateform applications.

## Summary
The web is continuously evolving. With [ECMAScript 6](https://github.com/lukehoban/es6features#readme), [Web components](http://webcomponents.org) and [HTTP2](https://http2.github.io) just around the corner, building web applications has never been so fun. Just remember that the web is not limited to the browser: you can now build entire native applications using web technologies only, which is quite amazing if you think about it.
