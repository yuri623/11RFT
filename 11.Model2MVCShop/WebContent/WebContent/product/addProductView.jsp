<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<title>��ǰ���</title>

<link href="/css/admin.css" rel="stylesheet" type="text/css">

<script src="../javascript/calendar.js" type="text/javascript">
</script>
<script src="../javascript/jquery-2.1.4.js" type="text/javascript"></script>
<script type="text/javascript">
function fncAddProduct(){
	//Form ��ȿ�� ����
 	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();
	
	
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

	$("form").attr("method", "POST").attr("action", "/product/addProduct").submit();
}
$(function() {
	$("td.ct_btn01:contains('���')").bind('click', function() {
		fncAddProduct();
	})
})
$(function() {
	$("td.ct_btn01:contains('���')").click(function() {
		$("form")[0].reset();
	})
})
</script>
</head>

<form name="detailForm">

<table width="100%" height="37" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="15" height="37">
			<img width="15" height="37" src="/images/ct_ttl_img01.gif">
		</td>
		<td width="100%" background="/images/ct_ttl_img02.gif" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">��ǰ���</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img width="12" height="37" src="/images/ct_ttl_img03.gif">
		</td>
	</tr>
</table>

<table width="100%" style="margin-top: 13px;" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="1" bgcolor="#d6d6d6" colspan="3"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td width="1" bgcolor="#d6d6d6"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input name="prodName" class="ct_input_g" style="width: 100px; height: 19px;" type="text" maxlength="20">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" bgcolor="#d6d6d6" colspan="3"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ������ <img width="3" height="3" align="absmiddle" src="/images/ct_icon_red.gif">
		</td>
		<td width="1" bgcolor="#d6d6d6"></td>
		<td class="ct_write01">
			<input name="prodDetail" class="ct_input_g" style="width: 100px; height: 19px;" type="text" maxlength="10" minlength="6">
		</td>
	</tr>
	<tr>
		<td height="1" bgcolor="#d6d6d6" colspan="3"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			�������� <img width="3" height="3" align="absmiddle" src="/images/ct_icon_red.gif">
		</td>
		<td width="1" bgcolor="#d6d6d6"></td>
		<td class="ct_write01">
			<input name="manuDate" class="ct_input_g" style="width: 100px; height: 19px;" type="text" maxlength="10" readonly="readonly" minlength="6">
				&nbsp;<img width="15" height="15" onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" src="../images/ct_icon_date.gif">
		</td>
	</tr>
	<tr>
		<td height="1" bgcolor="#d6d6d6" colspan="3"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			���� <img width="3" height="3" align="absmiddle" src="/images/ct_icon_red.gif">
		</td>
		<td width="1" bgcolor="#d6d6d6"></td>
		<td class="ct_write01">
			<input name="price" class="ct_input_g" style="width: 100px; height: 19px;" type="text" maxlength="10">&nbsp;��
		</td>
	</tr>
	<tr>
		<td height="1" bgcolor="#d6d6d6" colspan="3"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��ǰ�̹���</td>
		<td width="1" bgcolor="#d6d6d6"></td>
		<td class="ct_write01">
			<input name="fileName" value="${product.fileName}" class="ct_input_g" style="width: 200px; height: 19px;" type="file" maxlength="13">
		</td>
	</tr>
	<tr>
		<td height="1" bgcolor="#d6d6d6" colspan="3"></td>
	</tr>
</table>

<table width="100%" style="margin-top: 10px;" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img width="17" height="23" src="/images/ct_btnbg01.gif">
				</td>
				<td class="ct_btn01" background="/images/ct_btnbg02.gif" style="padding-top: 3px;">
					���
				</td>
				<td width="14" height="23">
					<img width="14" height="23" src="/images/ct_btnbg03.gif">
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img width="17" height="23" src="/images/ct_btnbg01.gif">
				</td>
				<td class="ct_btn01" background="/images/ct_btnbg02.gif" style="padding-top: 3px;">
					���
				</td>
				<td width="14" height="23">
					<img width="14" height="23" src="/images/ct_btnbg03.gif">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</form>


</body></html>