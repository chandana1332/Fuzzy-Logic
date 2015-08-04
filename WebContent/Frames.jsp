<%@page import="com.fuzzylogic.front.FindKeywords"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<style>
	
	body{
		font-family: 'Open Sans';
		background: url(http://subtlepatterns.com/patterns/seamless_paper_texture.png);
		background-size: auto !important;
		background-repeat: repeat !important;
	}
	
	.content{
		width: 1200px;
		margin: 0px auto;
		overflow: hidden;
		height: 1000px;
	}
	
	#result{
		float: left;
		width: 575px;
		margin-right: 25px;
		height: 100%;
	}
	
	#social{
		float: left;
		width: 600px;
		height: 100%;
	}
	
	#news{
		width: 100%;
		margin-bottom: 20px;
		height: 200px;
	}
	
	#twitter{
		width: 50%;
		float: left;
	}
	
	#youtube{
		width: 50%;
		float: left;
	}
	
	#slider{
		width:100%;
	}
</style>
<title>Insert title here</title>
</head>

<% 
String id=request.getParameter("id");
FindKeywords.getKeywords(id);

session.setAttribute("id", id);

%>


<frameset frameborder="NO" framespacing="0"  rows="15%,85%" >
	<frame src="MiniSearchBox.jsp" name="topright" scrolling="no">
	<frameset frameborder="NO" framespacing="0" cols="60%,40%">
		<frame src="Results.jsp" name="topright" >
		<frameset frameborder="NO" framespacing="0" rows="*,35%,30%">
			<frame src="News.jsp" name="botleft" scrolling="no" noresize="noresize">
			<frameset frameborder="NO" framespacing="0" cols="50%,50%">
				<frame src="Tweets.jsp" name="brtl" scrolling="no" noresize="noresize">
				<frame src="Player.jsp" name="brtr" scrolling="no" noresize="noresize">
			</frameset>
			<frame src="Slider.jsp" name="botrbot" scrolling="no" noresize="noresize">
		</frameset>
	</frameset>
</frameset> 

<body>
	<!-- <div class="content">
		<div id="result">

		</div>
		<div id="social">
			<div id="news">

			</div>
			<div style="width: 100%; height: 200px; overfow: hidden;">
				<div id="twitter"></div>
				<div id="youtube"></div>
			</div>
			<div id="slider"></div>
		</div>
	</div> -->

</body>
<script type="text/javascript">
	window.onload = function(){
	    $("#result").load('Results.jsp');
	    $("#news").load('News.jsp');
	    $("#twitter").load('Tweets.jsp');
	    $("#youtube").load('Player.jsp');
	    $("#slider").load('Slider.jsp');
	}
</script>
</html>

