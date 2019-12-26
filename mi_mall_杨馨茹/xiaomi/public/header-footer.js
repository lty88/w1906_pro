/**显示二维码**/ 
(function(){
    let download = getEle('.topbar-download');
    download.onmouseenter = () => {
        download.classList.add('active');
    }
    download.onmouseout = () => {
        download.classList.remove('active');
    }  
})();

/**动态加载头部导航栏二级菜单**/ 
(function(){
        //1.获取元素
    let navItem = [...getEle('.header-nav .nav-item .link',true)];
    let navMenu = getEle('.header-nav-menu');
    let childList = getEle('.header-nav-menu .children-list');
    let time= {}
    // let navMenu = getEle('.header-nav-menu');
    //2.遍历元素绑定鼠标事件
    navItem.forEach(el=>{
        let idx = el.parentElement.dataset.index;
        // let idx = el.dataset.index
        console.log(el,idx)
        if(idx<=6){
            el.onmouseover= (e)=>{
                //3.动态加载二级导航栏
                navMenu.dataset.index = idx
                loadMenu(idx);
                clearTimeout(time['_timer'+ idx]);
                time['_timer'+ idx] = setTimeout(() => {
                    navMenu.classList.add('slide-down','header-nav-menu-active');
                }, 150);
                
            }
            el.onmouseout =(e)=>{
                clearTimeout(time['_timer'+ idx]);
                time['_timer'+ idx] = setTimeout(() => {
                    navMenu.classList.remove('slide-down','header-nav-menu-active');
                }, 150);
            }        
        }
    });
    navMenu.onmouseover=()=> {
        let idx = navMenu.dataset.index
        clearTimeout(time['_timer'+ idx]);
        time['_timer'+ idx] = setTimeout(() => {
            navMenu.classList.add('slide-down','header-nav-menu-active');
        }, 150);
    }
    navMenu.onmouseout=()=> {
        let idx = navMenu.dataset.index
        clearTimeout(time['_timer'+ idx]);
        time['_timer'+ idx] = setTimeout(() => {
            navMenu.classList.remove('slide-down','header-nav-menu-active');
        }, 150);
    }
    //封装函数
    function loadMenu(idx){
        //ajax请求后台数据
        $.ajax({
            url: `${BASE_URL}/products`,
            data:{
                idx:`${idx}`,
                site:`head`
            },  
            dataType: "json"
        }).done(res => {
            let htmlStr = '';       
            res.data.forEach(el=>{
                htmlStr += `
                            <li>
                                <a href="">
                                    <img src="${el.path}" alt="${el.name}" width="${el.width}px" height="${el.height}px">
                                    <p class="title">${el.name}</p>
                                    <p class="price">${el.price}</p>
                                </a>
                            </li>
                            `;
            })
            childList.innerHTML = htmlStr;
        }).fail(err => {
            console.log(err);
        }); 
    }
})();

/**搜索框**/ 
(function(){
    //获取元素
    let formEle = getEle('.header-search .search-form'),
        inputEle = getEle('.header-search .search-text'),
        hotWord = getEle('.search-hot-words'),
        keyList = getEle('.keyword-list');
    //搜索框获得焦点
    inputEle.onfocus = function () {
        formEle.classList.add('search-form-focus');
        keyList.classList.remove('hide');
        hotWord.className = 'search-hot-words fade-out';
    }
    //搜索框失去焦点
    inputEle.onblur = function () {
        formEle.classList.remove('search-form-focus');
        keyList.classList.add('hide');
        if (inputEle.value == '') {
            hotWord.className = 'search-hot-words fade-in';
        }
    }
})();

