const { host, port } = require("../http/index"); //解构对象
// 1. 获取router实例
const router = require("express").Router();
const getConnection = require("../mysqlConnection");
const querystring = require("querystring");
// 2. 处理路由
// => 查询购物车
router.get("/", (req, res) => {
    console.log("「查询购物车接口」被调用...");
    let {id} = req.query;
    const db = getConnection();
    let sql = "";
    if(id) {
        sql = `SELECT * FROM cart WHERE id = ${id} `;
    }
    else{
        sql = `SELECT * FROM cart `;
    }
    db.connect();
    db.query(sql, (err, sqlRes) => {
        console.log(`cart:${sqlRes}`)
        if(err) {
            console.log("GET_PAGE_MAIN_ERROR=>", err.message);  
            res.send({
                code: 500,
                data: "服务器异常"
            })
        }
        else {
            let data = sqlRes;
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

// => 添加购物车
router.get("/add", (req, res) => {
    console.log("「添加购物车接口」被调用...");
    let {id} = req.query;
    const db = getConnection();
    db.connect();
    if(id){
        sql = `INSERT INTO cart (id,path,title,price) SELECT id,path,title,origi_price FROM page_main WHERE id = ${id}`;
    }    
    db.query(sql, (err, sqlRes) => {
        console.log(sqlRes)
        if (err) {
            console.log("GET_PRODUCTS_ERROR=>", err.message);
            switch (err.errno) {
                //1062是mysql的一种错误代码，表示主键冲突
                case 1062: {
                    res.send({
                        code: 202,
                        data: "购物车已有该产品"
                    })

                } break;
                default: {
                    res.send({
                        code: 500,
                        data: "服务器异常"
                    })
                }
            }
        }
        console.log(sqlRes)
    });
    db.end();
});
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
// => 从购物车中删除产品
router.post("/delete", (req, res) => {
    console.log("「删除产品接口」被调用...");
    let {id} = req.body;
    if(!id) {
        res.send({
            code: 204,
            data: "请求参数有误"
        });
        return false;
    };
    const db = getConnection();
    const sql = `DELETE FROM cart WHERE id = ${id}`;
    console.log(sql)
    db.connect();
    db.query(sql, (err, sqlRes) => {
        if(err) {
            console.log("DELETE_HERO_ERROR=>", err.message);
            res.send({
                code: 500,
                data: "服务器异常"
            })
        }else {
            res.send({
                code: 200,
                data: "删除成功"
            });
        }
    });
    db.end();
});


// 3. 导出路由
module.exports = router;