<%@ page import="java.util.ArrayList, com.kh.model.vo.Person, java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- prefix : 접두어 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	<h3>1. 변수(속성)</h3>
	<pre>
	* 변수 선언 (&lt;c:set var="변수명" value="리터럴" scope="스코프지정"&gt;)
	 - 변수를 선언하고 초기값을 대입하는 용도로 사용
	 - 선언한 변수를 어떤 scope에 담을지에 따라 다양한 영역에서 사용할 수 있다
	 - 보통 스코프는 지정 안 함 (기본값 : pageScope (권장됨))
	 - 스코프를 여러개 지정하면 다른 페이지에서도 사용 가능하긴 함
	 - c:set을 통해 선언된 변수는 EL로 접근하여 사용할 수 있다
	 - 변수의 자료형을 별도로 지정하지 않는다 (리터럴로 대입되는 값이 곧 자료형이 됨)
	</pre>
	<c:set var="num1" value="10" />
	<c:set var="num2" value="20" />
	num1 변수의 값 : ${num1} <br>
	num2 변수의 값 : ${num2} <br>
	<c:set var="result" value="${num1+num2}" scope="request" />
	result 변수의 값 : ${result} <br>
	<!-- value 속성 말고, 시작태그와 종료태그를 추가하여 그 사이에 값을 기술할 수 있다 -->
	<c:set var="result">
		99999999
		<!-- 주석도 함께 바인딩된다. 일반적으로 변수에 대한 주석은 c:set var 외부에 작성 -->
	</c:set>
	${pageScope.result}
	<hr>
	<pre>
	* 변수 삭제 (&lt;c:remove var="삭제할 변수명" scope="스코프 영역"&gt;)
	 - scope 영역에서 변수를 삭제하는 태그
	 - scope 미지정시 "모든" scope에서 변수가 삭제된다
	</pre>
	삭제 전 result : ${result} <br>
	pageScope의 result 삭제 <br>
	<c:remove var="result" scope="page" />
	삭제 후 result : ${result} <br> 
	모든 스코프에서 result를 삭제 <br>
	<c:remove var="result" />
	삭제 후 result : ${result}
	<hr>
	<pre>
	* 변수 출력 (&lt;c:out value="출력할 값" default="기본값" escapeXml="true/false"&gt;)
	 - 데이터를 화면상에 출력할 때 사용하는 태그
	 - default : value에 출력할 값이 존재하지 않는 경우 대체할 값을 기술(생략가능)
	 - escapeXml : 출력할 값 중 xml 태그요소가 포함된 경우 escape할지를 지정하는 속성(생략가능, 기본값 true)
	</pre>
	result : <c:out value="${result}" /> <br>
	default 설정 후 result : <c:out value="${result}" default="데이터가 없습니다" /> <br>
	<c:set var="htmlStr">
		<b>html문자열</b> <!-- value="<b>html문자열</b>" -->
	</c:set>
	${htmlStr} <br>
	<c:out value="${htmlStr}" escapeXml="true"/> <!-- 주석도 함께 이스케이핑 됨 -->
	<br><br>
	? value랑 content영역 함께 쓰면 어떻게 되지? <br>
	? value에 빈문자열 넣으면 디폴트로 출력되나?
	<h3>2. 조건문 - if (&lt;c:if test="조건식"&gt;)</h3>
	<pre>
		- 자바의 단독 IF문과 동일한 역할을 하는 태그
		- 조건식은 test 속성의 값에 추가하고, ** "반드시 EL 구문" **으로 작성해야 한다
		- core 라이브러리는 단독 if문만 지원
		- if 태그로는 else if 같은 구문 안됨. 그냥 여러개 작성해야 함
	</pre>
	<c:if test="${num1 ge num2}">
		<b>num1이 num2 보다 큽니다..!</b>
	</c:if>
	<c:if test="${num1 le num2}">
		<b>num1이 num2 보다 작거나 같습니다..!</b>
	</c:if>
	<h3>3. 조건문 - choose(&lt;c:choose&gt; , &lt;c:when&gt; , &lt;c:otherwise&gt;)</h3>
	<pre>
		- 자바의 다중 if-else문, 또는 switch문과 비슷한 역할을 하는 태그
		- c:when 태그와 c:otherwise 태그를 c:choose 태그 아래에 기술한다
	</pre>
	<c:choose>
		<c:when test="${num1 eq 20}">
			<b>num1은 20이네요</b>
		</c:when>
		<c:when test="${num1 eq 10}">
			<b>num1은 10이네요</b>
		</c:when>
		<c:otherwise>
			<b>num1은 10도 아니고 20도 아니네요</b>
		</c:otherwise>
	</c:choose>
	<h3>4. 반복문 - forEach</h3>
	<pre>
		for loop문 - (&lt;c:forEach var="변수명" begin="초기값" end="끝 값" step="증가값(기본값 1)"&gt;)
		향상된 for문 - (&lt;c:forEach var="변수명" items="배열/컬렉션" varStatus="현재요소의 상태값(생략가능)"&gt;)
	</pre>
	<c:forEach var="i" begin="1" end="10" step="2"> <!-- int i=1; i<=10; i++ -->
		현재 i의 값 : ${i} <br>
	</c:forEach>
	<%
		ArrayList<Person> list = new ArrayList<>();
		list.add(new Person("홍길동", 20, "남자"));
		list.add(new Person("서혜림", 27, "여자"));
		list.add(new Person("고길동", 40, "남자"));
		pageContext.setAttribute("pList", list);
		
		HashMap<String, Person> map = new HashMap<>();
		map.put("홍길동", new Person("홍길동", 30, "남자"));
		map.put("고길동", new Person("고길동", 40, "여자"));
		pageContext.setAttribute("pMap", map);
	%>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<!-- 데이터를 반복문으로 출력할 영역 -->
			<c:forEach var="person" items="${pList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${person.name}</td>
					<td>${person.age}</td>
					<td>${person.gender}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- hashMap도 반복 가능. 반복 시 각 아이템은 node 단위로 반복 가능 -->
 	<c:forEach var="node" items="${pMap}" varStatus="status">
		${node.key} <br>
		${node.value.age} <br>
	</c:forEach>
	<h3>5. 반복문 - forTokens</h3>
	<pre>
		&lt;c:forTokens var="변수명" items="분리시킬문자열" delims="구분자"&gt;
		 - 구분자를 통해서 분리된 각 문자열에 순차적으로 접근하며 반복을 수행하는 태그
		 - java의 StringTokenizer나 split과 비슷한 역할을 수행한다
	</pre>
	<c:set var="device" value="콤퓨타,팽드퐁,테레비,건조기/냉장고.어쩔세탁기"/>
	<ul>
		<c:forTokens var="d" items="${device}" delims=",/.">
			<li>${d}</li>
		</c:forTokens>
	</ul>
	<hr>
	<h3>6. 쿼리스트링 관련 태그 - url, param</h3>
	<pre>
	&lt;c:url var="변수명" value="url주소"&gt;
		&lt;c:param name="키 값" value="밸류값"/&gt;
	&lt;/c:url&gt;
	</pre>
	<a href="list.do?num=1&num2=2">하드코딩 url주소</a> <br>
	<c:url var="url" value="list.do">
		<c:param name="num" value="1"/>
		<c:param name="num2" value="2"/>
	</c:url>
	<a href="${url}">c:url을 이용한 주소</a>
</body>
</html>