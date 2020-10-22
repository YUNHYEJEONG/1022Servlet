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
<p><a href="JSTL04.jsp">[이전]</a><a href="JSTL06.jsp">[다음]</a></p>
<h2>c:choose 태그</h2>
<c:set var="userid" value="admin" />
	<c:choose>
		<c:when test="${userid == 'hong' }">
			홍길동님 반갑습니다
		</c:when>
		<c:when test="${userid == 'leem' }">
			임걱정님 반갑습니다
		</c:when>
		<c:when test="${userid == 'admin' }"> <!-- when의 결과가 참인 경우만 실행 -->
			관리자 전용 페이지입니다.
		</c:when>
		<c:otherwise>
			등록되지 않은 사용자 입니다. 
		</c:otherwise>
	</c:choose>
<p><a href="JSTL04.jsp">[이전]</a><a href="JSTL06.jsp">[다음]</a></p>
</body>
</html>

