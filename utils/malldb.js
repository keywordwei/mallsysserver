const mysql = require('mysql');
const errMsg = require('../service/errmsg');
const constans = require('./constants');
var pool = mysql.createPool({
    connectionLimit: 10,
    // host: constans.hostname,
    host: '127.0.0.1',
    user: 'root',
    // password: 'you remote mysql password',
    password: 'root',
    database: 'mallmanasys',
    port: 3306
});
const malldb = (sql, params, res) => {
    return new Promise((resolve, reject) => {
        pool.getConnection((err, connection) => {
            if (err) {
                res.json(errMsg.dbErr);
            } else {
                connection.query(sql, params, (err, results, fields) => {
                    connection.release();
                    if (err) {
                        res.json(errMsg.dbErr);
                    } else {
                        resolve(results);
                    }
                });
            }
        });
    });
};

module.exports = malldb;
