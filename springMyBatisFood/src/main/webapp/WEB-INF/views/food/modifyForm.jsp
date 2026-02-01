<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 정보 수정</title>
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
        max-width: 800px;
        background-color: #ffffff;
        padding: 50px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    }

    h2 { text-align: center; color: #333; margin-bottom: 30px; }
    h2 span { color: #2196F3; }

    .form-group { margin-bottom: 20px; }
    label { display: block; margin-bottom: 8px; font-weight: bold; color: #555; }
    
    input[type="text"], input[type="number"], select {
        width: 100%;
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-sizing: border-box; /* 패딩 포함 너비 조절 */
        font-size: 16px;
    }

    /* 읽기 전용 필드 스타일 */
    input[readonly] { background-color: #f9f9f9; color: #999; cursor: not-allowed; }

    .btn-area { text-align: center; margin-top: 40px; }
    
    .btn {
        padding: 12px 30px;
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

    .btn-submit { background-color: #2196F3; color: white; }
    .btn-cancel { background-color: #9e9e9e; color: white; }

    .btn:hover { opacity: 0.8; transform: translateY(-2px); }
</style>
</head>
<body>

    <div class="container">
        <h2>🛠️ 음식 <span>정보 수정</span></h2>
        <hr style="border: 0; height: 1px; background: #ddd; margin-bottom: 30px;">

        <form action="/food/modify" method="post">
            
            <div class="form-group">
                <label>음식 번호 (수정 불가)</label>
                <input type="text" name="fno" value="${food.fno}" readonly>
            </div>

            <div class="form-group">
                <label>음식 이름</label>
                <input type="text" name="fname" value="${food.fname}" required>
            </div>

            <div class="form-group">
                <label>칼로리 (kcal)</label>
                <input type="number" name="kcal" value="${food.kcal}" required>
            </div>

            <div class="form-group">
                <label>카테고리</label>
                <select name="category">
                    <option value="한식" ${food.category == '한식' ? 'selected' : ''}>한식</option>
                    <option value="일식" ${food.category == '일식' ? 'selected' : ''}>일식</option>
                    <option value="중식" ${food.category == '중식' ? 'selected' : ''}>중식</option>
                    <option value="양식" ${food.category == '양식' ? 'selected' : ''}>양식</option>
                    <option value="기타" ${food.category == '기타' ? 'selected' : ''}>기타</option>
                </select>
            </div>

            <div class="btn-area">
                <button type="submit" class="btn btn-submit">수정 완료</button>
                <a href="javascript:history.back()" class="btn btn-cancel">취소</a>
            </div>
        </form>
    </div>

</body>
</html>