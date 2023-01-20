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
	/* 이 페이지에 접속한 회원이 세션을 빼앗겨서 로그아웃 됨 */
	session.invalidate();
%>
<script>
	location.href = 'petMainA.jsp';
</script>
</body>
</html>