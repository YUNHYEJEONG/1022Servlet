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
<p><a href="JSTL06.jsp">[이전]</a><a href="JSTL09.jsp">[다음]</a></p>
<h2>c:url 태그</h2>
<c:url var="calcUrl" value="http://localhost:8080/1022ServletPark/CalcforJSTL">
	<c:param name="v1" value="30"/>
	<c:param name="v2" value="20"/>
	<c:param name="op" value="-"/>
</c:url>
<a href="${calcUrl }">계산하기</a>


<p><a href="JSTL06.jsp">[이전]</a><a href="JSTL09.jsp">[다음]</a></p>

</body>
</html>