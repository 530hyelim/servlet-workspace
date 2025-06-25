<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 유효성 검사 파일 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1. formatNumber</h1>
	<p>
		숫자데이터의 포맷 지정 <br>
		 - 표현하고자 하는 숫자 데이터의 형식을 원하는 쓰임에 맞게 지정하는 태그 <br><br>
		&lt;fmt:formatNumber 
		value="출력할 값" 
		groupingUsed="true/false" 
		type="percent/currency" 
		currencySymbol="심볼"/&gt;
	</p>
	<c:set var="num1" value="123456789"/>
	<c:set var="num2" value="0.75"/>
	<c:set var="num3" value="50000"/>
	<!-- 기본자료형만이 아니라 EL표현식으로 객체형태의 데이터도 추가할 수 있음 -->
	<!-- 스크립틀릿으로 선언하거나 forwarding 해서 가져와야 함 -->
	단순 출력 : ${num1} <br>
	세자리 단위로 구분하여 출력 : <fmt:formatNumber value="${num1}"/> <br>
	숫자 그대로 출력 : <fmt:formatNumber value="${num1}" groupingUsed="false"/> <br>
	<br>
	percent : <fmt:formatNumber value="${num2}" type="percent"/> <br>
	currency : <fmt:formatNumber value="${num3}" type="currency" groupingUsed="false"/> <br>
	curryncySymbol : <fmt:formatNumber value="${num3}" type="currency" currencySymbol="₩"/>
	<h3>2. formatDate</h3>
	<p>
		Java.util.Date객체의 출력형식을 지정하는 태그 (value 값에 무조건 Date 타입의 객체가 들어가야 함)
	</p>
	<c:set var="current" value="<%= new java.util.Date() %>"/>
	current : ${current}
	<ul>
		<li>
			현재 날짜 : <fmt:formatDate value="${current}" type="date"/>
		</li>
		<li>
			현재 시간 : <fmt:formatDate value="${current}" type="time"/>
		</li>
		<li>
			현재 날짜 및 시간 : <fmt:formatDate value="${current}" type="both"/>
		</li>
		<li>
			커스터마이징 : <fmt:formatDate value="${current}" pattern="yyyy-MM월dd HH:mm:ss"
			timeZone="UTC"/>
		</li>
	</ul>
	<h4>3. JSTL Function lib</h4>
	<p>EL구문 안에서 사용할 수 있는 각종 메서드를 제공</p>
	<a href="03_functions.jsp">function lib</a>
</body>
</html>