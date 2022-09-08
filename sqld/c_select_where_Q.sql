-- 1��
-- �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭"���� ǥ���ϵ��� �Ѵ�.
select department_name as "�а� ��", category as �迭  from tb_department;


-- 2��
-- �а��� �а� ������ ������ ���� ���·� ȭ�鿡 ����Ѵ�.
select department_name || '�� ������ ' || capacity || '�� �Դϴ�.' "�а��� ����" from tb_department;


-- 3��
-- "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û�� ���Դ�. �����ΰ�?
-- (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�� ������ ����)
select department_no 
from tb_department
where department_name = '������а�';

select * 
from tb_student
where department_no = '001'
and absence_yn = 'Y'
and student_ssn like '_______2%';


-- 4�� 
-- ���������� ���� ���� ��� ��ü�ڵ��� ã�� �̸��� �Խ��ϰ��� �Ѵ�.
-- �� ����ڵ��� �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL������ �ۼ��Ͻÿ�.
-- A513079, A513090, A513091, A513110, A513119
select student_name 
from tb_student
where student_no in ('A513079', 'A513090', 'A513091', 'A513110', 'A513119');



-- 5��
-- ���� ������ 20�� �̻� 30�� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
select DEPARTMENT_NAME, CATEGORY
from tb_department
where CAPACITY BETWEEN 20 and 30;

-- 6��
-- �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�.
-- �׷� �� ������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�.
select professor_name
from tb_professor
where department_no is null;

-- 7��
-- Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� �Ѵ�.
-- ��� SQL������ ����ϸ� �� ������ �ۼ��Ͻÿ�.
select * 
from tb_student
where DEPARTMENT_NO is null;

-- 8��
-- ������û�� �Ϸ��� �Ѵ�. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ� ������� � �������� ���� ��ȣ�� ��ȸ�� ���ÿ�.
select * from
tb_class
where PREATTENDING_CLASS_NO is not null;


-- 9��
-- �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�� ���ÿ�.
select distinct category from tb_department;


-- 10��
-- 02�й� ���� �����ڵ��� ������ ������� �Ѵ�. ������ ������� ������ �������� �л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�.
select student_no, student_name, student_ssn, student_address, ENTRANCE_DATE 
from tb_student
where entrance_date between '2002/01/01' and '2002/12/31'
and student_address like '����%';


