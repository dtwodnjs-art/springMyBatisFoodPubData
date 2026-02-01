<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 실패</title>
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
    h2 { color: #f44336; font-size: 2.5em; }
    p { font-size: 1.2em; color: #555; margin-bottom: 30px; }
    .btn-back {
        display: inline-block;
        padding: 12px 30px;
        background-color: #f44336;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-weight: bold;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>⚠️ 등록 실패</h2>
        <p>${message}</p>
        <div class="btn-group">
            <a href="javascript:history.back()" class="btn-back">이전으로 돌아가기</a>
        </div>
    </div>
</body>
</html>