
  let timeDowns = finds(".section")
  let dayEle = finds(".day")
  let hoursEle = finds(".hour")
  let minutesEle = finds(".minute")
  let sds = finds(".seconds")

     setInterval(timeDown,1000)
        function timeDown() {
        let nowTime = new Date();
        let fTime = new Date("2020-01-25 00:00:00");
        let times = (fTime - nowTime) / 1000;
        let d = (parseInt(times / 60 / 60 / 24)).toString().padStart(2,'0');//天
        let h = (parseInt(times / 60 / 60 % 24)).toString().padStart(2,'0');//小时
        let m = (parseInt(times / 60 % 60)).toString().padStart(2,'0');//分钟
        let s = parseInt(times % 60);//秒
        console.log(h);
        

      
        dayEle.innerText = `${d}天`
        hoursEle.innerText = `${h}时`
        minutesEle.innerText = `${m}分`
        sds.innerText = `${s}秒`

    }






    // 封装函数==》
    function finds(sel, isAll) {
        if (isAll) {
            return document.querySelectorAll(sel);
        }
        return document.querySelector(sel)
    }