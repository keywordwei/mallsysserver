/*
处理文件上传的路由
 */
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const constantObj = require('../utils/constants');
const ffmpegInstaller = require('@ffmpeg-installer/ffmpeg');
const ffmpeg = require('fluent-ffmpeg');
ffmpeg.setFfmpegPath(ffmpegInstaller.path);
const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        //函数需手动创建文件夹
        // console.log('destination()', file)
        if (!fs.existsSync(constantObj.FILE_DIR)) {
            fs.mkdir(constantObj.FILE_DIR, function(err) {
                if (err) {
                    console.log(err);
                } else {
                    cb(null, constantObj.FILE_DIR);
                }
            });
        } else {
            cb(null, constantObj.FILE_DIR);
        }
    },
    filename: function(req, file, cb) {
        let ext = path.extname(file.originalname);
        let pathname = path.basename(file.originalname, ext);
        cb(null, pathname + '-' + Date.now() + ext);
    }
});
const upload = multer({ storage });
const uploadSingle = upload.single('image');

module.exports = function fileUpload(router) {
    // 上传文件
    router.post('/product/img/upload', (req, res) => {
        uploadSingle(req, res, function(err) {
            //错误处理
            if (err) {
                return res.send({
                    status: 1,
                    msg: '上传图片失败'
                });
            }
            var file = req.file;
            res.send({
                status: 0,
                data: {
                    fileName: file.filename,
                    url: constantObj.FILE_URL + file.filename
                }
            });
        });
    });
    // 删除图片
    router.post('/product/media/delete', (req, res) => {
        const { fileName } = req.body;
        fs.unlink(path.join(constantObj.FILE_DIR, fileName), err => {
            if (err) {
                console.log(err);
                res.send({
                    status: 1,
                    msg: '删除文件失败'
                });
            } else {
                res.send({
                    status: 0,
                    msg: '删除文件成功'
                });
            }
        });
    });
    //上传视频
    // 上传文件
    router.post('/product/vedio/upload', async (req, res) => {
        uploadSingle(req, res, async function(err) {
            //错误处理
            if (err) {
                return res.send({
                    status: 1,
                    msg: '上传视频失败'
                });
            }
            const {file} = req;
            const filePath = constantObj.FILE_DIR + file.filename;
            const outPath = constantObj.FILE_DIR;
            let ext = path.extname(file.originalname);
            let pathname = path.basename(file.originalname, ext);
            const outPosterFilename = pathname + '-' + Date.now() + '.png';
            new ffmpeg(filePath)
                .screenshots({
                    timemarks: ['2'],
                    count: 1,
                    filename: outPosterFilename,
                    folder: outPath,
                    size: '320x240'
                })
                .on('end', function() {
                    console.log(`视频${filePath}poster执行完成图片地址${outPosterFilename}`);
                });
            res.send({
                status: 0,
                data: {
                    fileName: file.filename,
                    url: constantObj.FILE_URL + file.filename,
                    poster:constantObj.FILE_URL + outPosterFilename
                }
            });
        });
    });
};
