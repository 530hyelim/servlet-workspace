<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL 연산</h1>
	<h3>1. 산술 연산</h3>
	<p>
		* 스크립트릿 사용시
		10 + 3 = <%= (int)request.getAttribute("big") + (int)request.getAttribute("small") %>
	</p>
	<p>
		* EL을 사용한 연산 <br>
		${big} + ${small} = ${big + small} <br>
		${big} - ${small} = ${big - small} <br>
		${big} x ${small} = ${big * small} <br>
		${big} / ${small} = ${big / small} 또는 ${big div small} <br>
		${big} % ${small} = ${big % small} 또는 ${big mod small}
	</p>
	<p>
		10 > 3 : ${big > small} 또는 ${big gt small} <br>
		10 &lt; 3 : ${big < small} 또는 ${big lt small} <br>
		<!-- 태그의 시작기호이기 때문에 단순 출력 시 에러를 발생시킬 수도 있음 -->
		10 >= 3 : ${big >= small} 또는 ${big ge small} <br>
		10 &lt;= 3 : ${big <= small} 또는 ${big le small}
	</p>
	<h3>2. 동등비교 연산</h3>
	<p>
		* 스크립트릿 방식 <br>
		sOne과 sTwo가 일치합니까? <%= request.getAttribute("sOne").equals(request.getAttribute("sTwo")) %>
		<br>
		sOne과 sTwo가 일치합니까? <%= request.getAttribute("sOne")==request.getAttribute("sTwo") %>
	</p>
	<p>
		* EL 방식 <br>
		10과 3이 일치합니까? ${big == small} 또는 ${big eq small} <br>
		big과 10이 일치합니까? ${big == 10} 또는 ${big eq 10} <br>
		<!-- EL에서 동등비교(==) 연산자는 자바의 equals() 방식으로 동작한다. -->
		sOne과 sTwo가 일치합니까? ${sOne eq sTwo}, ${sOne == sTwo} <br>
		sOne과 sTwo가 일치하지 않습니까? ${sOne ne sTwo}, ${sOne != sTwo} <br>
		<!-- 자바 언어가 아니라서 홀따옴표로 작성 가능 -->
		sOne에 저장된 값이 "안녕"과 일치합니까? ${sOne == "안녕"} 또는 ${sOne eq '안녕'}
	</p>
	<hr>
	<h3>3. 객체가 null인지, 또는 List가 비어있는지 체크할 수 있는 연산자</h3>
	<p>
		pTwo가 null입니까? ${pTwo == null}, ${pTwo eq null} 또는 ${empty pTwo} <br>
		pOne가 null입니까? ${pOne == null}, ${pOne eq null} 또는 ${empty pOne} <br>
		pOne이 null이 아닙니까? ${pOne != null}, ${pOne ne null} 또는 ${!empty pOne}, ${not empty pOne} <br>
		<!-- empty 예약어로 list가 비어있는지 확인 가능 -->
		lOne이 비어있습니까? ${lOne == null}, ${empty lOne} <br>
		lTwo이 비어있습니까? ${empty lTwo} <br>
	</p>
	<h3>4. 논리 연산자</h3>
	<p>
		AND 연산 : ${true && true} 또는 ${true and true} <br>
		OR 연산 : ${false || true} 또는 ${false or true}
	</p>
	<script>
		const name = "혜림";
		console.log("제 이름은 " + name + "입니다");
		console.log(`제 이름은 \${name}입니다`);
		/* EL 표현식이랑 템플릿 문법을 동시에 사용하면 EL 표현식으로 판단함.
		IsElIgnored="true"로 설정하면 EL 표현식으로 작성했던 애들이 단순 문자열로써 해석되고
		템플릿 문법을 사용할 수 있게 된다. 하지만 보통은 EL 표현식이 간결해서 false로 설정함.
		만약 같이 쓰고싶다면? 이스케이핑 기호 추가하자. */
	</script>
</body>
</html>