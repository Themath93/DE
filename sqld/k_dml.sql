--dml : 데이터 조작어
-- 테이블에 값을 추가하거나(insert) 수정하거나(update) 삭제(delete)

--insert 
--새로운 행을 추가하는 구문
--insert into 테이블명(컬럼명1, 컬럼명2...) values(데이터1, 데이터2...)
--컬럼을 지정하지 않으면 null이 들어간다.
--모든 컬럼에 값을 넣는 구문일 경우 컬럼명은 생략이 가능하다.
--insert into 테이블명 values(데이터1, 데이터2...)

INSERT INTO HMD_EMP(EID, ENO, ENAME, MARRIAGE, AGE)
VALUES(2, '000000-1111113', 'HMD', 'N', 21);

--서브쿼리로 데이터 입력하기
create table HMD_EMP_DEPT(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30 CHAR),
    DPET_TITLE VARCHAR2(30 CHAR)
);

INSERT INTO HMD_EMP_DEPT(
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
);
COMMIT;
SELECT * FROM HMD_EMP_DEPT;


--UPDATE
--수정
--UPDATE 테이블명 SET 컬럼명 = 변경할 값, ... [WHERE절]
--전지연 사원의 부서명을 바꿔줘
UPDATE HMD_EMP_DEPT SET DPET_TITLE = '인사잘함부' WHERE EMP_NAME='전지연';
SELECT * FROM HMD_EMP_DEPT;
ROLLBACK;

UPDATE HMD_EMP_DEPT
SET DPET_TITLE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME='전지연')
WHERE EMP_NAME='전지연';

--5. DELETE
-- 테이블의 행은 삭제하는 구문
-- WHERE절 지정하지않으면 모든 데이터가 사라진다.
-- DELETE FROM 테이블명 WHERE 조건식

--HMD_EMP_DEPT 전지연 삭제하기
DELETE HMD_EMP_DEPT WHERE EMP_NAME='전지연';
ROLLBACK;

-- TRUNCATE : 테이블 전체 행 삭제
--             장점 : 빠르다.
--             단점 : ROLLBACK이 안된다.
TRUNCATE TABLE HMD_EMP_DEPT;
SELECT * FROM HMD_EMP_DEPT;
ROLLBACK;











