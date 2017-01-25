# koa-coffee

[![Greenkeeper badge](https://badges.greenkeeper.io/zeekay/koa-coffee.svg)](https://greenkeeper.io/)
Wrap non-generator functions so that koa middleware can be written more
succintly in CoffeeScript (and JavaScript). Drop-in replacement for
[koa](https://github.com/koajs/koa).

As an added bonus, includes a drop-in replacement for
[koa-router](https://github.com/alexmingoia/koa-router) as well.

## Usage
Require `koa-coffee/koa` wherever you want to use koa. `koa-coffee/router` is
aliased to a patched koa-router as well.

```coffeescript
app    = do require 'koa-coffee/koa'
router = do require 'koa-coffee/router'

# A typical handler will explicitly yield something to avoid koa exploding...
router.get '/foo', ->
  @body = 'foo'
  yield return

# ...or
router.get '/foo', (next) ->
  @body = 'foo'
  yield next

# ...that is no longer necessary
router.get '/bar', ->
  @body = 'bar'

app
  .use(router.routes())
  .use(router.allowedMethods())

app.listen 3000
```
