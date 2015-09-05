wrap = (fn) ->
  return (wrap f for f in fn) if Array.isArray fn

  if 'GeneratorFunction' == fn.constructor.name
    fn
  else
    (next) ->
      fn.call @, next
      yield next

module.exports = wrap
