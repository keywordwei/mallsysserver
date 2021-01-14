# 校园淘后台管理系统(含node后台代码+React打包后代码)
## 技术栈(Node.js+Express+Mysql)
- 使用基于node.js的框架express来处理请求，搭建服务器；数据库采用Mysql连接池的方式来设置最多连接数管理数据库连接；使用`promise`、`async`、`await`来避免后台查询出现回调地域。
- Express中使用了`body-parser`、`multer`、`md5`、`cookie-parser`等第三方中间件处理post请求、文件上传、密码加密、处理cookie信息。同时不可缺少的使用了应用程序级中间件、路由器级中间件、内置中间件（`express.static()`），使用ffmpeg处理视频文件捕捉视频帧。
- 该系统未涉及较为复杂的Sql语句，使用左外连接同时删除一级和二级分类。
- 此数据库表共有表完全按照之前已完成的商城系统一致，故能实现后台管理校园淘用户界面信息。
