<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showItems.jsp' starting page</title>
    
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
		  backdrop: true
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
});
  </script>
  <body>  
    <div class="container">
    	<!-- 标题 -->
    	<div class="row">
    		<div class="col-md-7">
    			<h1>SSM增删改查+分页+拦截器+日期转换</h1>
    		</div>
    		<div class="col-md-offset-10">
    			<h4>欢迎您：<span class="glyphicon glyphicon-user"></span>      <strong>${user1.username }</strong><small><a href="${pageContext.request.contextPath }/user/LogOut.action">注销</a></small></h4>
    		</div>
    	</div>    	
    	<!-- 按钮-->
    	<div class="row">    		
    		<div class="col-md-6 col-md-offset-10">    			
    		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  				<span class="glyphicon glyphicon-plus"></span>添加学生信息
			</button>
    		</div>
    	</div>
    	<!-- 表格 -->
    	<div class="row">
    		<div class="col-md-12">
    		<form action="${pageContext.request.contextPath }/items/addCar.action" method="post">
    			<table class="table table-bordered table-hover">
    				<tr class="success" align="center">
			    		<th>学生编号</th>
			    		<th>学生名称</th>
			    		<th>学生性别</th>
			    		<th>所学专业</th>
			    		<th colspan="2">操作</th>
			    	</tr>
			    	${pageInfo.list}
			    	<c:forEach items="${pageInfo.list}" var="stu">
		    		<tr align="center">
			    		<td>${stu.sno }</td>
			    		<td>${stu.sname }</td>
			    		<td>${stu.sex}</td>
			    		<td>${stu.major}</td>
			    		<td><a href="${pageContext.request.contextPath }/stus/del.action?id=${stu.sno}"><button type="button" class="btn btn-success btn-lg" onclick="return confirm('确认要删除信息') "><span class="glyphicon glyphicon-trash"></span> 删除</button></a></td>
	    				<td><a href="${pageContext.request.contextPath }/stus/findOne.action?id=${stu.sno}"><button type="button" class="btn btn-success btn-lg"><span class="glyphicon glyphicon-edit"></span> 修改</button></a></td>    				
    				</tr>
    				
    			</c:forEach>
    			</table>
    			</form>
    		</div>   	
    	</div>
    	<!-- 分页 -->
    	<div class="row">
    		<!-- 分页信息 -->
    		<div class="col-md-6">
    			<h4>当前第${pageInfo.pageNum }页，共${pageInfo.pages }页，共${pageInfo.total }条记录数</h4>
    		</div>
    		<!-- 分页条 -->
    		<div class="col-md-6">    		
	    		<ul class="pagination pagination-lg">
	    			<li><a href="${pageContext.request.contextPath }/items/queryItems.action?pn=1">首页</a></li>
	    			<c:if test="${pageInfo.hasPreviousPage }">	    				
					  <li>
					  	<a href="${pageContext.request.contextPath }/items/queryItems.action?pn=${pageInfo.pageNum-1}" aria-label="Previous">
					  	<span aria-hidden="true">&laquo;</span>
					  	</a>
					  </li>
	    			</c:if>
				  	<c:forEach items="${pageInfo.navigatepageNums }" var="nav">
				  		<c:if test="${nav==pageInfo.pageNum }">
				  			<li class="active"><a href="${pageContext.request.contextPath }/items/queryItems.action?pn=${nav}">${nav }</a></li>
				  		</c:if>
				  		<c:if test="${nav!=pageInfo.pageNum }">
				  			<li><a href="${pageContext.request.contextPath }/items/queryItems.action?pn=${nav}">${nav }</a></li>
				  		</c:if>
				  	</c:forEach>
				  <c:if test="${pageInfo.hasNextPage}">				  	
					  <li>				  
					  	<a href="${pageContext.request.contextPath }/items/queryItems.action?pn=${pageInfo.pageNum+1}" aria-label="Previous">
					  		<span aria-hidden="true">&raquo;</span>
					  	</a>
					  </li>
				  </c:if>
				  <li><a href="${pageContext.request.contextPath }/items/queryItems.action?pn=${pageInfo.pages}">末页</a></li>
				</ul>
    		</div>
    	</div>
    	<!-- 随便打的，不用看！ -->
    	<div class="row">
    			<div class="col-xs-12">
            <div class="col-md-4">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div><!--/span-->
            <div class="col-md-4">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div><!--/span-->
            <div class="col-md-4">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div><!--/span-->
            <div class="col-md-12">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div><!--/span-->                                                      
          </div><!--/row-->     
    	</div>
    </div>    
    <!-- 添加商品模态框-->
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
        <h4 class="modal-title" id="myModalLabel">添加商品</h4>
      </div>
       <form class="form-horizontal" role="form" action="${pageContext.request.contextPath }/items/addItems.action" method="post" id="form" enctype="multipart/form-data">
      <div class="modal-body">		       
			  <div class="form-group  form-group-lg">
			    <label for="firstname" class="col-sm-3 control-label">商品名称</label>
			    <div class="col-sm-5">
			      <input type="text" class="form-control input-lg" id="name" name="name" placeholder="请输入商品名字" required autofocus>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="lastname" class="col-sm-3 control-label">请输入商品价格</label>
				   <div class="col-sm-5">
				      <input type="text" class="form-control input-lg" id="price" name="price" placeholder="请输入商品价格" required autofocus>
				    </div>
		    	</div>
		    	<div class="form-group">
			    <label for="lastname" class="col-sm-3 control-label">请输入商品生产日期</label>
				   <div class="col-sm-5">
				      <input type="text" class="form-control input-lg form_datetime" id="createtime" name="createtime">
				    </div>
		    	</div>
		    	<div class="form-group">
			    <label for="lastname" class="col-sm-3 control-label">请输入商品介绍</label>
				   <div class="col-sm-5">
				      <input type="text" class="form-control input-lg" id="detail" name="detail" placeholder="请输入商品介绍" required autofocus>
				    </div>
		    	</div>
		    	<div class="form-group">
			    <label for="lastname" class="col-sm-3 control-label">请上传商品图片</label>
				   <div class="col-sm-5">
				      <input type="file" class="form-control input-lg" id="items_pic" name="items_pic">
				    </div>
		    	</div>		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary" id="save">保存</button>
      </div>
      </form>
    </div>
  </div>
</div>
  </body>
</html>
