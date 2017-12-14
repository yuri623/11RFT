<%@page import="com.model2.mvc.common.Search"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/jquery-2.1.4.js"></script>
<script type="text/javascript">

	function fncGetList(currentPage) {
		if(currentPage==null&&currentPage==""){
			currentPage=1;
		}
		$("#currentPage").val(currentPage);
		var currentPage = $("#currentPage").val();
		$('form').attr("mehtod", "POST").attr("action", "/product/listProduct?menu=${param.menu}&order=${search.order}").submit();
	}
	$(function() {
		$("td.ct_btn01:contains('�˻�')").bind('click', function() {
			fncGetList(1);
		})
		
		$("td.condition:contains('��ǰ��')	").bind('click', function() {
			alert("����??")
			$("#currentPage").val(1);
			self.location="/product/listProduct?menu=${param.menu}&order=prod_name"
		})
		$("td.condition:contains('�Ż�ǰ��')	").bind('click', function() {
			alert("����??")
			$("#currentPage").val(1);
			self.location="/product/listProduct?menu=${param.menu}&order=manufacture_day"
		})
		$("td.condition:contains('���ݳ�����')	").bind('click', function() {
			alert("����??")
			$("#currentPage").val(1);
			self.location="/product/listProduct?menu=${param.menu}&order=price"
		})
		
		$("td.ct_btn01:contains('Ȯ��')").bind('click', function() {
			fncGetList(1);
		})
		
		$("td[name=prodName]").bind('click', function() {
			var i = ($("td:nth-child(3)").index(this))-5
			console.log(i)
			if($($("input:hidden[name=proTranCode]")[i]).val() == null || $($("input:hidden[name=proTranCode]")[i]).val() == "" ){			
				alert($('#name').val())
				self.location="/product/getProduct?prodNo="+$($("input[name=prodNo]")[i]).val()+"&menu=${param.menu}"
			}	
		})
		
		//ok
		$("td:contains('����ϱ�')").bind('click', function() {
			var i = ($("td:nth-child(9)").index(this))-1
			console.log(i)
			self.location="/purchase/updateTranCodeByProd?prodNo="+$($("input[name=prodNo]")[i]).val()+"&tranCode=2"
		})
		/* if(${param.menu} != 'search' || ${empty i.proTranCode} ){
			$("#name").bind('click', function() {
				self.location='/product/getProduct?prodNo=${i.prodNo}&menu=${param.menu}';
			})
		} */
	})
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">
		<form name="detailForm">
			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
					<tr>
						<td width="15" height="37">
						<img src="/images/ct_ttl_img01.gif" width="15" height="37">
						</td>
						<td background="/images/ct_ttl_img02.gif" width="100%"
							style="padding-left: 10px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="93%" class="ct_ttl01">
									${param.menu == 'search'? '��ǰ �����ȸ' : '��ǰ ����'}
									</td>
								</tr>
							</table>
						</td>
						<td width="12" height="37">
						<img src="/images/ct_ttl_img03.gif" width="12" height="37">
						</td>
					</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<c:if test="${!empty search.searchCondition}">
						<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width: 80px">
								<c:if test="${search.searchCondition == 0}">
									<option value="0" selected>��ǰ��ȣ</option>
									<option value="1">��ǰ��</option>
									<option value="2">��ǰ����</option>
								</c:if>
								<c:if test="${search.searchCondition == 1}">
									<option value="0">��ǰ��ȣ</option>
									<option value="1" selected>��ǰ��</option>
									<option value="2">��ǰ����</option>
								</c:if>
								<c:if test="${search.searchCondition == 2}">
									<option value="0">��ǰ��ȣ</option>
									<option value="1">��ǰ��</option>
									<option value="2" selected>��ǰ����</option>
								</c:if>
						</select> 
						<input type="text" name="searchKeyword"
							value="${! empty search.searchKeyword ? search.searchKeyword : ""}" class="ct_input_g"
							style="width: 200px; height: 19px">
						</td>
					</c:if>
					<c:if test="${empty search.searchCondition}">
						<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width: 80px">
								<option value="0" selected>��ǰ��ȣ</option>
								<option value="1">��ǰ��</option>
								<option value="2">��ǰ����</option>
						</select> 
						<input type="text" name="searchKeyword"
							value="${! empty search.searchKeyword ? search.searchKeyword : ""}" class="ct_input_g"
							style="width: 200px; height: 20px">
						</td>
					</c:if>
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">
									�˻�
								</td>
								<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tbody>
				<tr>
					<td colspan="8">��ü ${resultPage.totalCount}�Ǽ�, ����
						${resultPage.currentPage} ������
						</td>
						<td align="right" class="condition">
						��ǰ��
						</td>
						<td align="right" class="condition">
						�Ż�ǰ��
						</td>
						<td align="right" class="condition">
						���ݳ�����
						</td>
						<td align="right">
						&nbsp;&nbsp;
						<select name="pageSize" class="ct_input_g" style="width: 80px">
							<option value="3" ${search.pageSize == 3? 'selected':''}>3���� ����</option>
							<option value="5" ${search.pageSize==5? 'selected':''}>5���� ����</option>
							<option value="10" ${search.pageSize==10? 'selected':''}>10���� ����</option>
							<option value="15" ${search.pageSize==15? 'selected':''}>15���� ����</option>
							<option value="20" ${search.pageSize==20? 'selected':''}>20���� ����</option>
						</select>
							<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">
									Ȯ��
								</td>
								<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
						</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">��ǰ��</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��ǰ����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" colspan="4">�������</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				<c:set var="n" value="0"/>
				<c:forEach var="i" items="${list}">
					<c:set var = "n" value="${n+1}"/>
					<input type="hidden" name="prodNo" value="${i.prodNo}">
					<tr class="ct_list_pop">
						<td align="center">${n}</td>
						<td></td>
						<td align="left" name="prodName">
								${i.prodName}
						<td></td>
						<td align="left">${i.price}</td>
						<td></td>
						<td align="left">${i.prodDetail}</td>
						<td></td>
						<td align="left" colspan="4">
						<input type="hidden" name="proTranCode" value="${i.proTranCode}">
							<c:if test="${user.role == 'admin' && !empty i.proTranCode}">
								<c:if test="${i.proTranCode == '1  '}">���ſϷ�
									<c:if test="${param.menu == 'manage'}">
										����ϱ�
									</c:if>
							</c:if>
							<c:if test="${i.proTranCode == '2  '}">
							�����
							</c:if>
								<c:if test="${i.proTranCode == '3  '}">
							��ۿϷ�
							</c:if>
							</c:if> <c:if test="${user.role != 'admin' || empty i.proTranCode}">
								<c:if test="${empty i.proTranCode}">
								�Ǹ���
							</c:if>
								<c:if test="${!empty i.proTranCode}">
								������
							</c:if>
							</c:if></td>
					</tr>
					<tr>
						<td colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
				</c:forEach>
				</tbody>
				</table>
				
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					style="margin-top: 10px;">
					<tr>
						<td align="center">
						<input type="hidden" id="currentPage" name="currentPage" value="" />
						<jsp:include page="../common/pageNavigator.jsp" />
						</td>
					</tr>
				</table>
				<!--  ������ Navigator �� -->
		</form>

	</div>


</body>
</html>