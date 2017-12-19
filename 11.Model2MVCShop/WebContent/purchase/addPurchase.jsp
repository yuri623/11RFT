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
	$(function() {
		$('button.btn.btn-info:contains("Ȯ��")').bind('click', function() {
			self.location="/product/listProduct?menu=search";
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
	    		<h5 class="text-muted">������ ���� ��ǰ�� ���Ű� �Ϸ�Ǿ����ϴ�.</h5>
	    	</div>
	    	
	    	<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
				<div class="col-xs-8 col-md-4">${product.prodNo}</div>
			</div>
			
			<hr/>
			
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>�����ھ��̵�</strong></div>
				<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
			</div>
			<hr/>
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>���Ź��</strong></div>
				<div class="col-xs-8 col-md-4">${purchase.paymentOption.trim()=='1' ? "���ݱ���" : "�ſ뱸��" }</div>
			</div>
			<hr/>
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>�������̸�</strong></div>
				<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
			</div>
			<hr/>
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>�����ڿ���ó</strong></div>
				<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
			</div>
			<hr/>
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>�������ּ�</strong></div>
				<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
			</div>
			<hr/>
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>���ſ�û����</strong></div>
				<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
			</div>
			<hr/>
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>����������</strong></div>
				<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
			</div>
			
			<div align="right">
				<button class="btn btn-info">Ȯ��</button>
			</div>
			
   		</form>
   	</div>
</body>
</html>