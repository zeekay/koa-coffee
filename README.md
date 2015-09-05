# koa-coffee
Wrap non-generator functions so that koa middleware can be written more
succintly in CoffeeScript (and JavaScript). Drop-in replacement for koa.

As an added-bonus, included drop-in replacement for koa-router as well.

## Usage
```coffeescript
app    = do require 'koa-coffee/koa'
router = do require 'koa-coffee/router'

# A typical handler will explicitly yield something to avoid koa exploding...
router.get '/foo', ->
  @body = 'foo'
  yield return

# ...but it's no longer necessary!
router.get '/bar', ->
  @body = 'bar'

app
  .use(router.routes())
  .use(router.allowedMethods())

app.listen 3000

```
