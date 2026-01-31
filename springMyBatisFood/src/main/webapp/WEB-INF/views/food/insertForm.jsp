<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 정보 등록</title>
<style>
    /* 배경은 약간의 회색을 주어 하얀 박스가 돋보이게 합니다 */
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        background-color: #eeeeee; /* 연한 회색 배경 */
        font-family: 'Malgun Gothic', sans-serif;
    }

    /* 하얀색 메인 컨테이너: 너비 80% 설정 */
    .container {
        width: 80%;             /* 화면의 80% 차지 */
        max-width: 1200px;      /* 너무 커지는 걸 방지하기 위한 최대 너비 */
        background-color: #ffffff; /* 순백색 배경 */
        padding: 50px;          /* 내부 여유 공간 확대 */
        border-radius: 15px;    /* 모서리를 조금 더 부드럽게 */
        box-shadow: 0 8px 20px rgba(0,0,0,0.15); /* 그림자를 조금 더 깊게 */
    }

    h2 { 
        text-align: center; 
        color: #222; 
        font-size: 2em;
        margin-bottom: 30px;
    }

    hr {
        border: 0;
        height: 1px;
        background: #ddd;
        margin-bottom: 40px;
    }

    table { 
        width: 100%; 
        border-collapse: collapse; 
    }

    th, td { 
        border: 1px solid #eee; /* 테두리를 연하게 변경 */
        padding: 20px; 
    }

    th { 
        background-color: #fafafa; 
        width: 25%; 
        color: #555;
        font-weight: bold;
    }

    /* 입력창 디자인 강조 */
    input[type="text"], input[type="number"], select {
        width: 98%;
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 16px;
    }

    .btn-area { 
        margin-top: 40px; 
        text-align: center; 
    }

    button {
        padding: 12px 30px;
        margin: 0 10px;
        cursor: pointer;
        border: none;
        border-radius: 8px;
        background-color: #4CAF50;
        color: white;
        font-size: 18px;
        font-weight: bold;
        transition: 0.3s;
    }

    button[type="reset"] { background-color: #ff5252; }
    button[type="button"] { background-color: #448aff; }
    
    button:hover { 
        transform: translateY(-2px); /* 마우스 올리면 살짝 들리는 효과 */
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }
</style>
</head>
<body>

    <div class="container">
        <h2>🥗 음식 정보 등록</h2>
        <hr>

        <form action="/food/insert" method="post">
            <table>
                <tr>
                    <th>음식 이름</th>
                    <td><input type="text" name="fname" placeholder="음식명을 입력하세요" required></td>
                </tr>
                <tr>
                    <th>칼로리 (kcal)</th>
                    <td><input type="number" name="kcal" placeholder="숫자만 입력 가능합니다" required></td>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <td>
                        <select name="category">
                            <option value="한식">한식 (Korean)</option>
                            <option value="중식">중식 (Chinese)</option>
                            <option value="일식">일식 (Japanese)</option>
                            <option value="양식">양식 (Western)</option>
                            <option value="기타">기타 (Others)</option>
                        </select>
                    </td>
                </tr>
            </table>

            <div class="btn-area">
                <button type="submit">등록하기</button>
                <button type="reset">내용 지우기</button>
                <button type="button" onclick="location.href='/food/foodList'">목록으로 이동</button>
            </div>
        </form>
    </div>

</body>
</html>