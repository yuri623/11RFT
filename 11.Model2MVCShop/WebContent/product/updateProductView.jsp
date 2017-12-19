<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<script src="../javascript/calendar.js"></script>
	
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
function fncAddProduct(){
	//Form ��ȿ�� ����
	var name = $('input[name="prodName"]').val()
	var detail = $('input[name="prodDetail"]').val()
	var manuDate = $('input[name="manuDate"]').val()
	var price = $('input[name="price"]').val()
	
	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}	
	$('form').attr("method", "POST").attr("action", "/product/updateProduct").submit();
}
$(function() {
	$('button.btn.btn-info:contains("����")').bind('click', function() {
		fncAddProduct();
	})
})
$(function() {
	$('button.btn.btn-default:contains("���")').bind('click', function() {
		history.go(-1);
	})
})	
$(function() {
	$("#calender").bind('click', function() {
		show_calendar('document.detailform.manuDate', $('#manuDate').val())
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
			<input type="hidden" value="${product.prodNo}" name="prodNo">
			<input type="hidden" value="${product.regDate}" name="regDate">
			<div class="page-header">
	    		<h3 class=" text-info">��ǰ ���� ����</h3>
	    	</div>
	    	
	    	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" class="form-control" value="${product.prodName}" name="prodName"></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" class="form-control" value="${product.prodDetail}" name="prodDetail"></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4">
    			<input type="file" id="exampleInputFile" value="${product.fileName}" name="fileName">
			</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong><img width="15" height="15" id="calender" src="../images/ct_icon_date.gif"></div>
			<div class="col-xs-8 col-md-4"><input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="��������" value="${product.manuDate}" readonly></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" class="form-control" value="${product.price}" name="price"></div>
		</div>
		
		<hr/>
		
		<div align="right">
			<button type="button" class="btn btn-info">����</button>
			<button type="button" class="btn btn-default">���</button>
		</div>
		
		</form>
	</div>
	</body>
</html>