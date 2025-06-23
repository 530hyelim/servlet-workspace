<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Arrays" %>
<%	// page 지시어 하나 더 만들 수 있음 (import용)
	// 자바 코드 작성 영역 (Scriptlet)
	System.out.println("1234");

	// 사용자 입력값 가져오기
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String animal = request.getParameter("animal");
	String foods[] = request.getParameterValues("food");
	String recommend = (String)request.getAttribute("recommend");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개취 검사 결과</title>
</head>
<body>
	<h1>개인 취향 검사 결과 JSP</h1>
	<p><%= name %>님의 개인 취향 검사 결과는</p>
	<p><%= color %>색을 좋아합니다.</p>
	<p>좋아하는 동물은 <%= animal %> 입니다.</p>
	<% if(foods == null){ %>
		<p>좋아하는 음식은 없습니다.</p>
	<% } else { %>
		<p>좋아하는 음식은 <%= Arrays.toString(foods) %> 입니다.</p>
	<% } %>
	<p>오늘의 추천 메뉴는.. <%= recommend %> 어떠세요?</p> <!-- DB 상에서 가져온 데이터라고 가정 -->
</body>
</html>