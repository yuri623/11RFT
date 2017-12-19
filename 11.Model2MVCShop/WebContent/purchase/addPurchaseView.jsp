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
	<script type="text/javascript">v
	function fncAddPurchase() {
		$('form').attr('method', 'POST').attr('action', '/purchase/addPurchase').submit();
	}
	$(function() {
		$('button.btn.btn-info:contains("구매")').bind('click', function() {
			fncAddPurchase();
		})
	})
	$(function() {
		$('button.btn.btn-default:contains("취소")').bind('click', function() {
			history.go(-1);
		})
	})
	$(function() {
		$("#calender").bind('click', function() {
			show_calendar('document.detailform.manuDate', $('input:text[name=divyDate]').val())
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
					<h3 class="text-info">상품 구매</h3>
					<h5 class="text-muted">구매자 정보를 정확하게 입력해주세요</h5>
				</div>
				
				<input type="hidden" name="prodNo" value="${product.prodNo}">
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
					<div class="col-xs-8 col-md-4">${product.prodName}</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>상품 상세정보</strong></div>
					<div class="col-xs-8 col-md-4">${product.prodDetail}<img src="/images/uploadFiles/${product.fileName}" width="50px" height="50px"></div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
					<div class="col-xs-8 col-md-4">${product.manuDate}</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>가격</strong></div>
					<div class="col-xs-8 col-md-4">${product.price}</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>구매자 아이디</strong></div>
					<div class="col-xs-8 col-md-4">${user.userId}</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>구매 방법</strong></div>
					<div class="col-xs-8 col-md-4">
						<select name="paymentOption">
							<option value="1" selected="selected">현금구매</option>
							<option value="2">신용구매</option>
						</select>
					</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>구매자 이름</strong></div>
					<div class="col-xs-8 col-md-4"><input class="form-control" type="text" name="receiverName" value="${purchase.receiverName}"></div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>구매자 연락처</strong></div>
					<div class="col-xs-8 col-md-4"><input class="form-control" type="text" name="receiverPhone" value="${purchase.receiverPhone}"></div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>구매자 주소</strong></div>
					<div class="col-xs-8 col-md-4"><input class="form-control" type="text" name="divyAddr" value="${purchase.divyAddr}"></div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>구매자 주소</strong></div>
					<div class="col-xs-8 col-md-4"><input class="form-control" type="text" name="divyRequest" value="${purchase.divyRequest}"></div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>배송 희망 일자</strong><img src="../images/ct_icon_date.gif" id="calender" width="15" height="15"></div>
					<div class="col-xs-8 col-md-4"><input class="form-control" type="text" name="divyDate" value="${purchase.divyDate}" readonly></div>
				</div>
				
				<div align="right">
					<button class="btn btn-info">구매</button>
					<button class="btn btn-default">취소</button>
				</div>
			</form>
		</div>
	</body>
</html>