<%@ page import="java.util.ArrayList" %> <%-- 별도로 최상단에 작성하는 것이 관례 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error500.jsp" %>
    <!-- 비즈니스 로직에서 에러가 발생할 경우 : 500 / page not found : 404 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 지시어</title>
</head>
<body>
	<%
		// ArrayList
		ArrayList<String> list = new ArrayList<>();
		list.add("servlet");
		list.add("jsp");
	%>
	<p>
		리스트의 길이 : <%= list.size() %> <br>
		0번 인덱스 값 : <%= list.get(0) %> <br>
		1번 인덱스 값 : <%= list.get(1) %> <br>
		10번 인덱스 값 : <%= list.get(10) %> <!-- arrayIndexOutofBoundsException (런타임) -->
	</p>
	<!-- web.xml 에서 apache tomcat상의 기능으로 error-page 등록 가능 -->
	<!-- 여러개 등록 가능해서 공통적으로 사용되는 에러페이지를 일반적으로 기술 -->
	<!-- 페이지 지시어를 사용하면 특정 페이지에서 발생하는 하나의 에러만 다룰 수 있음 -->
</body>
</html>