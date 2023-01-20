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
		  <a class="nav-link active" href="petGoods.jsp">상품정보 입력</a>
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
		<script>
		alert("로그인시 이용 가능합니다");
		history.back();
		</script>
		<button type ="button" class="btn btn-primary" onclick="location.href='petLogin.jsp'">로그인</button>
	<%
		}
		else {
	%>
		<button type ="button" class="btn btn-primary" onclick="location.href='petLogout.jsp'">로그아웃</button>
	<%
		}
	%>
	
<!-- 상품 정보 입력 -->
<div class= "container" style="flex-basis: 100%;"></div>
<div class="container border form_container" style="margin-top:60px; padding:40px; width:40%;">
	<form class="row g-4" action="petGoodsProc.jsp" method="post">
		<div class="col-md-6">
		    <label for="exampleInputEmail1" class="form-label">상품명</label>
		    <input type="text"
				   class="form-control"
				   name = "name">
	  	</div>
		<div class="col-md-6">
			<label for="exampleInputPassword2" class="form-label">분류</label>
			<input type="text"
	    			class="form-control"
			    	name="kind">
		</div>
	  	<div class="col-md-6">
	    	<label for="exampleInputPassword1" class="form-label">상품 가격</label>
	    	<input type="text"
	    			class="form-control"
			    	name="price">
	  	</div>
	  	<div class="col-md-6">
	    	<label for="exampleInputPassword1" class="form-label">상품 개수</label>
	    	<input type="text"
	    			class="form-control"
			    	name="cnt">
	  	</div>
	  	<div class="col-3">
	    	<label for="exampleInputPassword1" class="form-label">평점</label>
	    	<input type="number"
	    			class="form-control"
			    	name="star"
			    	min="1"
			    	max="10"
			    	placeholder="1~10">
	  	</div>
	  	<div class="col-md-3">
	  		<label for="exampleInputPassword1" class="form-label">날짜</label>
	  		<input type="date"
	  		 	   class="form-control"
	  		 	   name="date">
 	   </div>
	  	<div class="col-12">
	  		<button type="submit" class="btn btn-primary">저장</button>
			<button type="reset" class="btn btn-danger">지우기</button>
		</div>
	  
	  
	</form>
</div>
</body>
</html>