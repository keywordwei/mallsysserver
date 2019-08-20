//图片存储地址
const path = require('path');
const FILE_URL = 'http://localhost:7777/upload/';
//const FILE_URL = 'http://106.14.121.224:7777/upload/';
//const hostname  = '106.14.121.224';
const FILE_DIR = path.join(__dirname, '..', 'public/upload/');
module.exports = {
    FILE_URL,
    FILE_DIR,
    hostname
}