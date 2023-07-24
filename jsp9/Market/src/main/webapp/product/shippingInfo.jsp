<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-4">
		<h3 class="text-left mx-4 my-4">배송 정보</h3>
		<div class="row mx-5">
			<form action="/processShippingInfo.do" method="post">
			    <input type="hidden" name="cartId" value="${cartId}">
				<div class="form-group row">
					<label class="col-sm-2">성명</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="name" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">배송일</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="shippingDate" class="form-control"
						     placeholder="yyyy/mm/dd">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">국가명</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="country" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">우편번호</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="zipCode" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">주소</label>
					<div class="col-sm-3 my-2">
						<input type="text" name="addressName" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-3 my-2">
						<input type="submit" value="등록" class="btn btn-primary">
						<a href="/checkOutCancel.do" class="btn btn-secondary">취소</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>