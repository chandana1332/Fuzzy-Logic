<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.fuzzylogic.front.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="img/bg1m.jpg">
<%

String strKey = FindKeywords.getStrKeywords();
String id1=new YoutubeSearch().Search(strKey);
String url="http://www.youtube.com/embed/"+id1;

%>
<iframe width="260" height="180"
src=<%=url%>>
</iframe>
</body>
</html>