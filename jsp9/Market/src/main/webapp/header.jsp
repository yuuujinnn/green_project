<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="/resources/js/bootstrap.js"></script>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
    <a class="navbar-brand" href="index.jsp" style="color: green">GreenShop</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="/productList.do">상품 목록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/productForm.do">상품 등록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/editProduct.do?edit=update">상품 수정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/editProduct.do?edit=delete">상품 삭제</a>
        </li>
        <!-- 로그인 세션 처리 -->
        <c:choose>
        	<c:when test="${empty sessionId}">
		        <li class="nav-item">
		          <a class="nav-link" href="/loginForm.do">로그인</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/memberForm.do">회원 가입</a>
		        </li>
		    </c:when>
		    <c:otherwise>
		    	<li class="nav-item">
		          <a class="nav-link" href="/logout.do">${sessionId}님(로그 아웃)</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/memberInfo.do?mid=${sessionId}">나의 정보</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/cart.do">장바구니</a>
		        </li>
		    </c:otherwise>
        </c:choose>
      </ul>
    </div>
  </div>
</nav>