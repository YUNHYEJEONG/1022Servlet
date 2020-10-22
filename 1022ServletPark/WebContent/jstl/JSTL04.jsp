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
<p><a href="JSTL03.jsp">[이전]</a><a href="JSTL05.jsp">[다음]</a></p>
<h2>c:if 태그</h2>

<c:if test="${10>20 }" var="result1">
1) 10은 20보다 크다 <br> <!-- false이기때문에 출력되지 않음 -->
</c:if>
2) ${result1 } <br>
<c:if test="${10<20 }" var="result2">
3) 10은 20보다 작다 <br>
</c:if>
4) ${result2 } <br>

<p><a href="JSTL03.jsp">[이전]</a><a href="JSTL05.jsp">[다음]</a></p>
</body>
</html>