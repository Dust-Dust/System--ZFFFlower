<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- 导入JQuery -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<meta charset="utf-8" />
		<!-- 导入BoostStrap3 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<title>欢迎登录教务管理系统</title>

		<script type="text/javascript">
			// 验证登录账号密码输入框是否为空
			document.getElementById("LoginButton").onclick = function checkForm() {
				var username = document.getElementById("username");
				var userpass = document.getElementById("userpass");
				if (username == "") {
					alert("账号不能为空！");
					return false;
				}else if(userpass == ""){
					alert("密码不能为空！");
					return false;
				}else{
					return true;
				}
			}
		</script>

		<style type="text/css">
			/* 整个界面样式 */
			#main_box {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background-repeat-y: no-repeat;
				background-size: cover;
				-webkit-background-size: cover;
				background-position: center 0;
			}
			/* 注册按钮设置触碰变色 */
			#register_b:hover {
				text-decoration: none;
				color: red;
			}
			/* 登录按钮样式 */
			#LoginButton {
				background-color: rgba(0, 170, 255, 0.5);
				border-radius: 5px;
				border: 0;
				cursor: pointer;
				color: white;
			}
			/* 登录按钮设置触碰变色 */
			#LoginButton:hover {
				background-color: rgba(85, 255, 255, 0.5);
			}
			/* 登录框样式 */
			#login_box {
				/* border: 0.4px solid lightskyblue; */
				border-radius: 5px;
				background-color: rgba(2, 230, 255, 0.1);
				position: relative;
				float: left;
				left: 55%;
				top: 8%;
			}
			/* 注册框样式 */
			#register_box {
				border-radius: 5px;
				background-color: rgba(2, 230, 255, 0.1);
				float: right;
				position: relative;
				right: 55%;
				top: 8%;
			}
			/* 登录框账号输入框样式 */
			#username {
				border-bottom: white 1px solid;
				border-left-width: 0px;
				border-right-width: 0px;
				border-top-width: 0px;
				background-color: transparent;
				color: white;
				outline: none
			}
			/* 登录框密码输入框样式 */
			#userpass {
				border-bottom: white 1px solid;
				border-left-width: 0px;
				border-right-width: 0px;
				border-top-width: 0px;
				background-color: transparent;
				outline: none color: white;
			}
			/* 注册框注册按钮样式 */
			#RegisterButton_r {
				background-color: rgba(0, 170, 255, 0.5);
				border-radius: 5px;
				border: 0;
				cursor: pointer;
				color: white;
			}
			/* 注册框注册按钮设置触碰变色 */
			#RegisterButton_r:hover {
				background-color: rgba(85, 255, 255, 0.5);
			}
			/* 注册框返回按钮样式 */
			#BackButton_r {
				background-color: rgba(184, 184, 184, 0.5);
				border-radius: 5px;
				border: 0;
				cursor: pointer;
				color: white;
			}
			/* 注册框返回按钮设置触碰变色 */
			#BackButton_r:hover {
				background-color: rgba(255, 255, 255, 0.5);
			}
			/* 整个界面背景设置半透明 */
			.main_box {
				filter: alpha(opacity=50);
				-moz-opacity: 0.5;
				-khtml-opacity: 0.5;
				opacity: 0.8;
				width: 100%;
				position: absolute;
				background-attachment: fixed;
				background: url(./img/timg.png);
			}
		</style>
		<script>
			// 设置登录框和输入框渐变效果
			$(document).ready(function(){
			
			// 登录框和输入框默认隐藏
				$("#register_box").hide();
				$("#login_box").hide();
			
			//第一次加载界面登录框自动渐入 
			$("#login_box").fadeIn("slow");	
			
			//点击注册按钮，登录框渐出，注册框渐入 
			$("#register_b").click(function(){
				$("#login_box").fadeOut("slow");
				$("#register_box").fadeIn("slow");
			})
			
			// 点击返回按钮，注册框渐出，登录框渐入
			$("#BackButton_r").click(function(){
				$("#register_box").fadeOut("slow");
				$("#login_box").fadeIn("slow");
			})
		})
		</script>
	</head>
	<body>
		<!-- 整个界面 -->
		<div id="main_box" class="main_box" style="width: 100%;height: 840px;z-index: 1;">
			<!-- 登录框 -->
			<div id="login_box" style="width: 30%;height: 70%;">
				<!-- 登录框内部 -->
				<div id="login" style="width: 100%;height: 100%;margin: 0 auto;">
					<!-- 标题 -->
					<h1 style="text-align: center;color: white;font-family:等线;font-size: 32px;padding-top: 80px;">教务管理系统登录</h1>
					<!-- 账号+密码+登录按钮+注册跳转 -->
					<table style="margin: 0 auto;">
						<tr>
							<td>
								<input type="text" name="username" id="username" style="width: 300px;height: 30px;margin-top: 30px;"
								 placeholder="账号" maxlength="16" />
							</td>
						</tr>
						<tr style="width: 20px; height: 40px;"></tr>
						<tr>
							<td>
								<input type="password" name="userpass" id="userpass" style="width: 300px;height: 30px; " placeholder="密码"
								 maxlength="16" />
							</td>
						</tr>
						<tr style="width: 20px; height: 60px;"></tr>
						<tr>
							<td style="text-align: center;">
								<input type="submit" name="submit" id="LoginButton" value="登录" style="width: 305px;height: 38px;" />
							</td>
						</tr>
						<tr style="width: 20px; height: 40px;"></tr>
						<td style="text-align: right;color: white;">没有账号？
							<a id="register_b" style="color: cornflowerblue;cursor: pointer;">前去注册</a>
						</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 注册框 -->
			<div id="register_box" style="width: 30%;height: 70%;">
				<!-- 注册框内部 -->
				<div id="register" style="width: 100%;height: 100%;margin: 0 auto;">
					<!-- 标题 -->
					<h1 style="color: white;font-family:等线;font-size: 32px;margin-top: 70px;text-align: center;">账号注册</h1>
					<!-- 账号+密码+确认密码+注册按钮+返回按钮 -->
					<table style="margin: auto;">
						<tr>
							<td>
								<input type="text" name="username_r" id="username" style="width: 300px;height: 30px;margin-top: 30px;padding: 0;"
								 placeholder="账号" maxlength="16" />
							</td>
						</tr>
						<tr style="width: 20px; height: 30px;"></tr>
						<tr>
							<td>
								<input type="password" name="userpass_r" id="userpass" style="width: 300px;height: 30px; " placeholder="密码"
								 maxlength="16" />
							</td>
						</tr>
						<tr style="width: 20px; height: 30px;"></tr>
						<tr>
							<td>
								<input type="password" name="userpass_ra" id="userpass" style="width: 300px;height: 30px; " placeholder="确认密码"
								 maxlength="16" />
							</td>
						</tr>
						<tr style="width: 20px; height: 50px;"></tr>
						<tr>
							<td style="text-align: center;">
								<input type="submit" name="submit" id="RegisterButton_r" value="注册" style="width: 305px;height: 38px;" />
							</td>
						</tr>
						<tr style="width: 20px; height: 30px;"></tr>
						<tr>
							<td style="text-align: center;">
								<input type="submit" name="submit" id="BackButton_r" value="返回" style="width: 305px;height: 38px;" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<!-- 导入全局样式：跟随鼠标的特效线 -->
		<!-- color：颜色，opacity：不透明度，count：线条数量 -->
		<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js" color="0,0,205" opacity='1' count="188"></script>
	</body>
</html>
