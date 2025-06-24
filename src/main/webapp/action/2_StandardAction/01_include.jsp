<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>include</h3>
	<p>현재 페이지에 또다른 JSP를 포함(include)하고자 할 때 사용하는 태그</p>
	<h4>1. include 지시어를 활용한 페이지 포함 방식(정적 include 방식)</h4>
<%-- 	<%@ include file="footer.jsp" %> --%> <!-- JSP 주석 : ctrl+shift+slash -->
	<br><br>
	특징 : include하고 있는 페이지상에 선언되어 있는 변수를 현재 페이지에서도 사용 가능 <br>
<%-- 	year : <%= year %> --%>
	<hr>
	<h4>2. JSP 표준 액션태그 include를 이용한 방식 (동적 include 방식)</h4>
	<jsp:include page="footer.jsp" /> <!-- 종료태그 써줘야 함!! 모든 표준 액션태그는 jsp로 시작 -->
	<!-- 각 jsp를 따로따로 구현하고 컴포넌트 처럼 조립할 수 있음 -->
	특징 1 : include하고 있는 페이지에 선언한 변수들을 공유하지 않는다. <br>
	<% int year = 2002; %> <br>
	특징 2 : include시 include되는 jsp로 파라미터를 전달할 수 있다. <br>
	<jsp:include page="footer.jsp">
		<jsp:param name="test" value="hello" />
	</jsp:include>
</body>
</html>