const mysql = require('think-model-mysql');

module.exports = {
    handle: mysql,
    database: 'hiolabsdb',
    prefix: 'hiolabs_',
    encoding: 'utf8mb4',
    host: '127.0.0.1',
    port: '3306',
    user: 'root',
    password: '123456',
    dateStrings: true,
    authPluginName: 'mysql_native_password'  // 添加此行
};
