<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<%--
	List<Purchase> list= (List<Purchase>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
--%>  

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script type="text/javascript" src="../javascript/jquery-2.1.4.js"></script>
<script type="text/javascript">
	function fncGetList(currentPage) {
		if(currentPage == null || currentPage == ""){
			currentPage = 1;
		}
		$("#currentPage").val(currentPage);
		$('form').attr('mehtod', 'POST').attr('action', "/purchase/listPurchase").submit();
	}
	$(function() {
		$('td[name="index"]').bind('click', function() {
			var i = ($(this).text().trim())-1;
			$('form').attr('method', 'POST').attr('action', '/purchase/getPurchase?tranNo='+$($("input[name=tranNo]")[i]).val()).submit();
		})

		$('td[name="userId"]').bind('click', function() {
			self.location="/user/getUser?userId=${purchase.buyer.userId}"
		})

	})
	$(function() {
		$("td.tranStatus:contains('���ǵ���')").bind('click', function() {
			var i = ($("td:nth-child(11)").index(this))-1
			self.location="/purchase/updateTranCode?tranCode=3&tranNo="+$($("input[name=tranNo]")[i]).val();
		})
	})
		
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü  ${resultPage.totalCount } �Ǽ�, ����  ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<%--
		for(int i=0; i<list.size(); i++) {
			Purchase purchase = list.get(i);
	--%>
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />	
		<input type="hidden" name="tranNo"	value="${purchase.tranNo}">
		<tr class="ct_list_pop">
			<td align="center" name="index">
				${ i }
			</td>
			<td></td>
			<td align="left" name="userId">
				${purchase.buyer.userId}
			</td>
			<td></td>
			<td align="left">${purchase.receiverName}</td>
			<td></td>
			<td align="left">${purchase.receiverPhone}</td>
			<td></td>
			<td align="left">
				<c:if test="${purchase.tranCode.trim()== '1'}">���� ���ſϷ� ���� �Դϴ�.</c:if>
				<c:if test="${purchase.tranCode.trim()== '2'}">���� ����� ���� �Դϴ�.</c:if>
				<c:if test="${purchase.tranCode.trim()== '3'}">���� ��ۿϷ� ���� �Դϴ�.</c:if>
			</td>
			<td></td>
			<td align="left"  class="tranStatus">
			<c:if test="${purchase.tranCode.trim()==2}">
			���ǵ���
			</c:if>
			<c:if test="${purchase.tranCode.trim()!=2}"></c:if>
			</td>
		</tr>
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
	<%-- } --%>	
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<jsp:include page="../common/pageNavigator.jsp"/>
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>