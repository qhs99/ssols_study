<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="user" class="user.UserDo" scope="page"/>
<!-- 로그인 페이지에서 넘겨준 userId 를 받음-->
<jsp:setProperty property="userId" name="user"/>
<jsp:setProperty property="userPass" name="user"/>

<%
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserId(), user.getUserPass());
	if (result == 1) {
		session.setAttribute("userId", user.getUserId());
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='petMainA.jsp'");
		script.println("</script>");
	}
	else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다')");
		script.println("history.back()");
		script.println("</script>");
	}
%>

</body>
</html>