<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		$('button.btn.btn-default:contains("Ȯ��")').bind('click', function() {
			alert()
		})
		$('button.btn.btn-info:contains("�߰����")').bind('click', function() {
			alert()
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
	    		<h3 class=" text-info">��� Ȯ��</h3>
	    		<h5 class="text-muted">������ ���� ��ǰ�� ����� �Ϸ�Ǿ����ϴ�.</h5>
	    	</div>
	    	
	    	<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
				<div class="col-xs-8 col-md-4">${product.prodName}</div>
			</div>
			
			<hr/>
			
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>��ǰ������</strong></div>
				<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
			</div>
			
			<hr/>
			
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
				<div class="col-xs-8 col-md-4">${product.manuDate}</div>
			</div>
			
			<hr/>
			
			<div class="row">
	  			<div class="col-xs-4 col-md-2"><strong>����</strong></div>
				<div class="col-xs-8 col-md-4">${product.price}</div>
			</div>
			
			<hr/>
			
			<div class="row">
	  			<div class="col-xs-4 col-md-2 "><strong>��ǰ�̹���</strong></div>
				<div class="col-xs-8 col-md-4">
					<c:if test="${!empty product.fileName}">	
						<img src="/images/uploadFiles/${product.fileName}" width="200px" height="170px">
					</c:if>
					<c:if test="${empty product.fileName}">
						<img src="/images/uploadFiles/no_image.jpg" width="200px" height="170px">
					</c:if>
				</div>
			</div>
			
			<div align="right">
				<button class="btn btn-default">Ȯ��</button>
				<button class="btn btn-info">�߰����</button>
			</div>
		</form>
	</div>
</body>
</html>