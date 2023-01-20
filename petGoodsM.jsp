<%@page import="org.eclipse.jdt.internal.compiler.ast.Javadoc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="userPet.goodsBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="gdao" class="userPet.goodsDAO"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	goodsBean gdo = gdao.getGodOne(num);
%>
<div class="container border form_container" style="margin-top:60px; padding:40px; width:40%;">
	<form class="row g-4" action="petGoodsMProc.jsp" method="post">
		<div class="col-md-6">
		    <label for="exampleInputEmail1" class="form-label">상품명</label>
		    <input type="text"
				   class="form-control"
				   name = "name"
				   value="<%=gdo.getName()%>">
	  	</div>
		<div class="col-md-6">
			<label for="exampleInputPassword2" class="form-label">분류</label>
			<input type="text"
	    			class="form-control"
			    	name="kind"
			    	value="<%=gdo.getKind()%>">
		</div>
	  	<div class="col-md-6">
	    	<label for="exampleInputPassword1" class="form-label">상품 가격</label>
	    	<input type="text"
	    			class="form-control"
			    	name="price"
			    	value="<%=gdo.getPrice()%>">
	  	</div>
	  	<div class="col-md-6">
	    	<label for="exampleInputPassword1" class="form-label">상품 개수</label>
	    	<input type="text"
	    			class="form-control"
			    	name="cnt"
			    	value="<%=gdo.getCnt()%>">
	  	</div>
	  	<div class="col-3">
	    	<label for="exampleInputPassword1" class="form-label">평점</label>
	    	<input type="number"
	    			class="form-control"
			    	name="star"
			    	min="1"
			    	max="10"
			    	placeholder="1~10"
			    	value="<%=gdo.getStar()%>">
	  	</div>
	  	<div class="col-md-3">
	  		<label for="exampleInputPassword1" class="form-label">날짜</label>
	  		<input type="date"
	  		 	   class="form-control"
	  		 	   name="date"
	  		 	   value="<%=gdo.getDate()%>">
	  	</div>
	  <input type="hidden" value="<%=gdo.getNum()%>" name="num">
	  	<div class="col-12">
	  		<button type="submit" class="btn btn-primary">저장</button>
			<button type="submit" class="btn btn-danger" onclick="<script>history.back();</script>">
			취소</button>
		</div>
	  
	  
	</form>
</div>
</body>
</html>