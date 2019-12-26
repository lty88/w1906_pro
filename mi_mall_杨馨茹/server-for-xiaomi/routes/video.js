const { host, port } = require("../http/index"); //解构对象
// 1. 获取router实例
const router = require("express").Router();
const getConnection = require("../mysqlConnection");
const querystring = require("querystring");
// 2. 处理路由
// => 查询视频
router.get("/", (req, res) => {
    console.log("「查询视频接口」被调用...");
    const db = getConnection();
    let sql = "";
    sql = `SELECT * FROM video `;
    db.connect();
    db.query(sql, (err, sqlRes) => {
        if(err) {
            console.log("GET_VIDEO_ERROR=>", err.message);  
            res.send({
                code: 500,
                data: "服务器异常"
            })
        }else {
            let data = sqlRes;
            // let data = idx ? sqlRes[0] : sqlRes;
            data.map(item=>{
                //拼接路径
                return [item.image=splicePath(item.image),item.video=splicePath(item.video),item.poster=splicePath(item.poster)]
            });

            // console.log(sqlRes)
            res.send({
                code: 200,
                data
            });
        }
    });
    db.end();
});            

// 3. 导出路由
module.exports = router;

//拼接路径函数
function splicePath(path){
    return path = `http://${host}${port === "80"?"":`:${port}`}/videos/${path}`
}