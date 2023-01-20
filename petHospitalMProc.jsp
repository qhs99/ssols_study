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

<jsp:useBean id="hdo" class="userPet.hospitalBean"/>
<jsp:setProperty property="*" name="hdo"/>
<jsp:useBean id="hdao" class="userPet.hospitalDAO"/>

<%
	hdao.hospitalM(hdo);
	response.sendRedirect("petHospitalList.jsp");
%>
</body>
</html>