<%@page import="userPet.hospitalBean"%>
<%@page import="java.util.ArrayList"%>
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

<!-- 서치 -->
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="hdo" class="userPet.hospitalBean"/>
<jsp:useBean id="hdao" class="userPet.hospitalDAO"/>

<%
	String key = request.getParameter("key");
	String value = request.getParameter("value");
	
	ArrayList<hospitalBean> hList = hdao.searchHos(key, value);
%>
<div class="container border list_container" style="margin-top:60px; padding:40px; width:100%; display:flex; flex-wrap: wrap;">
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