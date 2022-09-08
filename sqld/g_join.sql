-- *** JOIN
-- �ϳ� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���� ���
-- �������� �ϳ��� RESULT SET���� ���´�.
-- ������ �����ͺ��̽������� �������� �ߺ��� �ּ�ȭ�ϰ� �̻������� �����ϱ� ���� �����͸� ���̺� �˸°� �и��Ͽ� �����ϰ�
-- ���̺��� ���踦 ���� �ʿ��� �����͸� �����Ͽ� ����ϱ� ����.

--��� ����� ������ȣ, ������, �μ��ڵ�, �μ����� ��ȸ
select emp_id, emp_name, dept_code, dept_id, dept_title
from employee e join department d
on(e.dept_code = d.dept_id)
where emp_name = '������';

--0. CROSS JOIN (�Ⱦ�)
--Cartensian���� �߻�
--�� �� ���̺��� �� ��� �ٸ� ���̺��� ��� ���� ���յǴ� ���
select * 
from employee cross join department
order by emp_id desc;

--1. inner join, outer join(left outer join, right outer join, full outer join)
-- 1. inner join (� ����)
-- join ���ǹ��� �ۼ��� ���ǹ��� �����ϴ� row�鸸 join�� ����
-- ������̵�, �����, �����ڵ�, ���޸�
select emp_id, emp_name, e.job_code, j.job_code, job_name
from employee e
inner join job j
on(e.job_code = j.job_code);

select emp_id, emp_name, job_code, job_name
from employee e
inner join job j
using(job_code);

--2. n���� ���̺� �����ϱ�
-- �����ȣ, �����, �μ��ڵ�, �μ���, �μ�������
select emp_id, emp_name, dept_code, dept_title, local_name
from employee e
inner join department d on(e.dept_code = d.dept_id)
inner join location l on (d.location_id = l.local_code);

--SELF JOIN
-- �����, �μ��ڵ�, �޴��� ���̵�, �޴��� �̸�
select e.emp_name, e.dept_code, e.manager_id, m.emp_name
from employee e
inner join employee m
on(e.manager_Id = m.emp_id);


-- outer join
--1. left [outer] join
select *
from job left join employee using(job_code) order by job_code;

--2. right [outer] join
select *
from employee right join job using(job_code) order by job_code;

--3. full [outer] join
select *
from employee full outer join job using(job_code) order by job_code;


--�̸��� '��'�� ���� ����� ���ID, ����̸�, �������� ����ϼ��� 


--�μ����� D5, D6 �� ����� �̸�, ������, �μ��ڵ�, �μ����� ����ϼ���


--�μ��� ��ġ�� ������ �ѱ��̳� �Ϻ��� �����
--�̸�, �μ���, ������, �������� ����Ͻÿ�
-- employee, department, location, national 


