<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.DAO.UserDao"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- 导入JQuery -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<meta charset="utf-8">
		<title>教务管理系统-管理员页面</title>

		<!-- 导入BootStrap3 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
		 crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		 crossorigin="anonymous"></script>
	</head>

	<script type="text/javascript">
		// 设置点击“个人信息”的跳转和样式变化
		function lookUser() {
			// 隐藏其他三个界面
			document.getElementById("Grade").style.display = "none";
			document.getElementById("People").style.display = "none";
			document.getElementById("SetUser").style.display = "none";
			// 设置按钮样式变化
			document.getElementById("littlelist1").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0.4);";
			document.getElementById("littlelist2").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0);";
			document.getElementById("littlelist3").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0);";
			document.getElementById("littlelist4").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0);";
		};

		// 设置点击“修改课表”的跳转和样式变化
		function lookGrade() {
			// 隐藏其他三个界面
			document.getElementById("User").style.display = "none";
			document.getElementById("People").style.display = "none";
			document.getElementById("SetUser").style.display = "none";
			// 设置按钮样式变化
			document.getElementById("littlelist1").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0);";
			document.getElementById("littlelist2").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0.4);";
			document.getElementById("littlelist3").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0);";
			document.getElementById("littlelist4").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0);";

		};

		// 设置点击“修改人员”的跳转和样式变化
		function lookPeople() {
			// 隐藏其他三个界面
			document.getElementById("User").style.display = "none";
			document.getElementById("Grade").style.display = "none";
			document.getElementById("SetUser").style.display = "none";
			// 设置按钮样式变化
			document.getElementById("littlelist1").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0);";
			document.getElementById("littlelist2").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0);";
			document.getElementById("littlelist3").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0.4);";
			document.getElementById("littlelist4").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0);";
		};

		// 设置点击“修改信息”的跳转和样式变化
		function updateUserInfo() {
			// 隐藏其他三个界面
			document.getElementById("User").style.display = "none";
			document.getElementById("Grade").style.display = "none";
			document.getElementById("People").style.display = "none";
			// 设置按钮样式变化
			document.getElementById("littlelist1").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0);";
			document.getElementById("littlelist2").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0);";
			document.getElementById("littlelist3").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0);";
			document.getElementById("littlelist4").style = "width: 100%;height: 11%;background-color: rgba(0, 0, 0, 0.4);";
		};
	</script>

	<style>
		/* 整个界面样式 */
		#main_box {
			position: relative;
			top: 10%;
			left: 0;
			width: 100%;
			height: 100%;
			background-repeat-y: no-repeat;
			background-size: cover;
			-webkit-background-size: cover;
			background-position: center 0;
		}
		/* 系统标题样式 */
		#title_box {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-repeat-y: no-repeat;
			background-size: cover;
			-webkit-background-size: cover;
			background-position: center 0;
			float: left;
		}
		/* 系统用户样式 */
		#me {
			position: absolute;
			top: 6px;
			right: 100px;
			width: 100%;
			height: 100%;
			background-repeat-y: no-repeat;
			background-size: cover;
			-webkit-background-size: cover;
			background-position: center 0;
			float: right;
		}
		/* 系统标题文字样式 */
		#title-text {
			width: 20%;
			height: auto;
			margin-left: 50px;
		}
		/* 个人信息按钮触碰颜色变化 */
		#littlelist1:hover {
			background-color: rgba(0,0,0,0.4);
		}
		/* 修改课表按钮触碰颜色变化 */
		#littlelist2:hover {
			background-color: rgba(0,0,0,0.4);
		}
		/* 修改人员按钮触碰颜色变化 */
		#littlelist3:hover {
			background-color: rgba(0,0,0,0.4);
		}
		/* 修改信息按钮触碰颜色变化 */
		#littlelist4:hover {
			background-color: rgba(0,0,0,0.4);
		}
		/* 退出系统按钮样式 */
		#logout_b {
			background-color: rgba(0, 170, 255, 0);
			border-radius: 5px;
			border: 0;
			cursor: pointer;
			color: white;
		}
	</style>
	<!-- 设置功能按钮点击之后，功能界面为渐入效果 -->
	<script>
		$(document).ready(function(){
			$("#listbutton1").click(function(){
				$("#User").fadeIn("slow");
			})
			$("#listbutton2").click(function(){
				$("#Grade").fadeIn("slow");
			})
			$("#listbutton3").click(function(){
				$("#People").fadeIn("slow");
			})
			$("#listbutton4").click(function(){
				$("#SetUser").fadeIn("slow");
			})
			
		})
	</script>
	<body>
		<!-- 整个界面 -->
		<div id="main_box" style="width: 100%;height: 840px;background-color: rgba(0,0,0,0.1);">
			<!-- 标题 -->
			<div id="title_box" style="width: 100%;height: 10%;background-color: rgba(0, 0, 127, 0.7);">
				<div id="title-text">
					<!-- 标题文字 -->
					<h1 style="color: white;text-align: ;font-family: 华文行楷;font-size: 36px;position: absolute;top: 5px;left: 40px;cursor: pointer;"
					 onclick="location=location">教务管理系统</h1>
				</div>
				<!-- 用户 -->
				<div id="me" style="width: auto;height: auto;float: left;margin: 0 auto;">
					<h1 style="font-size: 28px;float: left;color: white;letter-spacing: 5px;font-family: 等线;">欢迎,</h1>
					<h1 style="font-size: 28px;float: right;color: white;letter-spacing: 5px;font-family: 等线;">再花</h1>
				</div>
				<!-- 退出系统 -->
				<div id="Logout" style="float: right;position: absolute;top: 0;right: 0;">
					<button id="logout_b" onclick="window.location.href='index.html'" style="font-family: 仿宋;">退出系统</button>
				</div>
			</div>
			<!-- 功能按钮界面 -->
			<div id="main_box" style="width: 100%;height: 80%;">
				<div id="list_box" style="width: 15%;height: 100%;background-color: rgba(50, 50, 50, 0.6);float: left;">
					<!-- 个人信息 -->
					<div id="littlelist1" style="width: 100%;height: 11%;">
						<button type="button" id="listbutton1" style="margin: 0 auto;cursor: pointer;color: white;font-size: 24px;font-family: 楷体;background-color: rgba(0, 0, 0, 0);border: 0;width: 100%;height: 100%;"
						 onclick="lookUser();">
							<span class="glyphicon glyphicon-user" aria-hidden="true" style="color: white;font-size: 16px;"></span>
							个人信息</button>
					</div>
					<!-- 修改课表 -->
					<div id="littlelist2" style="width: 100%;height: 11%;">
						<button type="button" id="listbutton2" style="margin: 0 auto;cursor: pointer;color: white;font-size: 24px;font-family: 楷体;background-color: rgba(0, 0, 0, 0);border: 0;width: 100%;height: 100%;"
						 onclick="lookGrade();">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color: white;font-size: 16px;"></span>
							修改课表</button>
					</div>
					<!-- 修改人员 -->
					<div id="littlelist3" style="width: 100%;height: 11%;">
						<button type="button" id="listbutton3" style="margin: 0 auto;cursor: pointer;color: white;font-size: 24px;font-family: 楷体;background-color: rgba(0, 0, 0, 0);border: 0;width: 100%;height: 100%;"
						 onclick="lookPeople();">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color: white;font-size: 16px;"></span>
							修改人员</button>
					</div>
					<!-- 修改信息 -->
					<div id="littlelist4" style="width: 100%;height: 11%;">
						<button type="button" id="listbutton4" style="margin: 0 auto;cursor: pointer;color: white;font-size: 24px;font-family: 楷体;background-color: rgba(0, 0, 0, 0);border: 0;width: 100%;height: 100%;"
						 onclick="updateUserInfo();">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color: white;font-size: 16px;"></span>
							修改信息</button>
					</div>
				</div>
				<!-- 功能界面 -->
				<div id="box" style="width: 85%;height: 100%;float: right;">
					<!-- 个人信息界面 -->
					<div id="User" style="width: 100%;height: 100%;display: none;">
						<div id="title_main" style="width: 100%;height: 10%;background-color: white;border-bottom: 5px solid lightgrey;">
							<h1 style="font-size: 28px;font-family: 华文行楷;position: absolute;top: 0;left: 250px;">个人信息</h1>
						</div>
						<div style="width: 100%;height: 90%;border: 30px solid white;">
							<div style="width: 100%;height: 100%;border: 20px solid lightgrey;background-color: white;"></div>
						</div>
					</div>
					<!-- 修改课表界面 -->
					<div id="Grade" style="width: 100%;height: 100%;display: none;">
						<div id="title_main" style="width: 100%;height: 10%;background-color: white;border-bottom: 5px solid lightgrey;">
							<h1 style="font-size: 28px;font-family: 华文行楷;position: absolute;top: 0;left: 250px;">修改课表</h1>
						</div>
						<div style="width: 100%;height: 90%;border: 30px solid white;">
							<div style="width: 100%;height: 100%;border: 20px solid lightgrey;background-color: white;"></div>
						</div>
					</div>
					<!-- 修改人员界面 -->
					<div id="People" style="width: 100%;height: 100%;display: none;">
						<div id="title_main" style="width: 100%;height: 10%;background-color: white;border-bottom: 5px solid lightgrey;">
							<h1 style="font-size: 28px;font-family: 华文行楷;position: absolute;top: 0;left: 250px;">修改人员</h1>
						</div>
						<div style="width: 100%;height: 90%;border: 30px solid white;">
							<div style="width: 100%;height: 100%;border: 20px solid lightgrey;background-color: white;"></div>
						</div>
					</div>
					<!-- 修改信息界面 -->
					<div id="SetUser" style="width: 100%;height: 100%;display: none;">
						<div id="title_main" style="width: 100%;height: 10%;background-color: white;border-bottom: 5px solid lightgrey;">
							<h1 style="font-size: 28px;font-family: 华文行楷;position: absolute;top: 0;left: 250px;">修改信息</h1>
						</div>
						<div style="width: 100%;height: 90%;border: 30px solid white;">
							<div style="width: 100%;height: 100%;border: 20px solid lightgrey;background-color: white;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 导入全局样式：跟随鼠标的特效线 -->
		<!-- color：颜色，opacity：不透明度，count：线条数量 -->
		<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js" color="0,0,0" opacity='1' count="166"></script>
	</body>
</html>
