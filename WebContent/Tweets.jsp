<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.fuzzylogic.front.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style> 
body {
   
    background-size: 280px 200px;
    background-repeat: no-repeat;
    padding-top: 30px;
   
    
}
div{
padding-left:30px;
height: 100px;
    width: 200px;
    text-align: justify;
}
</style>
</head>
<body background="img/4879b1a68f7e444a_twitter-template.jpg" >
<%
String id1 =FindKeywords.getStrKeywords();
ArrayList<String> id=new TwitterSearch().searchTweets(id1);
%>
<div>
<marquee behavior="scroll" direction="up" scrollamount="2">
<% 
if(!id.isEmpty()){
for(String s : id)
{ 

String name[]=s.split("-");

%>
<font color="lightblue"><b><%=name[0]%></b> </font>
<font color="black"><%=name[1] %> </font>
<br/><br/>
	
<%} 
}%>
</marquee>
</div>
</body>
</html>