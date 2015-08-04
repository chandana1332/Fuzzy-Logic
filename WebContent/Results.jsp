<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
     <%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.solr.common.SolrDocumentList"%>
<%@page  import="com.fuzzylogic.front.*" 
import="org.json.*"
import="org.apache.solr.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	body{
		font-family: 'Open Sans';
		/* background: url(http://subtlepatterns.com/patterns/seamless_paper_texture.png); */
		background: url(http://subtlepatterns.com/patterns/zwartevilt.png);
	}
	
	#page{
		width: 80%;
		margin: 20px auto;
	}
	
	h3{
		margin-bottom: 0px;
	}
	
	h2{
		color: #fff;
	}
	
	p{
		margin-top: 0px;
	}
	
	a{
		color: #d83c3c;
		-webkit-transition: all 0.30s ease-in-out;
	  -moz-transition: all 0.30s ease-in-out;
	  -ms-transition: all 0.30s ease-in-out;
	  -o-transition: all 0.30s ease-in-out;
	}
	
	a:hover, a:focus{
		color: #F24848;
	}
	
	p{
		color: #fff;
	}
</style>
</head>
<body>



<div id="page">

     	


<% 
	
	String id =(String)session.getAttribute("id");
	ArrayList<DataInfo> dataList = Search.getDataList();
	for(DataInfo data : dataList){
		if(Integer.parseInt(id) == data.getId()){
			String strTitle = data.getStrTitle();
			String strContent = data.getStrContent();
%>
<h2><%=data.getStrTitle()%></h2>
<br/>
<br/>
<p style="color:white" align="justify"><%=data.getStrContent() %></p>
<%
		}
	}
%>

</div>

</body>
</html>