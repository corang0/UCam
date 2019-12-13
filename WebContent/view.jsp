<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<title>u-Campus</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">유캠퍼스</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp">메인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="lectureArchives.jsp">강의 자료실</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown"
					data-toggle="dropdown"> 회원관리 </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="login.jsp">로그인</a>
						<a class="dropdown-item" href="join.jsp">회원가입</a>
					</div>
				</li>
			</ul>
			
		</div>
	</nav>
	<section class="container">
		<div class="row">
		<table class="table table-stiped table-hover" style="text-align : left; Border:1px solid  #dddddd">
			<tbody>
				<tr>
					<td>과목정보:[]</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<select class="form-control">
							<option>2019년도 1학기</option>
						</select>
					</td>
					<td style="width: 75%">
						<select class="form-control">
							<option>[학부]알고리즘(01)-박병준</option>
							<option>[학부]운영체제(02)-진혜진</option>
							<option>[학부]컴퓨터구조(01)-이동호</option>
							<option>[학부]데이터베이스(01)-김우생</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
			
		</div>
	
		<div class="row">
			<table class="table table-stiped table-hover" style="text-align : center; Border:1px solid  #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;" colspan="3">강의자료 title</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>글번호 : </td>
						<td>등록일 : 2019.04.24</td>
						<td>조회수 : </td>
					</tr>
					<tr style="height : 300px;">
						<td colspan="3" style="text-align : left;">파일 내용</td>
					</tr>
					<tr>
						<td colspan="3" style="text-align : left;">첨부파일
							<p><a href="download.jsp?file_name=turtle1.jpg">자료1</a></p>
							<p><a href="download.jsp?file_name=turtle2.jpg">자료2</a></p>
						</td>
						
					</tr>
				</tbody>
			</table>
				
			<a href="lectureArchives.jsp" class="btn btn-primary pull-right">목록</a>
		</div>
	</section>
	
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>