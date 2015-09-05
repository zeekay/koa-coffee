Router = require 'koa-router'
wrap   = require '../wrap'

register = Router::register
use      = Router::use

module.exports = (R = Router) ->
  # patch middleware registration
  R::register = (path, methods, middleware, opts) ->
    register.call @, path, methods, (wrap middleware), opts

  # patch use
  R::use = (path, middleware) ->
    if middleware?
      use.call @, path, (wrap middleware)
    else
      use.call @, (wrap middleware)
