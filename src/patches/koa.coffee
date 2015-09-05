Application = require 'koa'
wrap        = require '../wrap'

use = Application::use

module.exports = (A = Application) ->
  A::use = (fn) ->
    unless 'GeneratorFunction' == fn.constructor.name
      fn = wrap fn
    use.call @, fn
