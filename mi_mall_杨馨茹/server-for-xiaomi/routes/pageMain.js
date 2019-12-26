const { host, port } = require("../http/index"); //解构对象
// 1. 获取router实例
const router = require("express").Router();
const getConnection = require("../mysqlConnection");
const querystring = require("querystring");
// 2. 处理路由
// => 查询产品
router.get("/", (req, res) => {
    console.log("「查询产品接口」被调用...");
    let {id,section,type,isSale,idx} = req.query;
    const db = getConnection();
    let sql = "";
    if(section) {
        sql = `SELECT * FROM page_main WHERE type = '${type}' AND section = '${section}'`;
    }
    if(idx){
        sql = `SELECT * FROM page_main WHERE idx = '${idx}' AND type = '${type}'`; 
    }
    if(isSale){
        sql = `SELECT * FROM page_main WHERE isSale = '${isSale}' AND type = '${type}'`;
        console.log(sql)
    }
    db.connect();
    db.query(sql, (err, sqlRes) => {
        if(err) {
            console.log("GET_PAGE_MAIN_ERROR=>", err.message);  
            res.send({
                code: 500,
                data: "服务器异常"
            })
        }
        else {
            // console.log(`sqlRes：`)
            // console.log(sqlRes)
            let data = sqlRes;
            // let data = idx ? sqlRes[0] : sqlRes;
            data.map(item=>{
                return item.path = `http://${host}${port === "80"?"":`:${port}`}/images/${item.path}`
            });
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