<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
    <%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.solr.common.SolrDocumentList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="com.fuzzylogic.front.*" 
     import="org.json.*"
    import="org.apache.solr.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- <link rel="stylesheet" type="text/css" href="styles.css" /> -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<style>
	body{
		font-family: 'Open Sans';
		/* background: url(http://subtlepatterns.com/patterns/seamless_paper_texture.png); */
		background: url(http://subtlepatterns.com/patterns/zwartevilt.png);
	}
	
	#page{
		width: 800px;
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

<script>


</script>



</head>
<body>

<div id="page">

<h2>Search results for "<%=request.getParameter("search") %>"</h2>
<p style="color:white" align="justify">


<%
String query=request.getParameter("search");
//session.setAttribute("q",query);
List<String> strAlternatives = new Search().getCorrectSpellings(query);
if(strAlternatives != null && !strAlternatives.isEmpty()){
	String strFirst = strAlternatives.get(0);
	
%>
<i>Did You Mean : </i><a href="Home.jsp?search=<%=strFirst%>"><%=strFirst %></a>
<%	
}
	ArrayList<DataInfo> dataList = new Search().searchString(query);
	for(DataInfo data : dataList)
	{
		String strId = ""+data.getId();
%>
<h3><a href="Frames.jsp?id=<%=data.getId()%>"><%=data.getStrTitle()%></a></h3>
<p><%=data.getStrContent()%></p>
<%
	}

%>


</div>

</body>
</html>