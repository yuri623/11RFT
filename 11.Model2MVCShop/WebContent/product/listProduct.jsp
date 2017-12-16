<%@page import="com.model2.mvc.common.Search"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>상품 목록조회</title>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
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
		$("button.btn.btn-default:contains('검색')").bind('click', function() {
			fncGetList(1);
		})
		
		$("button.btn-primary.btn-xs:contains('상품명')	").bind('click', function() {
			$("#currentPage").val(1);
			self.location="/product/listProduct?menu=${param.menu}&order=prod_name"
		})
		$("button.btn-primary.btn-xs:contains('신상품순')	").bind('click', function() {
			$("#currentPage").val(1);
			self.location="/product/listProduct?menu=${param.menu}&order=manufacture_day"
		})
		$("button.btn-primary.btn-xs:contains('가격낮은순')	").bind('click', function() {
			$("#currentPage").val(1);
			self.location="/product/listProduct?menu=${param.menu}&order=price"
		})
		
		$("button.btn-primary.btn-xs:contains('확인')").bind('click', function() {
			fncGetList(1);
		})
		
		$("td:nth-child(1)").bind('click', function() {
			alert($('tr.ct_list_pop').index(this))
		})
		
		$("td[name=prodName]").bind('click', function() {
			var i = $(this).index()
			alert($('tr.ct_list_pop').index())
			/* if($($("input:hidden[name=proTranCode]")[i]).val() == null || $($("input:hidden[name=proTranCode]")[i]).val() == "" ){			
				self.location="/product/getProduct?prodNo="+$($("input[name=prodNo]")[i]).val()+"&menu=${param.menu}"
			}	 */
		})
		
		//ok
		$("td:contains('배송하기')").bind('click', function() {
			var i = ($("td:nth-child(9)").index(this))
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

<body>

	<jsp:include page="/layout/toolbar.jsp"/>

	<div class="container">
		<div class="page-header text-info">
			<h3>${param.menu == 'search'? '상품 목록조회' : '상품 관리'}</h3>
	    </div>
	    <form class="form-inline" name="detailForm">
	    <div class="row">
	    	<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    <div class="col-md-6 text-left">
		    
		    </div>
		    <div class="col-md-6 text-right">
				  <div class="form-group">
				  	<select class="form-control" name="searchCondition" >
						<option value="0" ${!empty search.searchCondition && search.searchCondition == 0? "selected":""}>상품번호</option>
						<option value="1" ${!empty search.searchCondition && search.searchCondition == 1? "selected":""}>상품명</option>
						<option value="2" ${!empty search.searchCondition && search.searchCondition == 2? "selected":""}>상품가격</option>
				  	</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  <p/>
			      <div class="form-group" align="left">
			      	<p>
			      		<button type="button" class="btn btn-primary btn-xs">상품명</button>
						<button type="button" class="btn btn-primary btn-xs">신상품순</button>
						<button type="button" class="btn btn-primary btn-xs">가격낮은순</button>
							<select name="pageSize" class="ct_input_g" style="width: 80px">
								<option value="3" ${search.pageSize == 3? 'selected':''}>3개씩 보기</option>
								<option value="5" ${search.pageSize==5? 'selected':''}>5개씩 보기</option>
								<option value="10" ${search.pageSize==10? 'selected':''}>10개씩 보기</option>
								<option value="15" ${search.pageSize==15? 'selected':''}>15개씩 보기</option>
								<option value="20" ${search.pageSize==20? 'selected':''}>20개씩 보기</option>
							</select>
							<button type="button" class="btn btn-primary btn-xs">확인</button>
					</p>
			      </div>
	    	</div>
	    </div>
	    <table class="table table-hover table-striped" >
	    	<thead>
	    		<tr>
					<th align="center" class="ct_list_b" width="100">No</th>
					<th align="center" class="ct_list_b" width="100">상품이미지</th>
					<th align="center" class="ct_list_b" width="150">상품명</th>
					<th align="center" class="ct_list_b" width="150">가격</th>
					<th align="center" class="ct_list_b">상품설명</th>
					<th align="center" class="ct_list_b" colspan="4">현재상태</th>
				</tr>
			</thead>
			
			<c:set var="n" value="0"/>
				<c:forEach var="i" items="${list}">
					<c:set var = "n" value="${n+1}"/>
					<input type="hidden" name="prodNo" value="${i.prodNo}">
					<tr class="ct_list_pop">
						<td align="left">${n}</td>
						<c:if test="${!empty i.fileName}">
							<td align="center"><img src="/images/uploadFiles/${i.fileName}" width="100px" height="90px"></td>
						</c:if>
						<c:if test="${empty i.fileName}">
							<td align="center"><img src="/images/uploadFiles/no_image.jpg" width="100px" height="90px"></td>
						</c:if>
						<td align="left" name="prodName">${i.prodName}</td>
						<td align="left">${i.price}</td>
						<td align="left">${i.prodDetail}</td>
						<td align="left" colspan="4">
						<input type="hidden" name="proTranCode" value="${i.proTranCode}">
							<c:if test="${user.role == 'admin' && !empty i.proTranCode}">
								<c:if test="${i.proTranCode == '1  '}">구매완료
									<c:if test="${param.menu == 'manage'}">
										배송하기
									</c:if>
								</c:if>
								<c:if test="${i.proTranCode == '2  '}">
									배송중
								</c:if>
								<c:if test="${i.proTranCode == '3  '}">
									배송완료
								</c:if>
							</c:if> <c:if test="${user.role != 'admin' || empty i.proTranCode}">
							<c:if test="${empty i.proTranCode}">
								판매중
							</c:if>
								<c:if test="${!empty i.proTranCode}">
								재고없음
							</c:if>
							</c:if></td>
					</tr>
				</c:forEach>
		</table>
		<div width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
			<p>
				<jsp:include page="../common/pageNavigator_new.jsp" />
			</p>
		</div>
		<input type="hidden" id="currentPage" name="currentPage" value="" />
		<input type="hidden" name="order" value="${search.order}">
		</form>
	</div>
</body>
</html>