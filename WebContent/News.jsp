<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.solr.common.SolrDocumentList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="com.fuzzylogic.front.*" 
     import="org.json.*"
    import="org.apache.solr.*"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">

<title>News</title>

<base target="_blank">
<style> 
body {
   
    background-size: 560px 240px;
    background-repeat: no-repeat;
    padding-top: 60px;
   
    
}
div{

height: 100px;
    width: 400px;
}
</style>
</head>

<body background="img/timeshomepage.jpg" >

<div  style="text-align: justify; padding-left: 60px;">







<!-- SCROLLER CONTENT STARTS HERE -->

<marquee behavior="scroll" direction="up" scrollamount="2">

<%
String id =request.getParameter("q");
//String strKeywords = FindKeywords.getKeywords(id);
String strKey = FindKeywords.getStrKeywords();
	LinkedHashMap<String, String> highlightSnippets=new NewsSearch().searchNews(strKey);
	for(Map.Entry<String, String> entry : highlightSnippets.entrySet())
	{
		

%>



<b><u><%=entry.getKey()%></u></b><br>


<%=entry.getValue()%>





<br><br>


<%
	}

%>
</marquee>
<!-- SCROLLER CONTENT ENDS HERE -->







</div>

</body>
</html>
