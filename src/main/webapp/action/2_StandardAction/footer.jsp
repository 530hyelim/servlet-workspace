<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date date = new Date();
		String year = new SimpleDateFormat("yyyy").format(date);
		//String test = "ㅋㅋ"; // pageContext에 등록이 안돼서 그런거. 영역 자체는 pageScope는 맞음
		//pageContext.setAttribute("test", test);
		//PageContext pageScope. 13번줄만 하면 그냥 변수임
	%>
	<br> Copyright &copy; 1998-<%= year %> KH Information에 저작권 있음. <br>
	파람값 : ${param.test} <br>
</body>
</html>