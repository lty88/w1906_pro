# 用户接口

【1.登陆】
- 接口地址：POST /login
- 接口参数：
|账号|username|string|require|
|密码|password|string|require|

【2.注册】
- 接口地址：POST /register
- 接口参数：
|账号|username|string|require|
|密码|password|string|require|
|电话|tel     |string|options|
|邮箱|email   |string|options|

# 产品接口

【1.头部导航栏】
- 接口地址：GET / head-nav
- 接口参数：
|产品名|name|string|require|
|图片名|avatar|string|require|
|宽度|width|number|require|
|高度|height|number|require|
|格式|format|string|require|
|价格|price|string|require|

【2.电视】
【3.家电】
【4.路由器】
【5.智能硬件】

# 状态码参照表
200 - 成功
201 - 用户不存在
202 - 用户已存在
203 - 密码错误
204 - 请求参数有误
500 - 服务器异常

