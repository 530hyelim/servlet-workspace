<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8">
<title>Insert title here</title> 얘네 빼고 다른애들은 다 자동으로 생략됨 -->
</head>
<body>
<!-- WEB-INF 안에 넣는 이유 : private 보안처리 (url로 정적요청으로 바로 접근할 수 없음) -->
<!-- 디렉토리 구조가 함부로 노출되면 보안상 위험하기 때문에 사용 -->
	<table>
		<tr>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
		</tr>
		<c:forEach var="person" items="${list}">
			<tr>
				<td>${person.name}</td>
				<td>${person.age}</td>
				<td>${person.gender}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>