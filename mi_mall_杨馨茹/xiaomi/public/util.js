//公共配置
const BASE_URL ="http://10.2.1.77:8081";
//公共函数
/***DOM查询***/
function getEle(Sel, isAll) {
    if (isAll) {
        return document.querySelectorAll(Sel);
    }
    return document.querySelector(Sel);
} 
/***获取非行内样式***/
function getStyle(el, attr) {
    // 兼容IE
    if (el.currentStyle) {
        return el.currentStyle[attr];
    } else {
        return getComputedStyle(el, null)[attr];
    }
}
/**
 * 添加事件监听（兼容IE）
 * @param {DOM} el 
 * @param {String} type 
 * @param {Function} callBack 
 */
function addEvent(el, type, callBack) {
    if (el.attachEvent) {
        el.attachEvent('on' + type, callBack);
    } else {
        el.addEventListener(type, callBack, false);
    }
}

//=>回到顶部
/**
 * 回到顶部
 * @param {Object} options 配置参数
 * - el 触发元素
 * - duration 持续时间
 * - pageScroll 页面滚动回调
 * - complete 回到顶部完成回调
 */
function scrollToTop(options) {
    // 1. 解构配置参数
    let { el, duration, pageScroll, complete } = options;
    console.log(el)
    // 2. 默认值
    duration = duration || 1000;
    // 3. 定义变量
    let isAnimating = false; // 记录当前是否正在执行回到顶部的动画
    let offset   = 0,  // 记录偏移
        interval = 15,  // 每一帧持续的时间
        speed = null, // 每一帧位移的距离
        timer = null; // 定时器
    // 4. 监听窗口滚动
    window.addEventListener("scroll", function () {
        // 更新页面滚动的距离
        offset = document.body.scrollTop || document.documentElement.scrollTop;
        // 触发回调函数
        pageScroll && pageScroll(offset);
    });
    // 5.监听按钮点击
    el.onclick = function () {
        // 异常处理
        // 如果当前正在执行动画，则不响应事件
        if(isAnimating) {
            return;
        }
        // 计算每一帧位移的距离
        speed = Math.ceil(offset / (duration / interval));
        // 定时器执行滚动动画
        isAnimating = true;
        timer = setInterval(function () {
            if (offset > 0) {
                document.body.scrollTop = document.documentElement.scrollTop = offset - speed;
            } else {
                // 清除定时器
                clearInterval(timer);
                timer = null;
                isAnimating = false;
                // 矫正误差
                document.body.scrollTop = document.documentElement.scrollTop = 0;
                // 触发回调
                complete && complete();
            }
        }, interval);
    }
}
//=>模块加载

//=>取任意值之间的随机整数
function randomInteger(min, max) {
    if (min == undefined || max == undefined || isNaN(min) || isNaN(max)) {
        return -1;
    } else {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }
}

//=>表单验证
/**
 * 表单验证
 * @param {Object} validateFormOpt 配置参数
 */
function ValidateForm(validateFormOpt) {

    //初始化输入字段配置
    this._initValiFields = function () {
        this.fieldsOpt = validateFormOpt.fieldsOpt
    }
    //根据slector找到对应的输入字段元素

    this._getIpts = function () {
        //输入框元素
        this.iptEle = {}
        for (let key in this.fieldsOpt) {
            this.iptEle[key] = document.querySelector(this.fieldsOpt[key].selector)
        }
    }

    //初始化验证结果对象
    this._initValiRes = function () {
        //验证结果
        let valiResObj = {}
        for (let field in this.fieldsOpt) {
            valiResObj[field] = false
        }
        //验证结果对象添加pass属性，
        Object.defineProperty(valiResObj, 'pass', {
            get() {
                let res = true
                for (let key in this) {
                    res = res && this[key]
                    if (!res) { break }
                }
                return res
            }
        })
        this.valiRes = valiResObj
    }
    //给所有字段绑定失去焦点事件
    this.bindFieldEvent = function () {
        for (let field in this.fieldsOpt) {
            //根据字段找到当前验证的元素
            let curIpt = this.iptEle[field]
            console.log(curIpt)
            let _this = this
            curIpt.oninput = function () {
                //this指向当前元素，获取当前元素的value值
                let value = this.value
                _this.valiRes[field] = _this._valiField(field, value)
                console.log(_this.valiRes[field])
            }
        }
    }

    //验证一个字段
    this._valiField = function (field, value) {
        let valiRes = true
        console.log(`验证${field}`)
        //验证该字段的所有规则
        let ruleObj = this.fieldsOpt[field].rule
        for(let rule in ruleObj){
            console.log(`验证${field}的${rule}`)
            let ruleRes =  eval(`this._vali_${rule}(ruleObj,value)`)
            console.log(`ruleRes为${ruleRes}`)
            if(!ruleRes){
                valiRes = ruleRes
                this._handleFieldRes(field, valiRes, rule)
                break
            }
            else this._handleFieldRes(field, valiRes)
        }
        return valiRes
    }
    /*******************验证方式******************/
    //正则验证
    this._vali_reg = function(ruleObj,value){
        return ruleObj.reg.test(value)
    }
    //字段值相等验证
    this._vali_equal = function(ruleObj,value){
        let targetIpt = this.iptEle[ruleObj.equal]
        return targetIpt.value == value
    }
    //是否在数据库中存在
    this._vali_exist = function(ruleObj,value){
        let code = $.ajax({
            url: `${BASE_URL}/`,
            async:false,  //改为同步
            data:{
                username:`${value}`
            },
            dataType:"json",
        }).responseJSON.code; //获取错误码
        return code == 201;  //201表示用户不存在
    }
    //判断值是否为空
    this._vali_isNull = function(ruleObj,value){
        return value;
    }   

    //处理字段验证结果
    this._handleFieldRes = function (field, valiRes, rule) {
        console.log('字段验证结果')
        try { 
            validateFormOpt.valiField(field, valiRes, rule)
        }catch(e){
            console.error(e)
        }
    },
    //点击按钮提交表单
    this._handleSubmit = function (validateFormOpt) {
        let submit = document.querySelector(validateFormOpt.submit.selector)
        let _this = this
        submit.addEventListener('click', function (e) {
            for (let field in _this.fieldsOpt) {
                //根据字段找到当前验证的元素
                let value = _this.iptEle[field].value
                console.log(value)
                //this指向当前元素，获取当前元素的value值
                _this._valiField(field, value)     
            }            
            if (!_this.isPass()) {
                validateFormOpt.error(e)
            } else {
                validateFormOpt.success(e)
            }

        })
    }

    //让元素获得焦点
    this._focus = function (field) {
        this.iptEle[field].focus()
    }

    //表单所有字段验证结果
    this.isPass = function () {
        return this.valiRes.pass
    }

    //开启实例表单验证
    this.validate = function () {
        this.bindFieldEvent()
        this._handleSubmit(validateFormOpt)
    }


    /********************调用函数,实现数据初始化*****************************/
    //初始化字段配置
    this._initValiFields()
    //初始化字段对应的元素
    this._getIpts()
    //初始化字段验证结果
    this._initValiRes()

}

// =>跳转链接
function jumpUrl(url){
    window.location.href= url;
}