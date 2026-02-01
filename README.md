# 🍱 Food Management Project (Spring Boot & MyBatis)

Spring Boot와 MyBatis를 활용하여 제작한 **음식 정보 관리 웹 애플리케이션**입니다. 
기본적인 CRUD 기능부터 동적 SQL을 이용한 검색 기능까지 포함되어 있습니다.

## 🚀 기술 스택 (Tech Stack)
* **Framework:** Spring Boot 3.x
* **Language:** Java 17
* **Database:** Oracle DB
* **ORM:** MyBatis
* **View:** JSP, JSTL
* **Library:** HikariCP, Lombok

## 📌 주요 기능 (Main Features)
1. **음식 등록 (Create)**
   - 음식 이름, 칼로리, 카테고리(한식/일식/중식 등) 입력 및 저장
   - 데이터 무결성을 위한 권한(Auth) 정보 동시 생성
2. **목록 조회 및 검색 (Read & Search)**
   - 전체 등록된 음식 리스트 확인
   - **동적 검색:** 음식 이름 또는 카테고리별 키워드 검색 기능
3. **상세 보기 (Detail)**
   - 특정 음식의 상세 정보(등록일, 수정일 포함) 확인
4. **정보 수정 (Update)**
   - 기존 데이터를 불러와서 이름, 칼로리, 카테고리 갱신
5. **정보 삭제 (Delete)**
   - 자식 레코드(Auth)와 부모 레코드(Info)를 순차적으로 삭제하여 무결성 유지

## 📂 프로젝트 구조 (Project Structure)
```text
src/main/java
 └─ com.zeus
     ├─ controller   # 웹 요청 처리 (FoodController)
     ├─ domain       # 데이터 객체 (Food, FoodAuth)
     ├─ mapper       # MyBatis 인터페이스 (FoodMapper)
     └─ service      # 비즈니스 로직 (FoodService, FoodServiceImpl)

src/main/resources
 └─ mappers          # SQL 쿼리 파일 (FoodMapper.xml)

src/main/webapp/WEB-INF/views/food
 ├─ foodList.jsp     # 목록 및 검색 화면
 ├─ insertForm.jsp   # 등록 화면
 ├─ detail.jsp       # 상세 보기 화면
 ├─ modifyForm.jsp   # 수정 화면
 └─ success.jsp      # 처리 결과 화면



## Oracle SQL Developer
-- 초기화
DROP TABLE food_auth CASCADE CONSTRAINTS;
DROP TABLE food_info CASCADE CONSTRAINTS;
DROP SEQUENCE food_info_seq;

-- 시퀀스

CREATE SEQUENCE food_info_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

--  음식 정보 테이블
CREATE TABLE food_info (
    fno NUMBER PRIMARY KEY,            -- 음식 번호
    fname VARCHAR2(100) NOT NULL,      -- 음식 이름
    kcal NUMBER DEFAULT 0,             -- 칼로리
    category VARCHAR2(50),             -- 음식 종류 
    regdate DATE DEFAULT SYSDATE,      -- 등록일
    moddate DATE DEFAULT SYSDATE       -- 수정일
);


CREATE TABLE food_auth (
    fno NUMBER NOT NULL,
    auth VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_food_auth FOREIGN KEY(fno) REFERENCES food_info(fno)
);

INSERT INTO food_info (fno, name, price, category, description)
VALUES (seq_food.NEXTVAL, '김치찌개', 9000, '한식', '얼큰하고 시원한 돼지고기 김치찌개');

-- 전체 목록 최신순
SELECT * FROM food_info ORDER BY fno DESC;

-- 카테고리별 검색
SELECT * FROM food_info WHERE category = '한식';

-- 이름에 '치킨'이 들어간 음식 검색
SELECT * FROM food_info WHERE name LIKE '%치킨%' ORDER BY fno DESC;

UPDATE food_info 
SET price = 10000, 
    description = '가격이 인상된 김치찌개' 
WHERE fno = 1;

DELETE FROM food_info WHERE fno = 1;
