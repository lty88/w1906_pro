// 导入mysql模块
const mysql = require("mysql");
const {host} = require("./http/index"); //数据库和服务器在同一台电脑上，否则另外设置host的值
// 默认配置
const defaultOptions = {
    host:'127.0.0.1',
    port: '3306',
    user: 'root',
    password: 'yangtuo_1996',
    database: 'mi_mall'
}
// 获取connection对象
function getConnection(options = defaultOptions) {
    return mysql.createConnection(options);
}
// 导出getConnection
module.exports = getConnection;
