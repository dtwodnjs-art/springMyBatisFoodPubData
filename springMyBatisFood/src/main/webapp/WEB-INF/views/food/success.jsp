<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 성공</title>
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
        max-width: 600px;
        background-color: #ffffff;
        padding: 50px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        text-align: center;
    }
    h2 { color: #4CAF50; font-size: 2.5em; }
    p { font-size: 1.2em; color: #555; margin-bottom: 30px; }
    .btn-group a {
        display: inline-block;
        padding: 12px 25px;
        margin: 0 10px;
        text-decoration: none;
        border-radius: 8px;
        font-weight: bold;
        transition: 0.3s;
    }
    .btn-list { background-color: #333; color: white; }
    .btn-insert { background-color: #4CAF50; color: white; }
    .btn-group a:hover { opacity: 0.8; transform: translateY(-2px); }
</style>
</head>
<body>
    <div class="container">
        <h2>🎉 등록 완료!</h2>
        <p>${message}</p> <hr style="border: 0; height: 1px; background: #eee; margin: 30px 0;">
        <div class="btn-group">
            <a href="/food/foodList" class="btn-list">목록 확인하기</a>
            <a href="/food/insertForm" class="btn-insert">추가 등록하기</a>
        </div>
    </div>
</body>
</html>