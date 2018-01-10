<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	function fncAddPurchase() {
		$('form[name="detailForm"]').attr('method', 'POST').attr('action', '/kakaoPay/readyPay').submit();
	}
	$(function() {
		$('button.kakaoPay').bind('click', function() {
			fncAddPurchase();
		})
	})
	$(function() {
		$('button.btn.btn-default:contains("���")').bind('click', function() {
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
			
				<input type="hidden" name="cid" value="TC0ONETIME">
				<input type="hidden" name="tax_free_amount" value="0">		
				<!-- partner_order_id:"ȫ�浿", -->
				<div class="page-header">
					<h3 class="text-info">��ǰ ����</h3>
					<h5 class="text-muted">������ ������ ��Ȯ�ϰ� �Է����ּ���</h5>
				</div>
				
				<input type="hidden" name="prodNo" value="${product.prodNo}">
				<input type="hidden" name="total_amount" value="${product.price}">
				<input type="hidden" name="tax_free_amount" value="${product.price*0.1}">
				<input type="hidden" name="quantity" value="1">
				<input type="hidden" name="approval_url" value="http://127.0.0.1:8080/purchase/addPurchase.jsp">
				<input type="hidden" name="cancel_url" value="http://127.0.0.1:8080">
				<input type="hidden" name="fail_url" value="http://127.0.0.1:8080">
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
					<div class="col-xs-8 col-md-4">${product.prodName}</div>
					<input type="hidden" name="item_name" value="${product.prodName}">
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>��ǰ ������</strong></div>
					<div class="col-xs-8 col-md-4">${product.prodDetail}<img src="/images/uploadFiles/${product.fileName}" width="50px" height="50px"></div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
					<div class="col-xs-8 col-md-4">${product.manuDate}</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>����</strong></
					<input type="hidden" name="partner_user_id" value="${user.userId}">
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>������ ���̵�</strong></div>
					<div class="col-xs-8 col-md-4">${user.userId}</div>
					<input type="hidden" name="partner_user_id" value="${user.userId}">
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>���� ���</strong></div>
					<div class="col-xs-8 col-md-4">
						<select name="paymentOption">
							<option value="1" selected="selected">���ݱ���</option>
							<option value="2">�ſ뱸��</option>
						</select>
					</div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>������ �̸�</strong></div>
					<div class="col-xs-8 col-md-4"><input class="form-control" type="text" name="receiverName" value="${purchase.receiverName}"></div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>������ ����ó</strong></div>
					<div class="col-xs-8 col-md-4"><input class="form-control" type="text" name="receiverPhone" value="${purchase.receiverPhone}"></div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>������ �ּ�</strong></div>
					<div class="col-xs-8 col-md-4"><input class="form-control" type="text" name="divyAddr" value="${purchase.divyAddr}"></div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>������ �ּ�</strong></div>
					<div class="col-xs-8 col-md-4"><input class="form-control" type="text" name="divyRequest" value="${purchase.divyRequest}"></div>
				</div>
				
				<hr/>
				
				<div class="row">
					<div class="col-xs-4 col-md-2"><strong>��� ��� ����</strong><img src="../images/ct_icon_date.gif" id="calender" width="15" height="15"></div>
					<div class="col-xs-8 col-md-4"><input class="form-control" type="text" name="divyDate" value="${purchase.divyDate}" readonly></div>
				</div>
				
				<div align="right">
					<button type="button" class="kakaoPay"><img src="/assets/img/docs/ico_pay_320.png"/></button>
					<button type="button" class="btn btn-default">���</button>
				</div>
			</form>
		</div>
	</body>
</html>