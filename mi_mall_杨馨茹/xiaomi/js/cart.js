//请求数据加载页面
(function(){
    let container = getEle('.contain-content');
    let html = ''
    let res = $.ajax({
        url: `${BASE_URL}/cart`,
        dataType: "json"
    }).done(res=>{
        res.data.forEach(el=>{
            html+=`<div class="content-item">
                        <div class="col col-check">
                            <i class="iconfont icon-checkbox"></i>
                        </div>
                        <div class="col col-img">
                                <img alt="${el.title}" src="${el.path}">
                        </div>
                        <div class="col col-name">
                            ${el.title}
                        </div>
                        <div class="col col-price"><span>${el.price}</span>元</div>
                        <div class="col col-num">
                            <input class="btnReduce" type="button" value="-" />
                            <input class="buyNum" type="text" value="${el.num}" />
                            <input class="btnAdd" type="button" value="+" />
                        </div>
                        <div class="col col-total"><span> 0 </span>元</div>
                        <div class="col col-action"><span class="delItem" data-id = "${el.id}">×</span></div>
                </div>`
        })
        container.innerHTML = html;
        addNums();
        minusNums();
        printNum();
        getTotal();
        maskPopup();
        iptOnclick()
    })
})();

// 购买数量+
function addNums() {
    let btnAdd = document.getElementsByClassName('btnAdd')
    for(let i = 0,len = btnAdd.length;i< len;i++) {
        btnAdd[i].onclick = (e)=> {
            // 获取购买数量，购买数量加1
            let buyNum = e.target.previousElementSibling
            let buyNumVal = Number(buyNum.value)
            if(buyNumVal < 201){
                buyNumVal+=1
            } else {
                return
            }
            buyNum.value = buyNumVal
            // 获取父元素兄弟总价和单价，用单价*购买数量，复制给总价
            // let priceVal = Number(e.target.parentNode.previousElementSibling.children[0].innerText)
            // let total = e.target.parentNode.nextElementSibling.children[0]
            // let totalVal = priceVal * buyNumVal
            // total.innerText = totalVal
            // 用计算总价的函数实现计算
            getTotal()
        }
    }
}
// 购买数量-
function minusNums() {
    let btnReduce = document.getElementsByClassName('btnReduce')
    for(let i = 0,len =btnReduce.length;i<len;i++) {
        btnReduce[i].onclick = (e)=> {
            // 获取购买数量，购买数量加1
            let buyNum = e.target.nextElementSibling
            let buyNumVal = Number(buyNum.value)
            if(buyNumVal > 0){
                buyNumVal-=1
            }else {
                return
            }
            buyNum.value = buyNumVal
            // 获取父元素兄弟总价和单价，用单价*购买数量，复制给总价
            // let priceVal = Number(e.target.parentNode.previousElementSibling.children[0].innerText)
            // let total = e.target.parentNode.nextElementSibling.children[0]
            // let totalVal = priceVal * buyNumVal
            // total.innerText = totalVal

            // 用函数循环每一个商品购买数量和单价，计算得到商品总价，并将总价相加，得到合计数量
            getTotal()
        }
    }
}

// 输入购买数量
function printNum() {
    let buyNum = document.getElementsByClassName('buyNum')
    for(let i =0,len = buyNum.length;i<len;i++) {
        buyNum[i].onkeyup = (e)=> {
            e.target.value = e.target.value.replace(/\D/g, '')
            if(Number(e.target.value >200)) {
                e.target.value = 200
            }
        }
        buyNum[i].onblur = ()=> {
            getTotal()
        }
    }
}


// 计算总价,页面初始化也要运行
function getTotal(){
    // 合计总价
    let summation = 0;
    // 合计商品
    let totalBuyNum = 0;
    // 已选商品
    let selectBuyNum = 0;
    // 得到每一个 商品购买数量dom
    let buyNum= document.getElementsByClassName('buyNum')
    for(let i = 0; i< buyNum.length;i++) {
        // 得到购买数量
        let buyNumVal = Number(buyNum[i].value)
        // 得到当前商品单价
        let priceVal = Number(buyNum[i].parentNode.previousElementSibling.children[0].innerText)
        // 获取当前商品总价dom
        let total = buyNum[i].parentNode.nextElementSibling.children[0]
        // 计算总价
        let totalVal = priceVal * buyNumVal
        // 总价复制
        total.innerText = totalVal
        // 判断当前商品是否被选中
        let isChose = buyNum[i].parentNode.parentNode.firstElementChild.firstElementChild.classList.value.indexOf('icon-checkbox-selected') > -1 ?true : false;
        if(isChose){
            summation+=totalVal
            selectBuyNum+=buyNumVal
        }
        totalBuyNum+=buyNumVal
    }
    document.getElementById('summation').innerText = summation
    if(summation === 0) {
        document.getElementById('goBuy').classList.add('noAllow')
    } else {
        document.getElementById('goBuy').classList.remove('noAllow')
    }
    document.getElementById('totalBuyNum').innerText = totalBuyNum
    document.getElementById('selectBuyNum').innerText = selectBuyNum
}



// 选框点击事件
function iptOnclick() {
    let selectAll = document.getElementById('selectAll')
    let checkbox = document.getElementsByClassName('contain-content')[0].getElementsByClassName('icon-checkbox')
    selectAll.onclick =()=> {
        if(selectAll.classList.value.indexOf('icon-checkbox-selected')>-1) {
            selectAll.classList.remove('icon-checkbox-selected')
            for(let i =0;i<checkbox.length;i++) {
                checkbox[i].classList.remove('icon-checkbox-selected')
            }
        } else {
            selectAll.classList.add('icon-checkbox-selected')
            for(let i =0;i<checkbox.length;i++) {
                checkbox[i].classList.add('icon-checkbox-selected')
            }
        }
        getTotal()
    }
    for(let i =0;i<checkbox.length;i++) {
        checkbox[i].onclick = (e)=>{
            if(e.target.classList.value.indexOf('icon-checkbox-selected')>-1) {
                e.target.classList.remove('icon-checkbox-selected')
                selectAll.classList.remove('icon-checkbox-selected')
            } else {
                e.target.classList.add('icon-checkbox-selected')
                let isSelectAll = true
                for(let i =0;i<checkbox.length;i++) {
                    if(!(checkbox[i].classList.value.indexOf('icon-checkbox-selected')>-1)) {
                        isSelectAll = false
                        break;
                    }
                }
                if(isSelectAll) {
                    selectAll.classList.add('icon-checkbox-selected')
                }
            }
            getTotal(true)
        }
    }
}
// 当前商品选择
function maskPopup(){
    let delItem = [...document.getElementsByClassName('delItem')]
    delItem.forEach((el,idx)=>{
        el.onclick = (e) =>{
            mask(el,idx)
        }
    })
}

// mask各种点击事件
function mask(el,index) {
    let isDel = false;
    let mask = document.getElementById('mask')
    mask.setAttribute('index',index)
    mask.style.display = 'block'
    let cancelBtn = document.getElementById("cancelBtn")
    let confirmDelBtn = document.getElementById("confirmDelBtn")
    let delImg = document.getElementById("delImg")
    cancelBtn.onclick=()=> {
        mask.style.display = 'none'
    }
    delImg.onclick=()=> {
        mask.style.display = 'none'
    }
    // 确认删除，根据mask属性index删除当前产品
    confirmDelBtn.onclick=(e)=> {
        console.log(e)
        let index = mask.getAttribute('index')
        let delItem = document.getElementsByClassName('contain-content')[0].children[index]
        console.log(delItem)
        document.getElementsByClassName('contain-content')[0].removeChild(delItem)
        mask.style.display = 'none'
        //点击事件成功触发
        success(e,el);
    }
}
function success(e,el){
    console.log(e,el)
    if(e){
        $.ajax({
            url: `${BASE_URL}/cart/delete`,
            type: "POST",
            data: {
                id: el.dataset.id
            },
            dataType: "json"
        }).fail(res => {
            console.log(res)
        })
    }
}