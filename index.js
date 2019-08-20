const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const bodyParser = require('body-parser');
const cookie = require('cookie-parser');
const router = require('./router');
app = express();
//加载静态资源
app.use('/',express.static('public'));
//解析request body中的数据为json格式 (post put patch 请求)
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
//加载cookie-parser中间件
app.use(cookie('mallsys'));
//加载art-template模板引擎
app.engine('art', require('art-template'));
app.set('views', __dirname + '\\views');
app.set('art engine', 'art');//注册模板引擎
//加载路由器中间件
app.use(router);
//开启服务器，监听端口7777
const server = app.listen(7777, '0.0.0.0',() => {
    console.log('the server ' + server.address().address + server.address().port+ ' is running, you can access it.');
})