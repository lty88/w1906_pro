/*轮播图*/ 
(function fade() {
    // 1. 获取DOM元素
    let slides = getEle(".home-swiper .slide",true);
    let paginationItems = [...getEle(".home-swiper .bullet",true)];
    let prevBtn = getEle(".home-swiper .swiper-btn-prev");
    let nextBtn = getEle(".home-swiper .swiper-btn-next");
    let swiper = getEle(".home-swiper");
    let curIndex = 0, // 记录当前下标
        lasIndex = 0, // 记录上一次下标
        length = slides.length, // 获取图片张数
        timer = null;
    // 2. 自动播放
    play();
    // 3. 事件
    // 3.1. 自动播放启动暂停 
    swiper.onmouseenter = stop; // 当鼠标移至容器上时，暂停定时器
    swiper.onmouseleave = play; // 当鼠标移出容器上时，启动定时器
    // 3.2. 点击下一页
    nextBtn.onclick = function () {
        // 计算下标
        curIndex = curIndex == length - 1 ? 0 : ++curIndex;
        // 切换视图
        tab();
    }
    // 3.3. 点击上一页
    prevBtn.onclick = function () {
        // 计算下标
        curIndex = curIndex == 0 ? curIndex = length - 1 : --curIndex;
        // 切换视图
        tab();
    }
    // 3.4. 点击小圆点
    paginationItems.forEach(pagination => {
        pagination.onclick = function (e) {
            // 获取点击分页的下标
            let index = paginationItems.indexOf(e.target);
            // 异常处理：如果点击的分页下标刚好是目前正在显示的图片下标，则不作处理
            if (index == curIndex) { return; }
            // 更新下标
            curIndex = index;
            // 切换视图
            tab();
        }
    });

    // 4. 函数
    // 4.1. 自动播放
    function play() {
        timer = setInterval(() => {
            nextBtn.onclick();
        }, 3000);
    }
    // 4.2. 暂停播放
    function stop() {
        console.log(2);
        clearInterval(timer);
    }
    // 4.3. 切换
    function tab() {
        // 清除上一次效果
        removeClass(slides[lasIndex], "show");
        removeClass(paginationItems[lasIndex], "bullet-active");
        // 添加这一次效果
        addClass(slides[curIndex], "show");
        addClass(paginationItems[curIndex], "bullet-active");
        // 更新lastIndex
        lasIndex = curIndex;
    }
    // 4.4. 移除class 
    function removeClass(el, className) {
        el.classList.remove(className);
    }
    // 5.5. 添加clss
    function addClass(el, className) {
        el.classList.add(className);
    }
})();

/********动态加载头部二级菜单********/
(function(){
    let childMenu = [...getEle('.category-list .category-item .children',true)];
    let items = [...getEle('.category-list .category-item',true)];
    items.forEach((item,idx)=>{
        item.onmouseenter = ()=>{
            console.log(idx)
            item.classList.add('category-item-active');
            loadMenu(idx);
        }
        item.onmouseleave = ()=>{
            item.classList.remove('category-item-active');
        }
    });
    function loadMenu(idx){
        $.ajax({
            url: `${BASE_URL}/products`,
            data:{
                idx:`${idx}`,
                site:`home`
            },  
            dataType: "json"
        }).done(res => {
            //根据后台数据数量为二级菜单添加样式
            let dataLen = res.data.length;
            if(dataLen>18){
                childMenu[idx].classList.add('children-col-4');
            }
            else if(dataLen>12){
                childMenu[idx].classList.add('children-col-3');
            }
            else if(dataLen>6){
                childMenu[idx].classList.add('children-col-2');
            }
            else childMenu[idx].classList.add('children-col-1');          
            //动态加载二级菜单内容  
            let htmlStr = '';       
            res.data.forEach((el,idx)=>{
                htmlStr += `
                            <li>
                                <a href="javascript:;">
                                    <img src="${el.path}" alt="${el.name}" class="thumb" width="${el.width}px" height="${el.height}px">
                                    <span class="title">${el.name}</span>
                                </a>
                            </li>
                            `;                 
                if(idx == 5 || idx == 11 || idx == 17){
                    htmlStr += ` </ul>
                                <ul class="children-list">
                                `;
                }
                if(idx>=25){
                    return ;
                }
            })
            childMenu[idx].innerHTML = `<ul class="children-list">${htmlStr}</ul>`;      
            // console.log(childMenu.innerHTML)      
        }).fail(err => {
            console.log(err);
        }); 
    }
})();

/*******请求后台数据加载页面内容*******/
//加载小米闪购
let flashList = getEle('.flashsale-list .wrapper');
$.ajax({
    url: `${BASE_URL}/pageMain`,
    data:{
        type:`product`,
        isSale:`true`
    },
    dataType:"json"
}).done(res=>{
    let resData = [],
        lastIndex = res.data.length-1,
        html = '';
    for(let i=0;i<12;i++){
        resData.push(res.data[randomInteger(0,lastIndex)])
    }
    console.log(resData)
    resData.forEach((el,idx)=>{
        let priceStr = el.disc_price?`<span>${el.disc_price}元</span> <del>${el.origi_price}元</del>`:`<span>${el.origi_price}元</span>`;
        el.flag = el.flag?el.flag:'';
        html +=`<a href="javascript:;" class="rainbow-item-${idx} cart">
                    <img src="${el.path}" alt="${el.title}" class="thumb" width="160" height="160">
                    <p class="title">${el.title}</p>
                    <p class="desc">${el.desc}</p>
                    <p class="price">${priceStr}</p>
                    <button data-idx="${el.id}">加入购物车</button>
                </a>`
    })
    addEvent();
    flashList.innerHTML = html;    
}).fail(err=>{
    console.log(err)
})

let prevBtn = getEle(".home-flashsale .swiper-controls .prev");
let nextBtn = getEle(".home-flashsale .swiper-controls .next");
let flash = document.querySelector(".flashsale-list");
let wrapper = getEle('.flashsale-list .wrapper');
let width = parseInt(getStyle(flash, "width"));

//加载brick-box模板
let brickLists = [...getEle('.brick-box .right .brick-list',true)];
let promoLists = [...getEle('.brick-box .brick-promo-list',true)]
promoLists.forEach((el,idx)=>{
    loadAdvertisement(idx);
})
brickLists.forEach((el,idx)=>{
    loadProduct(idx);
})
// =>加载广告图
function loadAdvertisement(idx){
    $.ajax({
        url: `${BASE_URL}/pageMain`,
        data: {
            type: `ad`,
            idx: `${idx}`
        },
        dataType: "json"
    }).done(res => {
        let html = '';
        if(idx == 0){
            promoLists[0].innerHTML = `
                                        <div class="brick-item brick-item-1">
                                            <a href="javascript:;">
                                                <img src="${res.data[0].path}" alt="">
                                            </a>
                                        </div>`;
        }
        res.data.forEach(el=>{
            html += `
                    <div class="brick-item brick-item-2">
                        <a href="javascript:;">
                            <img src="${el.path}" alt="">
                        </a>
                    </div>`;
        })
        promoLists[idx].innerHTML = html;
    }).fail(err => {
        console.log(err);
    });        
}
// =>加载产品
function loadProduct(idx){
    $.ajax({
        url: `${BASE_URL}/pageMain`,
        data: {
            type: `product`,
            idx: `${idx}`
        },
        dataType: "json"
    }).done(res => {
        let html = '';
        let size = 8 ;  //每个版块分页显示最大产品个数
        let dataLen = res.data.length;
        //加载手机模块
        if(idx == 0){
            res.data.forEach((el,index)=>{
                let priceStr = el.disc_price?`<span>${el.disc_price}元</span><del>${el.origi_price}元</del>`:`<span>${el.origi_price}元</span>`;
                if(index < size){
                    html += `                                
                    <li class="brick-item brick-item-m cart">
                        <a href="javascript:;">
                            <img src="${el.path}" alt="${el.title}">
                            <p class="title">${el.title}</p>
                            <p class="desc">${el.desc}</p>
                            <div class="price">${priceStr}</div>
                            <button data-idx="${el.id}">加入购物车</button>
                        </a> 
                    </li>`   
                }
                //绑定点击事件
            })
            addEvent();
            brickLists[idx].innerHTML = html;
        }
        //加载其他模块
        else{
            res.data.forEach((el, index) => {
                let priceStr = el.disc_price ? `<span>${el.disc_price}元</span><del>${el.origi_price}元</del>` : `<span>${el.origi_price}元</span>`;
                if(index < size-1){
                    html += `                                
                    <li class="brick-item brick-item-m cart">
                        <a href="javascript:;">
                            <img src="${el.path}" alt="${el.title}">
                            <p class="title">${el.title}</p>
                            <p class="desc">${el.desc}</p>
                            <div class="price">${priceStr}</div>
                            <button data-idx="${el.id}">加入购物车</button>
                        </a> 
                    </li>`;                          
                }
                if( dataLen >= size && index == size-1){
                    html += `<li class="brick-item brick-item-s">
                                <a href="javascript:;">
                                    <div class="figure-img">
                                        <img src="${el.path}" alt="${el.title}">
                                    </div>
                                    <p class="title">${el.title}</p>
                                    <p class="price">${el.origi_price}</p>
                                </a>
                            </li>`
                }  
                if(index > size - 1) return;   
                addEvent();
            });                    
            brickLists[idx].innerHTML = html +` <li class="brick-item brick-item-s">
                                                    <a href="javascript:;">
                                                        <div class="figure-more">
                                                            <em class="iconfont icon-circle-arrow-right"></em>
                                                        </div>
                                                        <div class="more">
                                                            浏览更多
                                                            <small>${res.data[0].section}</small>
                                                        </div>
                                                    </a>
                                                </li>`;   
        }
    }).fail(err => {
        console.log(err);
    });
}
function addEvent(){
    let btn = [...getEle('.cart button',true)];
    btn.forEach(el=>{
        el.onclick=function(){
            console.log('btn被点击')
            $.ajax({
                url: `${BASE_URL}/cart/add`,
                data: {
                    id:el.dataset.idx
                },
                dataType: "json"
            }).fail(res=>{
                console.log(1,res)
            })
        }        
    })
}

//加载视频版块
let videoList = getEle('.video-box .video-list');
$.ajax({            
    url: `${BASE_URL}/video`,
    dataType: "json"
}).done(res=>{
    let html = '';
    res.data.forEach((el,idx)=>{
        el.desc = el.desc?el.desc:'';
        //a链接href="javascript:;"可使点开弹窗时，页面滚动条保持在当前位置
        html +=`<li class="video-item">
                    <a href=" javascript:;">
                        <img src="${el.image}" alt="${el.title}">
                        <span class="play"><i class="iconfont icon-bofanganniu"></i></span>
                        <p class="title">${el.title}</p>
                        <p class="desc">${el.desc}</p>
                    </a>
                </li>`
    })
    videoList.innerHTML = html;
    //加载视频弹窗
    loadPopup(res.data);
}).fail(err=>{
    console.log(err);
})           
/*******视频弹框*******/ 
let videoBox = getEle('.video-popup');
function loadPopup(res){
    let popupBox = getEle('.video-popup .popup-box');
    let videoItem = [...getEle('.video-box .video-list .video-item',true)];
    videoItem.forEach((el,idx)=>{
        el.onclick=()=>{
            popupBox.innerHTML = `
                                <div class="title">
                                    <span>${res[idx].title}</span>
                                    <i class="iconfont icon-baseline-close-px fr"></i>
                                </div>
                                <video src="${res[idx].video}" poster="${res[idx].poster}" preload="none" controls="controls" autoplay=true></video>`;
            //显示视频弹框
            videoBox.classList.remove('hide');
            //关闭弹窗
            if (!videoBox.classList.contains('hide')) closeVideo();              
        }
    })    
};
function closeVideo(){
    let video = getEle('.popup-box video')
    let closeBtn = getEle('.video-popup .popup-box i');
    closeBtn.onclick = () => {
        videoBox.classList.add('hide');
        video.pause();
    } 
}


//切换函数
function tabSwitch(){
    let tabLis = [...getEle('.box-hd .tab-list li',true)];
    if(tabLis.length>0){
        tabLis.forEach(el => {
            el.addEventListener('mouseenter', e => {
                for (let el of e.target.parentElement.children) {
                    //如果tabli的某个兄弟有tab-active就给其取消
                    if (el.classList.contains('tab-active')) {
                        el.classList.remove('tab-active')
                    }
                    e.target.classList.add('tab-active')
                    //当前选项卡对应的祖先.brick-box
                    let curBrickBox = e.target.parentElement.parentElement.parentElement.parentElement;
                    //当前选项卡对应的.brick-list
                    let brickLists = [...curBrickBox.querySelectorAll('.box-bd .right ul.brick-list')];
                    // 获取当前选项卡在兄弟中的索引值
                    let curIndex = Array.from(e.target.parentElement.children).indexOf(e.target)
                    console.log(curIndex);
                    //遍历商品ul的所有项目，如果该项目的索引值等于选项卡的项目则让他显示，否则就隐藏
                    brickLists.forEach((el,idx)=>{
                        if(idx == curIndex){
                            el.classList.remove('hide')
                        }else{
                            el.classList.add('hide')
                        }
                    })
                };
            })
        })
    }
    
}
tabSwitch();

/******秒杀倒计时******/
//获取元素
let timeEle = [...getEle('.home-flashsale .countdown span',true)];
let round = getEle('.home-flashsale .count .round');
let desc = getEle('.home-flashsale .count .desc');
function countdown(){
    //获取当前日期
    let curDate = new Date();
    desc.innerHTML = (60-curDate.getMinutes()) > 9 ? '距离结束还有':'本场已结束';
    //判断场次
    round.innerHTML = getStr(curDate)[0];
    //获得场次时间字符串
    let dateStr = getStr(curDate)[1]; 
    //获取时间差
    let ms = new Date(dateStr) - curDate;
    //计算小时，分钟，秒钟
    let timeArr = [
                    Math.floor(ms/1000/60/60%24),
                    Math.floor(ms/1000/60%60),
                    Math.floor(ms/1000%60)
                ];
    //赋值
    timeEle.forEach((el,idx)=>{
        el.innerHTML = timeArr[idx].toString().padStart(2,'0');
    })
}
countdown();
setInterval(countdown,1000);
//封装函数
//获得场次以及场次时间
function getStr(date){
    let hour = date.getHours();
    if(0 <= hour && hour<10){return ['00:00 场',`${date.toLocaleDateString()} 09:41:00`]}
    else if(10 <= hour && hour<14){return ['10:00 场',`${date.toLocaleDateString()} 13:41:00`]}
    else if(14 <= hour && hour<20){return ['04:00 场',`${date.toLocaleDateString()} 19:41:00`]}
    else if(20 <= hour && hour<24){return ['20:00 场',`${date.toLocaleDateString()} 23:41:00`]}
}




/****侧边工具栏窗口自适应****/ 
(function e(){
    let curWidth=document.documentElement.clientWidth || document.body.clientWidth;
    let toolBar = document.querySelector('.tool-bar');
    if(curWidth<1350){
        toolBar.classList.add('tool-bar-small');
    }
    $(window).resize(function(){
        curWidth=document.documentElement.clientWidth || document.body.clientWidth;
        if(curWidth<1276){
            toolBar.classList.add('mini');
        }       
        else{
            toolBar.classList.remove('mini');

        }
    });
})();

/***回到顶部***/
let btn = getEle('.tool-bar .backtop');
scrollToTop({el:btn,duration:200,pageScroll:(offset)=>{
    offset >= 700?btn.classList.add('active'):btn.classList.remove('active')
}});

/********判断用户是否登录********/ 
let username = localStorage.getItem('username');
let infoEle = [...getEle('.topbar-info',true)]
let name = getEle('.topbar-info .username')
if(username){
    infoEle[0].classList.add('hide');
    infoEle[1].classList.remove('hide');
    name.innerText = username;
}

/***购物车跳转***/ 
// let toCartBtn = getEle('.cart button');
// toCartBtn.forEach(el=>{
//     el.onclick = ()=>{
//         if(username){
//             jumpUrl("../pages/cart.html")
//         }
//         else{
//             jumpUrl("../pages/login.html")
//         }
//     }
// })