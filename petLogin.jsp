<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
	crossorigin="anonymous">
<link rel="stylesheet" href="projectStyle.css">
<title>Insert title here</title>
</head>
<body>
 	 <%
	String userId = null; //로그인 안 하면 null값
	if(session.getAttribute("userId") != null) { //로그인 한 사람이라면 값을 갖게 됨
		userId = (String) session.getAttribute("userId");
	}
%>

<nav class="navbar">
	<div class="navbar-logo">
		<a class="navbar-brand" href="petMainA.jsp">care pet</a>
	</div>
	<ul class="nav nav-tabs">
		<li class="nav-item">
		  <a class="nav-link" href="petHospital.jsp">병원정보 입력</a>
		</li>
		<li class="nav-item">
		  <a class="nav-link" href="petHospitalList.jsp">병원정보 보기</a>
		</li>
		<li class="nav-item">
		  <a class="nav-link" href="petGoods.jsp">상품정보 입력</a>
		</li>
		<li class="nav-item">
		  <a class="nav-link" href="petGoodsList.jsp">상품정보 보기</a>
		</li>
		<li class="nav-item">
		  <a class="nav-link" href="#">공지사항</a>
		</li>
	</ul>
	
	<%
		if(userId == null) {
	%>
		<button type ="button" class="btn btn-primary" onclick="location.href='petLogin.jsp'">로그인</button>
	<%
		}
		else {
	%>
		<button type ="button" class="btn btn-primary" onclick="location.href='petLogout.jsp'">로그아웃</button>
	<%
		}
	%>
</nav>
	 <div class="container" style="display:flex;">
	 	<div class="col-lg-4"></div>
	 	<div class="col-lg-4">
 			<form method="post" action="petLoginA.jsp" style="padding-top: 50px;">
 				<h3 style="text-align: center;">로그인 화면</h3>
 				<div class="form-group">
 					<input type="text" class="form-control" placeholder="아이디" name="userId" maxlength="20" style="margin-top:20px;">
 				</div>
 				<div class="form-group">
 					<input type="password" class="form-control" placeholder="비밀번호" name="userPass" maxlength="20" style="margin-top:20px;">
 				</div>
 				<input type="submit" class="btn btn-primary form-control" value="로그인" style="margin-top:20px;">
 			</form>
	 	</div>
	 	<div class="col-lg-4"></div>
	 </div>
</body>
</html>