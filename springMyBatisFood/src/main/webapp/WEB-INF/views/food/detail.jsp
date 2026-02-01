<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 상세 정보</title>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        background-color: #eeeeee;
        font-family: 'Malgun Gothic', sans-serif;
    }

    .container {
        width: 80%;
        max-width: 900px;
        background-color: #ffffff;
        padding: 50px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    }

    h2 { text-align: center; color: #333; margin-bottom: 30px; }
    h2 span { color: #2196F3; }

    table { 
        width: 100%; 
        border-collapse: collapse; 
        margin-bottom: 30px;
    }

    th, td { 
        padding: 20px; 
        border-bottom: 1px solid #eee; 
    }

    th { 
        background-color: #f9f9f9; 
        width: 25%; 
        text-align: left;
        color: #666;
    }

    td { color: #333; font-size: 1.1em; }

    .kcal-value { color: #e74c3c; font-weight: bold; }

    .btn-area { text-align: center; margin-top: 20px; }

    .btn {
        padding: 12px 25px;
        margin: 0 5px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        transition: 0.3s;
    }

    .btn-list { background-color: #333; color: white; }
    .btn-modify { background-color: #2196F3; color: white; }
    .btn-remove { background-color: #f44336; color: white; }

    .btn:hover { opacity: 0.8; transform: translateY(-2px); }
</style>
</head>
<body>

    <div class="container">
        <h2>🔍 음식 <span>상세 정보</span></h2>
        <hr style="border: 0; height: 1px; background: #ddd; margin-bottom: 30px;">

        <table>
            <tr>
                <th>음식 번호</th>
                <td>${food.fno}</td>
            </tr>
            <tr>
                <th>음식 이름</th>
                <td><strong>${food.fname}</strong></td>
            </tr>
            <tr>
                <th>칼로리</th>
                <td><span class="kcal-value">${food.kcal}</span> kcal</td>
            </tr>
            <tr>
                <th>카테고리</th>
                <td>${food.category}</td>
            </tr>
            <tr>
                <th>등록일</th>
                <td><fmt:formatDate value="${food.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            </tr>
            <tr>
                <th>최종 수정일</th>
                <td><fmt:formatDate value="${food.modDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            </tr>
        </table>

        <div class="btn-area">
            <a href="/food/foodList" class="btn btn-list">목록으로</a>
            
            <a href="/food/modifyForm?fno=${food.fno}" class="btn btn-modify">정보 수정</a>
            
            <a href="/food/remove?fno=${food.fno}" class="btn btn-remove" 
               onclick="return confirm('정말 삭제하시겠습니까?');">정보 삭제</a>
        </div>
    </div>

</body>
</html>