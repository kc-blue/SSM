<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
 	<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css"/>
 	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
 	<script type="text/javascript" src="js/bootstrap.min.js"></script>
 	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
 	<script type="text/javascript" src="js/bootstrap-datetimepicker.zh-CN.js"></script>
  </head>
  <style>
  </style>
  <script type="text/javascript">
  	 $("#myModal").modal({
		  keyboard: false,
		  backdrop: false
		});		
$(function () {

	 $(".form_datetime").datetimepicker({
			 format: "yyyy-mm-dd hh:ii",
			 autoclose: true,
			 todayBtn: true,
			 todayHighlight: true,
			 showMeridian: true,
			 pickerPosition: "bottom-left",
			 language: 'zh-CN',//中文，需要引用zh-CN.js包
			 startView: 2,//月视图
			 minView: 2//日期时间选择器所能够提供的最精确的时间选择视图
			 });
		 $("#lo").click(
			function(){
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/user/checkLogin.action',
					contentType:'application/json;charset=utf-8',
					data:JSON.stringify({"username":$("#loginusername").val(),"password":$("#loginpassword").val()}),
					success:function(data){
						if(data==""||data==null){
							$("#message").html("用户名或密码错误");							
						}else
						{
							window.location.href="${pageContext.request.contextPath}/stu/queryStudents.action";													
						}
					}
				});
		});
});
 		
  </script>
  	<style>
		#login{ width:450px; height:100px; margin:50px auto;}
	</style>
  <body>
  <div  class="container">
    <div id="login">
    <form class="form-horizontal" role="form">
	  	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="loginusername" name="username" placeholder="请输入您的用户名"  required autofocus>
	    	    	
	    </div>
  	</div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="loginpassword" name="password" placeholder="请输入您的密码" required>
    	<label class="control-label" for="inputSuccess1" style="color:red;" id="message"></label>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-info" id="lo">登陆</button>
      <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">点击注册新用户</button>
    </div>
  </div>
  </form>
<!-- 注册模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">用户注册</h4>
      </div>
      <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/user/register.action" method="post" id="form">
      <div class="modal-body">
       		<!-- 表单 -->      		
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-3 control-label">用户名</label>
				    <div class="col-sm-6">
				      <input type="text" class="form-control" id="username" name="username" placeholder="请输入您的用户名" required autofocus>
				    </div>	    	    
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-3 control-label">密码</label>
				    <div class="col-sm-6">
				      <input type="password" class="form-control" id="password" name="password" placeholder="请输入您的密码" required autofocus>
				    </div>
				  </div>
				  <div class="form-group">
			    <label for="lastname" class="col-sm-3 control-label">请输入出生日期</label>
				   <div class="col-sm-6">
				      <input type="text" class="form-control input-lg form_datetime" id="birthday" name="birthday">
				    </div>
		    	</div>	
		    	<div class="form-group">
				    <label for="inputEmail3" class="col-sm-3 control-label">请输入地址</label>
				    <div class="col-sm-6">
				      <input type="text" class="form-control" id="address" name="address" placeholder="请输入您的地址" required autofocus>
				    </div>	    	    
				  </div>		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary" id="save">注册</button>
      </div>
      </form>
    </div>
  </div>
</div>
</div>
</div>
  </body>
</html>
