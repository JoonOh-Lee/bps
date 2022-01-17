<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="h-100">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>타이틀 미정</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/cover/">

    

    <!-- Bootstrap core CSS -->
	<link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      	.bd-placeholder-img {
        	font-size: 1.125rem;
	        text-anchor: middle;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        user-select: none;
      	}

      	@media (min-width: 768px) {
        	.bd-placeholder-img-lg {
          		font-size: 3.5rem;
        	}
      	}
      
      	.gold {
      		color: gold;
      		font-style: bold;
     	}
      	@import url('https://fonts.googleapis.com/css?family=Inconsolata');
	
	  	body {
			font-family: 'Inconsolata';
			font-weight: bold;
			text-shadow: 1px 1px 5px rgba(0,0,0,0.5);
			fill: gold;
			display: flex;
			justify-content: center;
			align-items: center;
    	}
    </style>

    
    <!-- Custom styles for this template -->
    <link href="css/cover.css" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.rawgit.com/coderitual/odoo/feature/codevember16/lib/odoo.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	f_searchTokenPrice();
});

//API Connection Testing
function f_searchTokenPrice() {
	var params = "";
	
	$.ajax({
       type : "POST",            	// HTTP method type(GET, POST) 형식이다.
       url : "/searchTokenPrice", 	// 컨트롤러에서 대기중인 URL 주소이다.
       data : params,            	// Json 형식의 데이터이다.
       success : function(res){ 	// 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
           
           if (res.result == "SUCC") {
        	   console.log(res.tokenMap);
        	   var price = res.tokenMap.price/10000;
        	   $("#tPrice").html(price);
        	   var len = price.length;
        	   var def = "";
        	   for (var i = 0; i < len; i++) {
        		   def += "0";
        	   }
        	   odoo.default({ el:'#tPrice', from: def, to: price, animationDelay: 500 });
           }
       },
       error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
           alert("통신 실패.")
       }
    });
}
</script>
<body class="d-flex h-100 text-center text-white bg-dark">
    
	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
	  	<header class="mb-auto">
	    	<div>
	      		<h3 class="float-md-start mb-0">경매장</h3>
	      		<nav class="nav nav-masthead justify-content-center float-md-end">
			        <a class="nav-link active" aria-current="page" href="/">Home</a>
			        <a class="nav-link" href="#">Features</a>
			        <a class="nav-link" href="#">Contact</a>
	      		</nav>
	    	</div>
	  	</header>
	
	  	<main class="px-3">
	    	<h1>Cover your page.</h1>
	    	<p class="lead">Cover is a one-page template for building simple and beautiful home pages. Download, edit the text, and add your own fullscreen background photo to make it your own.</p>
	    	<p class="lead">
	      		<a href="#" class="btn btn-lg btn-secondary fw-bold border-white bg-white">Learn more</a>
	    	</p>
	    	
	    	<br><br>
	    	
			<h1>API Connection Test</h1>
			<h2 class="gold">토큰 : <strong id="tPrice" class="gold">0</strong><span class="gold">골드</span>
			</h2>
	    	<br><br>
	    	
			<h1>DB Connection Test</h1>
			<table border="1">
				<tr>
					<th>ID</th>
					<th>PW</th>
					<th>Name</th>
				</tr>
				<c:forEach items="${test}" var="test">
					<tr>
						<td>${test.id }</td>
						<td>${test.password }</td>
						<td>${test.name }</td>
					</tr>
				</c:forEach>
			</table>
			
			
	  	</main>

  		<footer class="mt-auto text-white-50">
    		<p>Cover template for <a href="https://getbootstrap.com/" class="text-white">Bootstrap</a>, by <a href="https://twitter.com/mdo" class="text-white">@mdo</a>.</p>
  		</footer>
	</div>

    
	</body>
</html>