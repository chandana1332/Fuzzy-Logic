<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html>
<head>
    <title>Search</title>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <style>
    body {
        /* background: #555 url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAB9JREFUeNpi/P//PwM6YGLAAuCCmpqacC2MRGsHCDAA+fIHfeQbO8kAAAAASUVORK5CYII=); */
        font: 13px 'Lucida sans', Arial, Helvetica;
        color: #eee;
        text-align: center;
        /* background: url(http://subtlepatterns.com/patterns/footer_lodyas.png); */
        /* background: url(http://subtlepatterns.com/patterns/seamless_paper_texture.png); */
        background: url(http://subtlepatterns.com/patterns/zwartevilt.png);
    }
    
    a {
        color: #ccc;
        
    }
    
    /*-------------------------------------*/
    
    .cf:before, .cf:after{
      content:"";
      display:table;
    }
    
    .cf:after{
      clear:both;
    }

    .cf{
      zoom:1;
    }

    /*-------------------------------------*/	
    
    .form-wrapper {
        width: 550px;
        padding: 15px;
        margin: 180px auto 50px auto;
        background: #444;
        background: rgba(0,0,0,.2);
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        border-radius: 10px;
        -moz-box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
        -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
        box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
    }
    
    .form-wrapper input {
        width: 470px;
        height: 30px;
        padding: 10px 15px;
        float: left;    
        font: bold 18px 'Open sans', 'trebuchet MS', 'Tahoma';
        border: 0;
        background: #eee;
        -moz-border-radius: 3px 0 0 3px;
        -webkit-border-radius: 3px 0 0 3px;
        border-radius: 3px 0 0 3px;      
    }
    
    .form-wrapper input:focus {
        outline: 0;
        background: #fff;
        -moz-box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
        -webkit-box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
        box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
        -webkit-transition: all 0.30s ease-in-out;
	  -moz-transition: all 0.30s ease-in-out;
	  -ms-transition: all 0.30s ease-in-out;
	  -o-transition: all 0.30s ease-in-out;
    }
    
    .form-wrapper input::-webkit-input-placeholder {
       color: #999;
       font-weight: normal;
       font-style: italic;
    }
    
    .form-wrapper input:-moz-placeholder {
        color: #999;
        font-weight: normal;
        font-style: italic;
    }
    
    .form-wrapper input:-ms-input-placeholder {
        color: #999;
        font-weight: normal;
        font-style: italic;
    }    
    
    .form-wrapper button {
		overflow: visible;
        position: relative;
        float: right;
        border: 0;
        padding-top: 8px;
        cursor: pointer;
        height: 50px;
        width: 50px;
        font: bold 15px/40px 'lucida sans', 'trebuchet MS', 'Tahoma';
        color: #fff;
        text-transform: uppercase;
        background: #d83c3c;
        -moz-border-radius: 0 3px 3px 0;
        -webkit-border-radius: 0 3px 3px 0;
        border-radius: 0 3px 3px 0;      
        text-shadow: 0 -1px 0 rgba(0, 0 ,0, .3);
        -webkit-transition: all 0.30s ease-in-out;
  -moz-transition: all 0.30s ease-in-out;
  -ms-transition: all 0.30s ease-in-out;
  -o-transition: all 0.30s ease-in-out;
    }   
      
    .form-wrapper button:hover{		
        background: #F24848;
    }	
      
    .form-wrapper button:active,
    .form-wrapper button:focus{   
        background: #c42f2f;    
    }
    
    .form-wrapper button:before {
        content: '';
        position: absolute;
        border-width: 8px 8px 8px 0;
        border-style: solid solid solid none;
        border-color: transparent #d83c3c transparent;
        top: 17px;
        left: -6px;
        -webkit-transition: all 0.30s ease-in-out;
	  -moz-transition: all 0.30s ease-in-out;
	  -ms-transition: all 0.30s ease-in-out;
	  -o-transition: all 0.30s ease-in-out;
    }
    
    .form-wrapper button:hover:before{
        border-right-color: #F24848;
    }
    
    .form-wrapper button:focus:before{
        border-right-color: #c42f2f;
    }    
    
    .form-wrapper button::-moz-focus-inner {
        border: 0;
        padding: 0;
    }
    </style>
</head>

<body>
<br/>
<br/>
<br/>
<br/>
<br/>
<form action="Home.jsp" class="form-wrapper cf">

	<input type="text" placeholder="Search here..." required name="search">
	<button type="submit"><i class="fa fa-search" style="font-size: 24px"></i></button>
</form>


</body>
</html>