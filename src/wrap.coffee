# Wrap non-generator function(s) so they can be used safely across koa
wrap = (fn) ->
  if Array.isArray fn
    return (wrap f for f in fn)

  if 'GeneratorFunction' == fn.constructor.name
    fn
  else
    (next) ->
      fn.call @, next
      yield next

module.exports = wrap
