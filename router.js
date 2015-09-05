var Router = require('koa-router');

(require('./lib/patches/router'))(Router);

module.exports = Router;
