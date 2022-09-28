---CHAR
-- �������� ���ڿ�
-- �÷�ũ�� 100 -> ���̰� 10�� ���ڿ��� �߰��� -> ���ڿ��� ���̰� 100, �ڴ� �������� ä����
---VARCHAR2
-- �������� ���ڿ�
-- �÷����� 100 -> ���̰� 10�� ���ڿ��� �߰��� -> �÷����� ���̰� 10���� ������


--1. ���� ���� �Լ�
-- LENGTH, LENGTHB, SUBSTR, INSTR, CONCAT, REPLACE, TRIM, LPAD, RPAD
select length('oracle') from dual;  --> dual: �������̺�
select length('����Ŭ') from dual;  --> dual: �������̺�
select lengthb('oracle') from dual;  --> dual: �������̺�
select lengthb('����Ŭ') from dual;  --> dual: �������̺�

select substr('PCLASS', 2) from dual;
select substr('PCLASS', 2,3) from dual;

select instr('AABAACAABBAA', 'B') from dual;
select instr('AABAACAABBAA', 'B', 4) from dual;
select instr('AABAACAABBAA', 'B', -1, 3) from dual;

select concat('A','B') from dual;
select 'A' || 'B' from dual;

select replace('����� ������ ������', '������') from dual;
select replace('����� ������ ������', '������', '���ﵿ') from dual;

select trim('  multicampus  ') from dual;
select trim(leading 'm' from 'multicampus') from dual;
select trim(trailing 'm' from 'multicampus') from dual;
select trim('m' from 'multicampusm') from dual;

select lpad(email, 20) from employee;
select rpad(email, 20, '#') from employee;

--EMPLOYEE ���̺��� ������ �ֹι�ȣ�� ��ȸ�ϼ���
--�� �ֹι�ȣ�� ������ϰ� '-' ������ ���̰� �ϰ� ������ �ڸ��� ���ڵ��� *�� �ٲپ� ����ϼ���.
select emp_name, substr(emp_no,1,7)|| '*******' from employee;
select emp_name, rpad(substr(emp_no,1,7), 14, '*') from employee;
select emp_name, replace(emp_no, substr(emp_no, 8), '*******') from employee;

--------------------------------------------------------------------------------
--2. ���� ó�� �Լ�
-- ABS, MOD, ROUND, FLOOR, TRUNC, CEIL


--------------------------------------------------------------------------------
--3. ��¥ ó�� �Լ�
-- SYSDATE, MONTHS_BETWEEN, ADD_MONTHS, EXTRACT
--SYSDATE : �ý��ۿ� ���� �Ǿ��ִ� ���� ��¥
SELECT SYSDATE FROM DUAL;
--SYSTIMESTAMP
SELECT SYSTIMESTAMP FROM DUAL;
--localtimestamp
SELECT localtimestamp FROM DUAL;

--������� �ٹ��������� ���غ����� ����
select
emp_name
, trunc(months_between(sysdate, hire_date)) as �ٹ�������
from employee
order by hire_date asc;

select emp_name, hire_date, add_months(hire_date, 12) from employee;

select emp_name
, extract(year from hire_date)
, extract(month from hire_date)
, extract(day from hire_date)
, extract(hour from localtimestamp)
from employee;

--4.����ȯ �Լ�
--TO_CHAR
--TO_DATE
SELECT TO_CHAR(SYSDATE, 'YYYY"�� " MONTH DD"��" DAY ') FROM DUAL;
SELECT TO_CHAR(123456789, '9,999,999,999') FROM DUAL;
SELECT TO_CHAR(10000, '$99999') FROM DUAL;
SELECT TO_CHAR(10000, 'L99,999') FROM DUAL;


--5. nulló�� �Լ�
-- null : ���� �������� ���� ��
-- null�� ��������̳� �񱳿����� ����� null
-- null�� ������ Ȯ��
-- nvl, nvl2, nullif
-- nvl
select emp_name, bonus, nvl(bonus,0) from employee;
select emp_name, bonus, nvl(dept_code,'���Ҽ�') from employee;

-- nvl2
--employee ���̺��� ���ʽ��� null �� ������ 0.5,  �ƴ� ������ 0.1
select emp_name, bonus, nvl2(bonus, 0.5, 0.1) from employee;

--nullif
select nullif('1234','123') from dual;
select nullif('1234','1234') from dual;

--------------------------------------------------------------------------------
--6. ���� �Լ� decode
-- case when then ����� �ϴ� �Լ�
-- �ֹε�Ϲ�ȣ ���ڸ��� ù�ڸ��� Ȧ���̸� ����, ¦���̸� ���ڷ� ǥ���Ͻÿ�
select emp_name, emp_no
,decode(mod(substr(emp_no,8,1),2),1,'��',0,'��')
from employee;


















