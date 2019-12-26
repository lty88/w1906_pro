const { host, port } = require("../http/index"); //解构对象
// 1. 获取router实例
const router = require("express").Router();
const getConnection = require("../mysqlConnection");
const querystring = require("querystring");
// 2. 处理路由
// => 查询产品
router.get("/", (req, res) => {
    console.log("「查询产品接口」被调用...");
    let {id,idx,site} = req.query;
    const db = getConnection();
    let sql = "";
    if(idx && site) {
        sql = `SELECT * FROM products WHERE idx = ${idx} AND site = '${site}'`;
        console.log(sql)
    }else {
        sql = `SELECT * FROM products`;
    }
    db.connect();
    if(id){
        sql = `INSERT INTO test (path) SELECT path,title FROM page_main,title WHERE id = ${id}`;
        db.query(sql, (err, sqlRes) => {
            if (err) {
                console.log("GET_PRODUCTS_ERROR=>", err.message);
                res.send({
                    code: 500,
                    data: "服务器异常"
                })
            }
            console.log(sqlRes)
        });
    }
    else{
        db.query(sql, (err, sqlRes) => {
            if (err) {
                console.log("GET_PRODUCTS_ERROR=>", err.message);
                res.send({
                    code: 500,
                    data: "服务器异常"
                })
            } else {
                // console.log(`sqlRes：`)
                // console.log(sqlRes)
                let data = sqlRes;
                // let data = idx ? sqlRes[0] : sqlRes;
                data.map(item => {
                    return item.path = `http://${host}${port === "80" ? "" : `:${port}`}/images/${item.path}`
                });
                // console.log(sqlRes)
                res.send({
                    code: 200,
                    data
                });
            }
        });   
    }
    db.end();
});
// // => 添加产品
// router.post("/add", (req, res) => {
//     console.log("「添加产品接口」被调用...");
    
// });
// // => 修改产品
// router.post("/modify", (req, res) => {
//     console.log("「修改产品接口」被调用...");
//     let params = req.body;
//     let {id} = params;
//     delete params.id;
//     let obj = {};
//     for(let key in params) {
//         let value = params[key];
//         if(typeof params[key]  == "string") {
//             obj[key] = `'${value}'`
//         }else {
//             obj[key] = value
//         }
//     };
//     const text = decodeURI(querystring.stringify(obj).replace(/&/g, ","));
//     const db = getConnection();
//     const sql = `UPDATE products SET ${text} WHERE id = ${id}`;
//     db.connect();
//     db.query(sql, (err, sqlRes) => {
//         if(err) {
//             console.log("DELETE_HERO_ERROR=>", err.message);
//             res.send({
//                 code: 500,
//                 data: "服务器异常"
//             });
//         }else {
//             res.send({
//                 code: 200,
//                 data: "修改成功"
//             });
//         }
//     })
//     db.end();

// });
// // => 删除产品
// router.post("/delete", (req, res) => {
//     console.log("「删除产品接口」被调用...");
//     let {id} = req.body;
//     if(!id) {
//         res.send({
//             code: 204,
//             data: "请求参数有误"
//         });
//         return false;
//     };
//     const db = getConnection();
//     const sql = `DELETE FROM products WHERE id = ${id}`;
//     db.connect();
//     db.query(sql, (err, sqlRes) => {
//         if(err) {
//             console.log("DELETE_HERO_ERROR=>", err.message);
//             res.send({
//                 code: 500,
//                 data: "服务器异常"
//             })
//         }else {
//             res.send({
//                 code: 200,
//                 data: "删除成功"
//             });
//         }
//     });
//     db.end();
// });


// 3. 导出路由
module.exports = router;