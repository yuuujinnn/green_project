<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-4">
		<h3 class="text-left mx-4 my-4">장바구니</h3>
		<div class="row mx-5">
		   <table style="width: 100%">
		   		<tr>
		   			<td align="left">
		   				<a href="/deleteCart.do" class="btn btn-danger">삭제하기</a>
		   			</td>
		   			<td align="right">
		   				<a href="/shippingInfo.do?cartId=${cartId}" 
		   					class="btn btn-success">주문하기</a>
		   			</td>
		   		</tr>
		   </table> 
			<div style="padding-top: 50px;">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>상품</th><th>가격</th><th>수량</th><th>소계</th><th>비고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cartList}" var="product">
							<tr>
								<td>${product.productId} - ${product.pname}</td>
								<td>${product.unitPrice}</td>
								<td>${product.quantity}</td>
								<td>${product.unitPrice * product.quantity}</td>
								<td><a href="/removeCart.do?productId=${product.productId}" 
								       class="badge bg-dark">삭제</a></td>
							</tr>
						</c:forEach>
							<tr>
								<th></th><th></th><th>총액</th><th>${sum}</th><th></th>
							</tr>
					</tbody>
				</table>
				<a href="/productList.do" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
			</div>
		</div>
	</div>
</body>
</html>