<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%> <!-- 추가 -->
<%@page import="green_vo.Member"%> <!-- 추가 -->
<%@page import="green_vo.Score"%> <!-- 추가 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EL(Expression Language)</title>
<style type="text/css">
	body{
		font-size: small;
	}
	table{
		border: thin solid gray;
		border-collapse: collapse;
	}
	td, th{
		border: thin dotted gray;
		padding: 2px;
	}
	th{
		background-color: lightgray;
	}
	pre{
		font-size: 90%;
	}
</style>
</head>
<body>
	<p><a href="el01.jsp">[이전]</a>
		<a href="el03.jsp">[다음]</a>
	</p>
	<h2> EL - 값 꺼내기 </h2>
	<!-- 데이터 준비 -->
	<%
	pageContext.setAttribute("scores", new int[]{90,80,70,100});
	%>
	<table>
	<%
	List<String> nameList = new LinkedList<String>();
	nameList.add("홍길동");
	nameList.add("임꺽정");
	nameList.add("일지매");
	pageContext.setAttribute("nameList", nameList);
	Map<String, String> map = new HashMap<String, String>();
	map.put("s01", "홍길동");
	map.put("s02", "임꺽정");
	map.put("s03", "일지매");
	pageContext.setAttribute("map", map);
	pageContext.setAttribute("member",
		new Member()
			.setNo(100)
			.setName("홍길동")
			.setEmail("hong@test.com")
	);
	pageContext.setAttribute("student",
			new Score()
				.setNo(100)
				.setName("박성연")
				.setKor(50)
				.setEng(70)
				.setMath(90)
				.setTotal(210)
				.setAvg(70)
				.setGrade("C")
		);
	%>
		<tr>
			<th>대상</th>
			<th>EL 코드</th>
			<th>실행 결과</th>
		</tr>
		<tr>
			<td>배열</td>
			<td>\${myArray[1]}</td>
			<td>배열에서 해당 인덱스의 값을 꺼낸다<br>
			<pre>
				[자바코드]
				pageContext.setAttribute("score", new int[]{90,80,70,100});
				[실행결과]
				\${scores[2] } = ${scores[2] }
			</pre>
			</td>
		</tr>
		<tr>
			<td>리스트</td>
			<td>\${myList[2]}</td>
			<td>List객체에서 인덱스로 지정된 항목의 값을 꺼낸다
				<pre>
					[자바코드]
					List nameList = new LinkedList();
					nameList.add("홍길동");
					nameList.add("임꺽정");
					nameList.add("일지매");
					pageContext.setAttribute("nameList", nameList);
					[실행결과]
					\${nameList[1] } = ${nameList[1] }
				</pre>
			</td>
		</tr>
		<tr>
			<td>맵</td>
			<td>\${myMap.keyName}</td>
			<td>Map 객체에서 키에 해당하는 값을 꺼낸다
			<pre>
				[자바코드]
				Map map = new HashMap();
				map.put("s01", "홍길동");
				map.put("s02", "임꺽정");
				map.put("s03", "일지매");
				pageContext.setAttribute("map", map);
				[실행결과]
				\${map.s02 } = ${map.s02 }
			</pre>
			</td>
		</tr>
		<tr>
			<td>자바빈</td>
			<td>\${myObj.prodName}</td>
			<td>자바객체에서 프로퍼티의 값을 꺼낸다
			<pre>
				pageContext.setAttribute("member",
					new Member()
					.setNo(100)
					.setName("홍길동")
					.setEmail("hong@test.com")
				);
				[실행결과]
				\${member.email} = ${member.email}
			</pre>
			</td>
		</tr>
		<tr>
			<td>자바빈</td>
			<td>\${myObj.prodName}</td>
			<td>자바객체에서 프로퍼티의 값을 꺼낸다
			<pre>
				pageContext.setAttribute("student",
					new Score()
					.setNo(100)
					.setName("박성연")
					.setKor(50)
					.setEng(70)
					.setMath(90)
					.setTotal(210)
					.setAvg(70)
					.setGrade(C)
				);
				[실행결과]
				\${student.avg} = ${student.avg}
			</pre>
			</td>
		</tr>
	</table>
	<form action="studentlist" method="post">
	이름 : <input type="text" name="name" value=${student.name} }><br>
	국어 : <input type="text" name="kor" value=${student.kor}><br>
	영어 : <input type="text" name="eng" value=${student.eng}><br>
	수학 : <input type="text" name="math"  value=${student.math}><br>
	총점 : <input type="text" name="total" value=${student.total}><br>
	평균 : <input type="text" name="avg" value=${student.avg}><br>
	학점 : <input type="text" name="grade" value=${student.grade}><br>
	<input type="submit" value="가입"> <!-- 전송되도록 프로그램 하지 않았으니 누르지 마시오 -->
	<input type="reset" value="취소">
</form>

</body>
</html>