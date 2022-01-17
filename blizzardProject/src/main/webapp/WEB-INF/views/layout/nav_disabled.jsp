<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar fixed-top navbar-light bg-light">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-square" viewBox="0 0 16 16">
  					<path d="M3.626 6.832A.5.5 0 0 1 4 6h8a.5.5 0 0 1 .374.832l-4 4.5a.5.5 0 0 1-.748 0l-4-4.5z"></path>
  					<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2z"></path>
				</svg>
			</button>
			<a class="navbar-brand" href="/">HOME</a>
			<!-- <a class="navbar-brand" href="/search">검색</a>
			<a class="navbar-brand" href="/statistics">통계</a> -->
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active">
					<a href="#" onclick="f_searchTokenPrice();">
						와우토큰
					</a>
					<br>
					<strong id="token" class="gold"></strong>
					<span id="token_unit" class="gold">골드</span>
				</li>
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left" role="search" action="/search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>

<script>

$(function() {
	$("#token_unit").hide();
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
        	   var price = res.tokenMap.price;
        	   alert("토큰 가격 : " + price/10000 + "골드");
        	   
        	   $("#token").html(price/10000);
        	   $("#token_unit").show();
           }
       },
       error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
           alert("통신 실패.")
       }
    });
}
	 
</script>