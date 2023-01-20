<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="userPet.hospitalBean" %>
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
		  <a class="nav-link active" href="petHospitalList.jsp">병원정보 보기</a>
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
	
<!-- 리스트 -->
<jsp:useBean id="hdao" class="userPet.hospitalDAO"/>
<%
	ArrayList<hospitalBean> hList = hdao.getAllHos();
%>

<div class="container border list_container" style="margin-top:60px; padding:40px; width:100%; display:flex; flex-wrap: wrap;">

	<!-- search -->
	<form class="row g-4" action="hSearch.jsp" method="post">
		<div class="input-group mb-3" style="width:30%; flex: 1 1 40%;">
			<select class="form-select" name="key">
				<option value="name">병원명</option>
				<option value="dname">진단명</option>
			</select>
			<input type="text"
				   class="form control"
				   name="value"
				   style="border: none; border-bottom: 1px solid #d0d4d9; border-top: 1px solid #d0d4d9;">
	  		<button type="submit"
	  			    class="btn btn-outline-primary"
	  			    onclick="">
	  			    검색</button>
		</div>
	</form>
	
	<!-- sort -->
	<form class="row g-4" action="hSort.jsp" method="post">
		<div class="input-group mb-3"style="width:20%; flex: 1 1 60%;">
			<Select class="form-select" name="st">
				<option value="1">병원명</option>
		  		<option value="2">진단명</option>
		  		<option value="3">처방전</option>
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
	      <th scope="col">병원명</th>
	      <th scope="col">전화번호</th>
	      <th scope="col">증상</th>
	      <th scope="col">진단명</th>
	      <th scope="col">처방전</th>
	      <th scope="col">날짜</th>
	      <th scope="col"></th>
	    </tr>
	  </thead>
	  <tbody>
	<%
		for(int i=0; i < hList.size(); i++){
			hospitalBean hbean = hList.get(i);
	%>
			<tr>
				<td> <%= i+1 %></td>
				<td> <%= hbean.getName() %> </td>
				<td> <%= hbean.getTell() %> </td>
				<td> <%= hbean.getReason() %> </td>
				<td> <%= hbean.getDiagnosticName() %> </td>
				<td> <%= hbean.getPrescription() %> </td>
				<td> <%= hbean.getDate()%> </td>
				<td>
					<button type="button"
							class="btn btn-primary"
							onclick="location.href='petHospitalM.jsp?num=<%=hbean.getNum()%>'">
							수정
					</button>
					<button type="button"
							class="btn btn-danger"
							onclick="location.href='petHospitalDelete.jsp?num=<%=hbean.getNum()%>'">
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