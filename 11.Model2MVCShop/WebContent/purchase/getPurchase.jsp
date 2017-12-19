<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="../javascript/calendar.js" type="text/javascript"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	$(function() {
		$('td.ct_btn01:contains("수정")').bind('click', function() {
			self.location="/purchase/updatePurchaseView?tranNo=${purchase.tranNo}";
		})
	})
	$(function() {
		$('td.ct_btn01:contains("확인")').bind('click', function() {
			self.location="/purchase/listPurchase";
		})
	})
	</script>
	</head>
		
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolbar.jsp" />
   		<!-- ToolBar End /////////////////////////////////////-->
   		<div class="container">
			<form name="detailForm">
				<div class="page-header">
					<h3 class="text-info">구매 상세 조회</h3>
				</div>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodName}</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>구매자 아이디</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>구매방법</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.paymentOption.trim()=='1' ? "현금구매" : "신용구매" }</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>받으시는 분</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>연락처</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>배송주소</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
				</div>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>배송요청사항</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>배송희망일</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>주문일</strong></div>
					<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
				</div>
				
				<div align="right">
					<button type="button" class="btn btn-info">확인</button>
				</div>
			</form>
		</div>
	</body>
	</html>