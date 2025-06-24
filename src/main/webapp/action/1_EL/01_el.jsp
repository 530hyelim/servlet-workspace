<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.model.vo.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. 스크립트릿과 표현식을 이용하여 각 영역에 담긴 값을 추출</h3>
<%-- 	<%
		// request scope
		String classRoom = (String)request.getAttribute("classRoom"); // 얘네 각각은 page cope
		Person student = (Person)request.getAttribute("student");
		// attribute에 데이터를 저장할 때에는 항상 Object 객체로 다형성 적용돼서 저장됨
		// => 다운캐스팅 필요!
	
		// session scope
		String academy = (String)session.getAttribute("academy");
		Person teacher = (Person)session.getAttribute("teacher");
	%>
	<p>
		학원명 : <%= academy %> <br>
		강의장 : <%= classRoom %> <br>
		강사 정보 : <%= teacher.getName() %>, 
				  <%= teacher.getAge() %>, 
				  <%= teacher.getGender() %> <br>
		수강생 정보 : 
		<ul>
			<li>이름 : <%= student.getName() %></li>
			<li>나이 : <%= student.getAge() %></li>
			<li>성별 : <%= student.getGender() %></li>
		</ul>
	</p> --%>
	<hr>
	<h3>2. EL을 이용해서 SCOPE에 저장된 값들 출력하기</h3>
	<p>
		학원명 : ${sessionScope.academy} <br> <!-- 식별자가 없어도 문제되지 않는 이유
		pagescope에서 검사 > requestscope에서 검사 > sessionscope에서 검사 > applicationscope에서 검사 -->
		강의장 : ${classRoom} <br>
		강사 정보 : ${teacher.name}, ${teacher.age}, ${teacher.gender} <br>
		<!-- 자동으로 .getXXX() 함수 호출해줌. 형식을 꼭 지켜야 함 -->
		수강생 정보 : 
		<ul>
			<li>이름 : ${student.name}</li>
			<li>나이 : ${student.age}</li>
			<li>성별 : ${student.gender}</li>
		</ul>
		<!-- 
			EL 표현식으로 teacher에 접근 시, teacher의 자료형은 Person
			Person과 같은 VO 클래스의 각 필드에 담긴 값을 출력하고자 한다면, 객체명.필드명으로 접근하면 된다.
			.필드명으로 작성 시, VO 클래스의 getter 메서드를 찾아서 데이터를 바인딩한다.
		 -->
	</p>
	<hr>
	<h3>3. EL 표현식 사용 시 내장 객체들에 저장된 키 값이 동일한 경우</h3>
	<!--
		EL은 공유범위가 제일 작은 Scope에서부터 키 값을 검색해 나간다
		page -> request -> session -> application
		내가 특별히 스코프를 지정하지 않은 경우, 위 순서대로 각 스코프에서 내가 지정한 키 값을 검색하여
		존재하는 경우 해당 키 값을 화면상에 바인딩 한다.
		같은 context내 다른 서블릿에서 같은 속성값을 사용한다면? 어차피 hashMap 구조로 키=value 형태로
		attribute가 생성되기 때문에 더 나중에 호출되는 데이터로 덮어씌워짐 (동일한 이름의 키 값 존재하지 않음)
	 -->
	 scope 값 : ${scope} <br>
	 <hr>
	 <h3>4. 직접 Scope 영역에 접근하여 데이터 가져오기</h3>
	 <%
	 	pageContext.setAttribute("scope", "page");
	 %>
	 pageScope에 담긴 값 : ${scope} 또는 ${pageScope.scope} <br>
	 requestScope에 담긴 값 : ${requestScope.scope} <br>
	 <!-- 저장된 데이터가 없더라도 에러는 발생하지 않음. 공백이 출력(EL 표현식으로 작성했을 때) -->
	 sessionScope에 담긴 값 : ${sessionScope.scope} <br>
	 applicationScope에 담긴 값 : ${applicationScope.scope}
</body>
</html>