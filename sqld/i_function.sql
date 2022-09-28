---CHAR
-- 고정길이 문자열
-- 컬럼크기 100 -> 길이가 10인 문자열을 추가시 -> 문자열의 길이가 100, 뒤는 공백으로 채워짐
---VARCHAR2
-- 가변길이 문자열
-- 컬럼길이 100 -> 길이가 10인 문자열을 추가시 -> 컬럼값의 길이가 10으로 맞춰짐


--1. 문자 관련 함수
-- LENGTH, LENGTHB, SUBSTR, INSTR, CONCAT, REPLACE, TRIM, LPAD, RPAD
select length('oracle') from dual;  --> dual: 가상테이블
select length('오라클') from dual;  --> dual: 가상테이블
select lengthb('oracle') from dual;  --> dual: 가상테이블
select lengthb('오라클') from dual;  --> dual: 가상테이블

select substr('PCLASS', 2) from dual;
select substr('PCLASS', 2,3) from dual;

select instr('AABAACAABBAA', 'B') from dual;
select instr('AABAACAABBAA', 'B', 4) from dual;
select instr('AABAACAABBAA', 'B', -1, 3) from dual;

select concat('A','B') from dual;
select 'A' || 'B' from dual;

select replace('서울시 강남구 선릉동', '선릉동') from dual;
select replace('서울시 강남구 선릉동', '선릉동', '역삼동') from dual;

select trim('  multicampus  ') from dual;
select trim(leading 'm' from 'multicampus') from dual;
select trim(trailing 'm' from 'multicampus') from dual;
select trim('m' from 'multicampusm') from dual;

select lpad(email, 20) from employee;
select rpad(email, 20, '#') from employee;

--EMPLOYEE 테이블에서 사원명과 주민번호를 조회하세요
--단 주민번호는 생년월일과 '-' 까지만 보이게 하고 나머지 자리의 숫자들은 *로 바꾸어 출력하세요.
select emp_name, substr(emp_no,1,7)|| '*******' from employee;
select emp_name, rpad(substr(emp_no,1,7), 14, '*') from employee;
select emp_name, replace(emp_no, substr(emp_no, 8), '*******') from employee;

--------------------------------------------------------------------------------
--2. 숫자 처리 함수
-- ABS, MOD, ROUND, FLOOR, TRUNC, CEIL


--------------------------------------------------------------------------------
--3. 날짜 처리 함수
-- SYSDATE, MONTHS_BETWEEN, ADD_MONTHS, EXTRACT
--SYSDATE : 시스템에 저장 되어있는 현재 날짜
SELECT SYSDATE FROM DUAL;
--SYSTIMESTAMP
SELECT SYSTIMESTAMP FROM DUAL;
--localtimestamp
SELECT localtimestamp FROM DUAL;

--사원들의 근무개월수를 구해보도록 하자
select
emp_name
, trunc(months_between(sysdate, hire_date)) as 근무개월수
from employee
order by hire_date asc;

select emp_name, hire_date, add_months(hire_date, 12) from employee;

select emp_name
, extract(year from hire_date)
, extract(month from hire_date)
, extract(day from hire_date)
, extract(hour from localtimestamp)
from employee;

--4.형변환 함수
--TO_CHAR
--TO_DATE
SELECT TO_CHAR(SYSDATE, 'YYYY"년 " MONTH DD"일" DAY ') FROM DUAL;
SELECT TO_CHAR(123456789, '9,999,999,999') FROM DUAL;
SELECT TO_CHAR(10000, '$99999') FROM DUAL;
SELECT TO_CHAR(10000, 'L99,999') FROM DUAL;


--5. null처리 함수
-- null : 아직 정해지지 않은 값
-- null의 산술연산이나 비교연산의 결과는 null
-- null의 논리연산 확인
-- nvl, nvl2, nullif
-- nvl
select emp_name, bonus, nvl(bonus,0) from employee;
select emp_name, bonus, nvl(dept_code,'무소속') from employee;

-- nvl2
--employee 테이블에서 보너스가 null 인 직원은 0.5,  아닌 직원은 0.1
select emp_name, bonus, nvl2(bonus, 0.5, 0.1) from employee;

--nullif
select nullif('1234','123') from dual;
select nullif('1234','1234') from dual;

--------------------------------------------------------------------------------
--6. 선택 함수 decode
-- case when then 기능을 하는 함수
-- 주민등록번호 뒷자리의 첫자리가 홀수이면 남자, 짝수이면 여자로 표시하시오
select emp_name, emp_no
,decode(mod(substr(emp_no,8,1),2),1,'남',0,'여')
from employee;


















