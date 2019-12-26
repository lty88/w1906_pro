/**********表单验证***********/
//表单验证配置文件
let validateFormOpt = {
    fieldsOpt: {
        email: {
            rule: { isNull:"",reg: /^\w{2,}@\w{2,}\.[A-Za-z0-9]{2,}$/ },
            errorMsg: {isNull:"邮箱不能为空",reg:"邮箱格式不正确"},
            selector: '#email'
        },
        tel: {
            rule: {  isNull:"",reg: /^1[2-9]\d{9}$/ },
            errorMsg: {isNull:"手机号不能为空",reg:"请输入正确的手机号"},
            selector: '#tel'
        },
        username: {
            rule: { isNull:"" , reg: /^[\u4e00-\u9fa5_a-zA-Z0-9]{5,12}/,exist:""},
            errorMsg: {isNull:"用户名不能为空",reg:"用户名包含5-12个字符",exist:`此用户名已存在，可 <a href="login.html">直接登录</a>`},
            selector: '#username'
        },
        password1: {
            rule: { isNull:"",reg: /^(?![0-9]+$)(?![a-z]+$)(?![A-Z]+$)(?!([^(0-9a-zA-Z)])+$).{6,16}$/},
            errorMsg: {isNull:"密码不能为空", reg:"密码至少包含数字、字母、符号中的两种",},
            selector: '#psd1'
        },
        password2: {
            rule: { 
                isNull:"",
                reg: /^(?![0-9]+$)(?![a-z]+$)(?![A-Z]+$)(?!([^(0-9a-zA-Z)])+$).{6,16}$/, 
                equal: 'password1'
                
            },
            errorMsg: {isNull:"请确认密码", reg:"两次密码不一致", equal:"两次密码不一致"},
            selector: '#psd2'
        }
    },
    submit: {
        selector: '#submit'
    },
    //自定义字段验证成功失败函数
    valiField: function (field, valiRes,rule) {
        console.log('进入字段验证')
        console.log(valiRes)
        //获取input元素
        let curIpt = getEle(this.fieldsOpt[field].selector)
        //获取错误提示span元素
        let infoSpan = curIpt.nextElementSibling
        if (valiRes) {
            curIpt.parentElement.classList.remove('has-error')
            console.log(curIpt.parentElement)
            infoSpan.parentElement.classList.remove('has-feedback')
            infoSpan.innerText = '';
            console.log(`${field}验证成功`)
        } else {
            curIpt.parentElement.classList.add('has-error')
            infoSpan.parentElement.classList.add('has-feedback')
            infoSpan.innerHTML = `<i class="iconfont icon-Shapex"></i> ${this.fieldsOpt[field].errorMsg[rule]}`
            console.log(`${field}验证失败`)
        }
    },
    //自定义表单验证成功回调函数
    success: function (e) {
        //验证成功
        console.log('验证成功')
        e.preventDefault()
        //提交数据
        submitForm();
        //缓存用户名信息至浏览器
        localStorage.setItem("username",getEle('#username').value)
        //跳转至首页
        jumpUrl('../index.html');
    },
    //自定义表单验证成功失败回调函数
    error: function (e) {
        //验证失败阻止提交
        e.preventDefault()
        console.log('验证失败')
    }
}

//开启表单验证
let t = new ValidateForm(validateFormOpt)
t.validate();

//表单验证成功提交数据
function submitForm(){
    let valueObj = {};
    for(let field in this.fieldsOpt){
        valueObj[field] = getEle(this.fieldsOpt[field].selector).value;
    }
    $.ajax({
        url: `${BASE_URL}/register`,
        type:"POST",
        data:{
            email:`${valueObj.email}`,
            tel:`${valueObj.tel}`,
            username:`${valueObj.username}`,
            password:`${valueObj.password1}`
        },
        dataType:"json"
    }).done(res=>{
        
    }).fail(res=>{
        console.log(res);
    })
}


