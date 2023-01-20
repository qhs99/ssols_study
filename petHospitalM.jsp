<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="userPet.hospitalBean"%>
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
<jsp:useBean id="hdao" class="userPet.hospitalDAO"/>
<% 
	int num = Integer.parseInt(request.getParameter("num"));
	hospitalBean hdo = hdao.getHosOne(num);
%>
	

<div class= "container" style="flex-basis: 100%;"></div>
<div class="container border form_container" style="margin-top:60px; padding:40px; width:40%;">
	<form class="row g-4" action="petHospitalMProc.jsp" method="post">
		<div class="col-md-6">
		    <label for="exampleInputEmail1" class="form-label">병원명</label>
		    <input type="text"
				   class="form-control"
				   name = "name"
				   value="<%=hdo.getName()%>">
	  	</div>
		<div class="col-md-6">
			<label for="exampleInputPassword2" class="form-label">전화번호</label>
			<input type="text"
				   class="form-control"
 			       name = "tell"
 			       value="<%=hdo.getTell()%>">
	  	</div>
	  	<div class="col-12">
	    	<label for="exampleInputPassword1" class="form-label">증상</label>
	    	<input type="text"
	    			class="form-control"
			    	name="reason"
			    	value="<%=hdo.getReason()%>">
	  	</div>
	  	<div class="col-md-6">
	    	<label for="exampleInputPassword1" class="form-label">진단명</label>
	    	<input type="text"
	    			class="form-control"
			    	name="diagnosticName"
			    	value="<%=hdo.getDiagnosticName()%>">
	  	</div>
	  	<div class="col-md-6">
	    	<label for="exampleInputPassword1" class="form-label">처방전</label>
	    	<input type="text"
	    			class="form-control"
			    	name="prescription"
			    	value="<%=hdo.getPrescription()%>">
	  	</div>
	  	<div class="col-md-3">
	  		<label for="exampleInputPassword1" class="form-label">날짜</label>
	  		<input type="date"
	  		 	   class="form-control"
	  		 	   name="date"
	  		 	   value="<%=hdo.getDate()%>">
	  	</div>
	  	<div class="col-12">
	  	<input type="hidden" value="<%=hdo.getNum() %>" name="num">
	  		<button type="submit" class="btn btn-primary">저장</button>
			<button type="submit" class="btn btn-danger" onclick="<script>history.back();</script>">
			취소</button>
		</div>
	  
	  
	</form>
</div>
	
</body>
</html>