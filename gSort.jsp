<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="userPet.goodsBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
	crossorigin="anonymous">
<link rel="stylesheet" href="projectStyle.css">
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
		  <a class="nav-link active" href="petGoodsList.jsp">상품정보 보기</a>
		</li>
		<li class="nav-item">
		  <a class="nav-link" href="#">공지사항</a>
		</li>
	</ul>
	
<%
	if(userId == null) {
%>
	<!-- <script>
	alert("로그인시 이용 가능합니다");
	history.back();
	</script> -->
	<button type ="button" class="btn btn-primary" onclick="location.href='petLogin.jsp'">로그인</button>
<%
	}
	else {
%>
	<button type ="button" class="btn btn-primary" onclick="location.href='petLogout.jsp'">로그아웃</button>
<%
	}
%>

<!-- 리스트 -->
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="gdao" class="userPet.goodsDAO"/>
<jsp:useBean id="gdo" class="userPet.goodsBean"></jsp:useBean>
<%
	String st = request.getParameter("st");
	String sort = request.getParameter("sort");
	ArrayList<goodsBean> gList = gdao.sortGod(st, sort);
%>

<div class="container border list_container" style="margin-top:60px; padding:40px; width:100%; display:flex;">
		<div class="input-group mb-3" style="width:30%; flex: 1 1 40%;"></div>
	<form class="row g-4" action="gSort.jsp" method="post">
		<div class="input-group mb-3"style="width:20%; flex: 1 1 60%;">
			<Select class="form-select" name="st">
				<option value="1">상품명</option>
		  		<option value="2">분류</option>
		  		<option value="3">평점</option>
		  		<option value="4">날짜</option>
			</Select>
			<button type="submit"
		  			    class="btn btn-outline-primary"
		  			    onclick=""
		  			    name="sort"
		  			    value="asc">
		  			    ↑</button>
		    <button type="submit"
				    class="btn btn-outline-primary"
				    onclick=""
				    name="sort"
				    value="desc">
				    ↓</button>
	    </div>
	</form>
	<table class="table table-hover">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">상품명</th>
	      <th scope="col">분류</th>
	      <th scope="col">상품 가격</th>
	      <th scope="col">상품 개수</th>
	      <th scope="col">평점 (1~10)</th>
	      <th scope="col">날짜</th>
	      <th scope="col"></th>
	    </tr>
	  </thead>
	  <tbody>
	<%
		for(int i=0; i < gList.size(); i++){
			goodsBean gbean = gList.get(i);
	%>
			<tr>
				<td> <%= i+1 %></td>
				<td> <%= gbean.getName() %> </td>
				<td> <%= gbean.getKind() %> </td>
				<td> <%= gbean.getPrice() %> </td>
				<td> <%= gbean.getCnt() %> </td>
				<td> <%= gbean.getStar() %> </td>
				<td> <%= gbean.getDate()%> </td>
				<td>
					<button type="button"
							class="btn btn-primary"
							onclick="location.href='petHospitalM.jsp?num=<%=gbean.getNum()%>'">
							수정
					</button>
					<button type="button"
							class="btn btn-danger"
							onclick="location.href='petHospitalDelete.jsp?num=<%=gbean.getNum()%>'">
							삭제
					</button>
				</td>
			</tr>
	<%
		}
	%>
	    
	  </tbody>
	</table>
</div>
</body>
</html>