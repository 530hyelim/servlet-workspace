<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>include 지시어</h1>
	<p>
		include 지시어를 통해 다른 페이지의 html을 현재 jsp에 추가할 수 있다.
	</p>
	<%@ include file="header.jsp" %>
	<h3>Content</h3>
	<p><%= name %>님 안녕하세요</p>
	<a href="another.jsp">다른 JSP</a>
	<!-- 정적 추가 방식. 재사용 가능 -->
	<!-- 용량이 커지기 때문에 주의해서 사용해야 함 -->
	<script>
		$(function() {
			$("h1").css("color","pink");
		});
	</script>
	<%@ include file="footer.jsp" %>
</body>
</html>