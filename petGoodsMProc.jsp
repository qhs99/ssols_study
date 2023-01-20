<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="gdo" class="userPet.goodsBean"/>
<jsp:setProperty property="*" name="gdo"/>
<jsp:useBean id="gdao" class="userPet.goodsDAO"/>

<%
	gdao.goodsM(gdo);
	response.sendRedirect("petGoodsList.jsp");
%>
</body>
</html>