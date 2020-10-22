<%@ page import = "green_vo.Member" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" scope='request' class='green_vo.Member' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 삭제</title>
</head>
<body>
<% System.out.println("딜리트폼 입장."); %>
<jsp:include page="/Header.jsp" />
<h1>회원 삭제</h1>
<form action="delete" method="post">
	번호 : <input type="text" name="no" value="<%=member.getNo()%>" readonly><br>
	이름 : <input type="text" name="name" value="<%=member.getName()%>"><br>
	이메일 : <input type="text" name="email" value="<%=member.getEmail()%>"><br>
	가입일 : <%=member.getCreatedDate()%><br>
	<input type="submit" value="삭제">
	<input type="button" value="취소 " onclick="location.href='list'">
</form>
<jsp:include page="/Tail.jsp" />

</body>
</html>