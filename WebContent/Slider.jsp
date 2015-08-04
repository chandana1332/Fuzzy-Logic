<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="com.fuzzylogic.front.*"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Ultra lightweight responsive carousel for jQuery</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<meta name="keywords" content="anoslide, responsive carousel, responsive slider" />
		<meta name="description" content="Lightweight responsive carousel built on top of jQuery." />
		
		
	</head>
	<body background="img/bg1m.jpg">
	
				<%
				String id1 =FindKeywords.getStrKeywords();
ArrayList<String> id=new FlickrSearch().Search(id1);


%>
		
		
		<marquee behavior="scroll" direction="right">
<% for(String s : id)
{
	if(!s.contains("null")){
%>
<img src=<%=s %> width="200" height="200" alt="Swimming fish" />
<%}} %>
</marquee>

		
	</body>
</html>
