<%@page import="java.util.ListResourceBundle"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="green_vo.Member"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EL(Expression Language)</title>
<style type="text/css">
body {
  font-size: small;
}
table {
  border: 			thin solid gray;
  border-collapse: 	collapse;
}

td, th {
  border:           thin dotted gray;
  padding:          2px;
}

th {
  background-color: lightgray;
}

pre {
  font-size: 90%;
}
</style>
</head>
<body>
<p><a href="el02.jsp">[이전]</a><a href="el04.jsp">[다음]</a></p>
<h2>연산자</h2>
<%
// 데이터 준비
pageContext.setAttribute("title", "EL 연산자!");
%>
<%-- '${' 앞에 '\'가 붙으면 '${'은 EL 문법이 아닌 일반 텍스트로 취급함.  --%>
<table>
<tr><th>분류</th><th>연산자</th><th>EL 코드 = 실행 결과</th></tr>
<tr><td>산술</td><td>+, -, *, /(div), %(mod)</td>
<td><pre>
\${10 + 20} = ${10 + 20}
\${10 - 20} = ${10 - 20}
\${10 * 20} = ${10 * 20}
\${10 / 20} = ${10 / 20}
\${10 div 20} = ${10 div 20} <!-- 빨간줄 뜨는것은 버그. 실행 잘 됩니다. -->
\${10 % 20} = ${10 % 20}
\${10 mod 20} = ${10 mod 20}
</pre></td>
</tr>

<tr><td>논리</td><td>and(&&), or(||), not(!)</td>
<td><pre>
\${true && false} = ${true && false}
\${true and false} = ${true and false}
\${false || true} = ${false || true}
\${false or true} = ${false or true}
\${not true} = ${not true}
\${!true} = ${!true}
</pre></td>
</tr>

<tr><td>관계</td><td>==(eq), !=(ne), &lt;(lt), &gt;(gt),<br>
&lt;=(le), &gt;=(ge)</td>
<td><pre>
\${10 == 11} = ${10 == 11}
\${10 eq 11} = ${10 eq 11}
\${10 != 11} = ${10 != 11}
\${10 ne 11} = ${10 ne 11}
\${10 < 11} = ${10 < 11}
\${10 lt 11} = ${10 lt 11}
\${10 > 11} = ${10 > 11}
\${10 gt 11} = ${10 gt 11}
\${10 <= 11} = ${10 <= 11}
\${10 le 11} = ${10 le 11}
\${10 >= 11} = ${10 >= 11}
\${10 ge 11} = ${10 ge 11}
</pre></td>
</tr>

<tr><td>Empty 검사</td><td>empty</td>
<td><pre>
\${empty title} = ${empty title}
\${empty title2} = ${empty title2}
</pre></td>
</tr>

<tr><td>조건</td><td>조건 ? A : B</td>
<td><pre>
\${10 > 20 ? "크다" : "작다"} = ${10 > 20 ? "크다" : "작다"}
</pre></td>
</tr>
</table>
<p><a href="el02.jsp">[이전]</a><a href="el04.jsp">[다음]</a></p>
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%> <!-- 추가 -->
<%@page import="green_vo.Member"%> <!-- 추가 -->
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
	</table>

</body>
</html> --%>

