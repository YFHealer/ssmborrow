
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<title>借阅信息列表</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>


</head>

<body>
	<div style="padding: 0px; margin: 0px;">
		<ul class="breadcrumb" style="margin: 0px; padding-left: 20px;">

			<li>借阅管理</li>
			<li>显示借阅信息</li>

		</ul>
	</div>
	<div class="panel panel-default">
		<div class="panel-body">
			<form class="form-inline" method="get"
				action="${pageContext.request.contextPath }/borrow/listByPage.action">
				<div class="form-group">
					<label for="borrowId">借阅编号</label> <input type="text"
						class="form-control" id="courseId" value="${borrowId}"
						name="borrowId" />
				</div>
				<div class="form-group">
					<label for="bookId">书籍分类</label> <select class="form-control"
						id="bookId" name="bookId">
						<option value="">--请选择--</option>
						<c:forEach items="${borrowKindlist}" var="item">
							<option value="${item.kindId}"
								<c:if test="${item.kindId == bookId}">selected</c:if>>
								${item.kindName }</option>
						</c:forEach>
					</select>
				</div>

				<button type="submit" class="btn btn-primary">查询</button>
			</form>
		</div>
	</div>
	<a href="#" class="btn btn-primary" data-toggle="modal"
		data-target="#newBorrowDialog" onclick="clearBorrow()">新建</a>
	<div class="row" style="padding: 15px;">
		<table class="table ">
			<tr>

				<th>借阅编号</th>
				<th>用户编号</th>
				<th>书籍类别</th>
				<th>借阅时间</th>
				<th>还书时间</th>
				<th>书籍状态</th>
				<th>操作</th>

			</tr>

			<c:forEach items="${pageInfo.list}" var="borrow" varStatus="v">
				<tr>


					<td>${borrow.borrowId }</td>
					<td>${borrow.userId}</td>
					<td>${borrow.borrowKind.kindName}</td>
					<td>${borrow.stime}</td>
					<td>${borrow.etime}</td>
					<td>${borrow.borrowRemark}</td>
					<td><a href="#" class="btn btn-primary btn-xs"
						data-toggle="modal" data-target="#borrowEditDialog"
						onclick="editBorrow(${borrow.borrowId })">修改</a> <a href="#"
						class="btn btn-danger btn-xs"
						onclick="deleteBorrow(${borrow.borrowId })">删除</a></td>



				</tr>

			</c:forEach>
		</table>
		<nav class="navbar navbar-default navbar-fixed-bottom">
			<ul class="pagination">
				<li><a
					href="?borrowId=<c:out value="${borrowId}"/>&pageNo=<c:out value="${pageNo-1 }"/>"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<c:forEach var="i" begin="1" end="${pageInfo.pages}" step="1">
					<li><a
						href="?borrowId=<c:out value="${borrowId}"/>&pageNo=<c:out value="${i}"/>"><c:out
								value="${i}" /></a></li>
				</c:forEach>
				<li><a
					href="?borrowId=<c:out value="${borrowId}"/>&pageNo=<c:out value="${pageNo+1 }"/>"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>

		<!-- 创建模态框 -->
	<div class="modal fade" id="newBorrowDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建借阅信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_borrow_form">
						<div class="form-group">
							<label for="new_borrowId" class="col-sm-2 control-label">
								借阅编号 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_borrowId"
									placeholder="借阅编号" name="borrowId" />
							</div>
						</div>


						<div class="form-group">
							<label for="new_userId" class="col-sm-2 control-label">用户编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_userId"
									placeholder="用户编号" name="userId" />
							</div>
						</div>

						<div class="form-group">
							<label for="new_stime" class="col-sm-2 control-label">借阅时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_stime"
									placeholder="借阅时间" name="stime" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_etime" class="col-sm-2 control-label">还书时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_etime"
									placeholder="还书时间" name="etime" />
							</div>
						</div>


						<div class="form-group">
							<label for="new_bookId"
								style="float: left; padding: 7px 15px 0 27px;">书籍分类</label>
							<div class="col-sm-10">
								<select class="form-control" id="new_bookId"
									name="bookId">
									<option value="">--请选择--</option>
									<c:forEach items="${borrowKindlist}" var="item">
										<option value="${item.kindId}">
											${item.kindName }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_borrowRemark" class="col-sm-2 control-label">书籍状态</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_borrowRemark"
									placeholder="书籍状态" name="borrowRemark" />
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createBorrow()">创建</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改模态框 -->
	<div class="modal fade" id="borrowEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改借阅信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_borrow_form">
						<div class="form-group">
							<label for="edit_borrowId" class="col-sm-2 control-label">
								借阅编号 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_borrowId"
									placeholder="借阅编号" name="borrowId" />
							</div>
						</div>


						<div class="form-group">
							<label for="edit_userId" class="col-sm-2 control-label">用户编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userId"
									placeholder="用户编号" name="userId" />
							</div>
						</div>

						<div class="form-group">
							<label for="edit_stime" class="col-sm-2 control-label">借阅时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_stime"
									placeholder="借阅时间" name="stime" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_etime" class="col-sm-2 control-label">还书时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_etime"
									placeholder="还书时间" name="etime" />
							</div>
						</div>


						<div class="form-group">
							<label for="edit_bookId"
								style="float: left; padding: 7px 15px 0 27px;">书籍分类</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_bookId"
									name="bookId">
									<option value="">--请选择--</option>
									<c:forEach items="${borrowKindlist}" var="item">
										<option value="${item.kindId}">
											${item.kindName }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_borrowRemark" class="col-sm-2 control-label">书籍状态</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_borrowRemark"
									placeholder="书籍状态" name="borrowRemark" />
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateBorrow()">保存修改</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 编写js代码 -->
	<script type="text/javascript">
//清空新建窗口中的数据
	function clearBorrow() {
	    $("#new_borrowId").val("");
	    $("#new_userId").val("");
	    $("#new_stime").val("");
	    $("#new_etime").val("");
	    $("#new_bookId").val("");
	    $("#new_borrowRemark").val("");
	    
	   
	}
	// 创建
	function createBorrow() {
	$.post("${pageContext.request.contextPath}/borrow/save.action",
	$("#new_borrow_form").serialize(),function(data){
	        if(data.msg =="OK"){
	            alert("创建成功！");
	            window.location.reload();
	        }else{
	            alert("创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的信息
	function editBorrow(borrowId) {
	    $.ajax({
	        type:"get",
	        url:"${pageContext.request.contextPath}/borrow/getById.action",
	        data:{"borrowId":borrowId},
	        success:function(data) {
	            $("#edit_borrowId").val(data.borrowId);
	            $("#edit_userId").val(data.userId);
	            $("#edit_stime").val(data.stime);
	            $("#edit_etime").val(data.etime);
	            $("#edit_bookId").val(data.bookId);
	            $("#edit_borrowRemark").val(data.borrowRemark);
		            
	            
	        }
	    });
	}
    // 执行修改操作
	function updateBorrow() {
		$.post("${pageContext.request.contextPath}/borrow/update.action",$("#edit_borrow_form").serialize(),function(data){
			if(data.msg =="OK"){
				alert("信息更新成功！");
				window.location.reload();
			}else{
				alert("信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除课程
	function deleteBorrow(borrowId) {
	    if(confirm('确实要删除吗?')) {
	$.post("${pageContext.request.contextPath}/borrow/delete.action",{"borrowId":borrowId},
	function(data){
	            if(data.msg =="OK"){
	                alert("删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>
