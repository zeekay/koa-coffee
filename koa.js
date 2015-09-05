var Application = require('koa');

(require('./lib/patches/koa'))(Application);

module.exports = Application;
