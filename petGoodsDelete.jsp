<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="gdao" class="userPet.goodsDAO"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	gdao.deleteGod(num);
	
	response.sendRedirect("petGoodsList.jsp");
%>
</body>
</html>