+++
date = "2017-03-11T20:55:48+01:00"
title = "Mithril migration path"

+++

## TLDR;

This article describes a way to gradually migrate shared Mithril components from version 0.2 to 1.x.

## Documentation

Before we start, I have to say that Mithril has a great [migration page](http://mithril.js.org/change-log.html#migrating-from-v02x) which you should definitely check out before reading this article.
There is even a tool named [mithril-codemods](https://www.npmjs.com/package/mithril-codemods) which will automatically convert your code.

## Context

Here is the context: you've written multiple applications with Mithril 0.2 and you have extracted some of your components as npm modules so that they can be shared among your projects. 
You are now starting a new project and you'd like to use Mithril 1.x.
The question is: how do you structure your shared components so that they can be used by your new application written with Mithril 1.x and your other applications written with Mithril 0.2 ?

## Approaches

The most obvious way to solve this problem is to have two versions of the same component, one for Mithril 0.2 and another for Mithril 1.x. The problem with this approach is maintenance: everytime you change your component, you have to change it in both files. 

Another approach would be to write the component so that it is both compatible with the 0.2 and the 1.x API.
This would be quite difficult in a statically typed language as the method signatures have changed, but with JavaScript this is actually possible.

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

_m.startComputation_ and _m.endComputation_ have been removed in 1.x in favor of _m.redraw_.
Fortunately, _m.redraw_ is already available in version 0.2.
Moreover, most of the time, _m.startComputation_ was directly followed by _m.endComputation_.

Instead of writing

```js
m.startComputation();
m.endComputation();
```

You would now write

```js
m.redraw();
```

### Controller

_controller_ has been removed in 1.x in favor of _oninit_.
To support both API, one can move all _controller_ code to _oninit_ and call _oninit_ from _controller_.

Instead of writing

```js
function controller() {
     var name = stream();
     return {
        name
     }
}
```

You would now write

```js
function controller() {
    var vnode = {
      state: {}
    };
    oninit(vnode);
    return {state: vnode.state};
  }

  function oninit(vnode) {
    vnode.state.name = stream('');
  }
```

### View

The signature of _view_ has slightly changed between the two versions: the first argument (the controller) is now the vnode and also contains the component arguments (which was previously the second argument).

Instead of writing

```js
function view(ctrl, attrs) {
}
```

You would now write

```js
function view(vnode, attrs) {
    vnode.attrs = vnode.attrs /* Mithril 1.x */ || attrs; /* Mithril 0.2 */
}
```

And then use _vnode_ instead of _ctrl_ and _attrs_.

## Conclusion

While the solution isn't complete (it doesn't address all the migration points), I've used it successfully in multiple cases to have components that work with both API. 
