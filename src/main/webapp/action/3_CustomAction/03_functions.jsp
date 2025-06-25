<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Function Library</h1>
	<c:set var="str" value="How Are You?"/>
	<!-- 문자열/컬렉션(배열)과 관련된 기능들을 제공 -->
	str : ${str} <br>
	문자열의 길이 : ${ fn:length(str) } 글자 <br>
	문자열의 길이 : ${ str.length() } 글자 <br>
	모두 대문자로 출력 : ${fn:toUpperCase(str)} <br>
	모두 소문자로 출력 : ${str.toLowerCase()} <br>
	Are의 시작 인덱스 : ${str.indexOf("Are")} <br>
	Are의 시작 인덱스 : ${fn:indexOf(str,"Are")} <br> <!-- 배열에서도 사용가능해서 유용함 -->
	Are을 were로 변환 : ${fn:replace(str,"Are","were")} <br> <!-- 원본 str에 변화는 없음 -->
	str에 "Are"이라는 문자열이 포함되어 있는지 검사 : <br>
	<c:if test="${fn:contains(str,'Are')}">
		포함되어있음.
	</c:if>
</body>
</html>