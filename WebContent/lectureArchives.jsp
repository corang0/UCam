<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import= "java.util.ArrayList"%>
<%@ page import= "Course.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<title>u-Campus</title>
<style type="text/css">
	a,a:hover{
		color:#000000;
		text-decoration:none;
	}
</style>
<script>
	function submitAction(){
		document.getElementById('postlist').submit();
	}
	
</script>
</head>
<body>
<%
	String userID=null;
	String userDivision=null;
	String selectedLectureName=null;
	String cid="3";
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	if(session.getAttribute("userDivision")!=null){
		userDivision=(String)session.getAttribute("userDivision");
	}
	if(request.getParameter("posts")!=null){
		selectedLectureName=request.getParameter("posts");
	}
	ArrayList<CourseDTO> lectureList=new ArrayList<>();
	CourseDAO courseDAO=new CourseDAO();
	lectureList=courseDAO.getLectureList(userID, userDivision);
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">유캠퍼스</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="main.jsp">메인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="lectureArchives.jsp">강의 자료실</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="logoutAction.jsp">로그아웃</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="*"><%=userDivision %></a>
				</li>
			</ul>
		</div>
	</nav>
	<section class="container">
		<div class="row">
		<table class="table table-stiped table-hover" style="text-align : left; Border:1px solid  #dddddd">
			<tbody>
				<tr>
					<td>과목정보</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<select class="form-control">
							<option>2019년도 1학기</option>
						</select>
					</td>
					<td style="width: 75%">
						<form method="GET" action="lectureArchives.jsp" id="postlist">
							<select class="form-control" onChange="submitAction()" name="posts">
							<%
								for(int i=0;i<lectureList.size();i++){
									CourseDTO course=lectureList.get(i);
									if(selectedLectureName.equals(course.getCname())){
										cid = course.getCid();
							%>
									<option selected="selected" value=<%=course.getCname() %>>[학부]<%=course.getCname() %></option>
									
							<%
									}else{
							%>
									<option  value=<%=course.getCname() %>>[학부]<%=course.getCname() %></option>
							
							<%
									}
								}
							%>											
							</select>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
			
		</div>
	
		<div class="row">
			<table class="table table-stiped table-hover" style="text-align : center; Border:1px solid  #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;">No</th>
						<th style="background-color: #eeeeee; text-align:center;">제목</th>
						<th style="background-color: #eeeeee; text-align:center;">등록일</th>
						<th style="background-color: #eeeeee; text-align:center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><a href="view.jsp">알고리즘 -01</a></td><!--학생으로 로그인시 download.jsp로가고  교수로 로그인시 upload.jsp로 이동한다 -->
						<td>2019-05-16</td>
						<td>12</td>
					</tr>
				</tbody>
			</table>
				
			<a href="write.jsp?cid=<%=cid%>" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</section>
	
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>