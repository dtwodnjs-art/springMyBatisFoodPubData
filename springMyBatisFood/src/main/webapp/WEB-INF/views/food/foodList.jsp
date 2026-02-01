<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 목록 조회</title>
<style>
    /* 전체 배경 설정 */
    body {
        display: flex;
        justify-content: center;
        padding-top: 50px;
        min-height: 100vh;
        margin: 0;
        background-color: #eeeeee;
        font-family: 'Malgun Gothic', sans-serif;
    }

    /* 메인 컨테이너 */
    .container {
        width: 80%;
        max-width: 1200px;
        background-color: #ffffff;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        align-self: flex-start;
    }

    /* 헤더 영역 */
    .header-box {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
        border-bottom: 2px solid #4CAF50;
        padding-bottom: 15px;
    }

    h2 { margin: 0; color: #222; }
    h2 span { color: #4CAF50; }

    /* 검색창 영역 */
    .search-container {
        margin-bottom: 25px;
        text-align: right;
    }
    
    .search-select {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 14px;
    }

    .search-input {
        padding: 10px;
        width: 250px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 14px;
    }

    .btn-search {
        padding: 10px 20px;
        background-color: #333;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        transition: 0.3s;
    }

    .btn-search:hover { background-color: #555; }

    /* 테이블 디자인 */
    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #eee;
    }

    th {
        background-color: #f8f9fa;
        color: #333;
        font-weight: bold;
        border-top: 1px solid #ddd;
    }

    tr:hover { background-color: #f9f9f9; }

    /* 버튼 스타일 */
    .btn-area {
        margin-top: 30px;
        text-align: right;
    }

    .btn-insert {
        padding: 12px 25px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-weight: bold;
        display: inline-block;
        transition: 0.3s;
    }

    .btn-insert:hover { opacity: 0.8; transform: translateY(-2px); }

    .kcal-text {
        color: #e74c3c;
        font-weight: bold;
    }

    /* 검색 결과 없음 메시지 */
    .no-data {
        padding: 100px 0;
        color: #888;
        font-size: 1.2em;
    }
</style>
</head>
<body>

    <div class="container">
        <div class="header-box">
            <h2>🍱 FOOD <span>LIST</span></h2>
            <div>
                <a href="/food/foodList" class="btn-insert" style="background-color: #333; margin-right: 5px;">전체 목록</a>
                <a href="/food/insertForm" class="btn-insert">신규 음식 등록</a>
            </div>
        </div>

        <div class="search-container">
            <form action="/food/search" method="get">
                <select name="searchType" class="search-select">
                    <option value="fname" ${param.searchType == 'fname' ? 'selected' : ''}>음식 이름</option>
                    <option value="category" ${param.searchType == 'category' ? 'selected' : ''}>카테고리</option>
                </select>
                <input type="text" name="keyword" class="search-input" value="${param.keyword}" placeholder="검색어를 입력하세요">
                <button type="submit" class="btn-search">검색하기</button>
            </form>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th width="10%">번호</th>
                    <th width="40%">음식 이름</th>
                    <th width="15%">칼로리</th>
                    <th width="15%">카테고리</th>
                    <th width="20%">등록일</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty foodList}">
                        <c:forEach items="${foodList}" var="food">
                            <tr>
                                <td>${food.fno}</td>
                                <td style="text-align: left; padding-left: 50px;">
                                    <a href="/food/detail?fno=${food.fno}" style="text-decoration:none; color:#2196F3; font-weight:bold;">
                                        ${food.fname}
                                    </a>
                                </td>
                                <td><span class="kcal-text">${food.kcal}</span> kcal</td>
                                <td>${food.category}</td>
                                <td><fmt:formatDate value="${food.regDate}" pattern="yyyy-MM-dd" /></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5" class="no-data">등록된 음식 정보가 없거나 검색 결과가 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

</body>
</html>