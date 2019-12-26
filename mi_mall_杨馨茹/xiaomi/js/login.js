/***切换***/
function tab(){
    let tabBtns = [...getEle('.navtab-link', true)];
    let tabCons = [...getEle('.tabs-con', true)];
    if(tabBtns.length !== tabCons.length){
        return;
    }
    tabBtns.forEach((el,idx) => {
        el.onclick = (e) => {
            for(let i in tabBtns){
                if(tabBtns[i].classList.contains('now')) {
                    tabBtns[i].classList.remove('now');
                    tabCons[i].classList.add('hide');
                }            
            }
            e.target.classList.add('now');
            tabCons[idx].classList.remove('hide')
        }
    })
}
tab();

/*****登录验证*****/
let selector = {
    username:"#username",
    password:"#pwd"
}
let errDiv = getEle('.err-tip')
let subBtn = getEle('#submit')
let pass = false;

subBtn.onclick = ()=>{
    let valueObj = {};
    for(let field in selector){
        valueObj[field] = getEle(selector[field]).value;
    }
    console.log(valueObj)
    let res = $.ajax({
        url: `${BASE_URL}/login`,
        async:false,
        type:"POST",
        data:{
            username:`${valueObj.username}`,
            password:`${valueObj.password}`
        },
        dataType:"json"
    }).responseJSON
    if(res.code == 201){
        errDiv.classList.add('has-error')
        errDiv.innerHTML = `<i class="iconfont icon-Shapex"></i> ${res.data}`
    }else{
        errDiv.classList.remove('has-error')
        //缓存用户名信息至浏览器
        localStorage.setItem("username",valueObj.username)
        //跳转至首页
        jumpUrl('../index.html');
    }
}
