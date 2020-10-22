<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p><a href="JSTL01.jsp">[이전]</a><a href="JSTL03.jsp">[다음]</a></p>
<h2>c:set 태그</h2>
<h3>값 설정 방식</h3>
<c:set var="username1" value="홍길동" />
<c:set var="username2">임꺽정</c:set>
1) ${username1 } <br>
2) ${username2 } <br>
<h3>기본 보관소</h3>
3) ${pageScope.username1 } <br>
4) ${requestScope.username1 } <br>
<h3>보관소 지정 - scope 속성</h3>
<c:set var="username3" scope="request">일지매</c:set>
5) ${pageScope.username3 } <br>
6) ${requestScope.username3 } <br>
<h3>기존값 덮어 씀</h3>
<% pageContext.setAttribute("username4", "똘이장군"); %>
7) 기존값 = ${username4 } <br>
<c:set var="username4" value="주먹대장" />
8) 덮어쓴 값 = ${username4 } <br>
<h3>객체의 프로퍼티 값 변경</h3>
<%!
	public static class MyMember{
	private int no;
	private String name;
	public int getNo(){return this.no;}
	public void setNo(int a){this.no=a;}
	public String getName(){return this.name;}
	public void setName(String a){this.name=a;}
}
%>
<%
	MyMember member = new MyMember();
	member.setNo(100);
	member.setName("홍길동");
	pageContext.setAttribute("member", member);
%>
9) ${member.name } <br> <!-- 맴버변수를 직접 가져오는것이 아닌 getter호출 -->
<c:set target="${member }" property="name" value="임꺽정" />
10) ${member.name } <br>




<p><a href="JSTL01.jsp">[이전]</a><a href="JSTL03.jsp">[다음]</a></p>
</body>
</html>