-- *** order by *** 
-- ����� ������ �� ����ϴ� ����
-- select���� ���� �������� �ۼ�, ��������� ���� ������
-- �ؼ����� : FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY

-- ORDER BY �ۼ���
-- ORDER BY �÷��� ASC : �÷����� �������� ����, ���� ������ �÷��� �ϳ� ���̶�� ���� ����
-- ORDER BY �÷��� DESC : �÷����� �������� ����, ���� �Ұ�
-- NULLS FIRST : �÷����� NULL�� ���� ��� �տ� ����
-- NULLS LAST  : �÷����� NULL�� ���� ��� �ڿ� ����

-- ����� �̸�, �޿�, �μ��ڵ�, ���ʽ�, ���������� ��ȸ
SELECT EMP_NAME, SALARY, DEPT_CODE, BONUS, SAL_LEVEL
FROM EMPLOYEE
--�̸����� �������� ����
--ORDER BY EMP_NAME DESC;
--�������� �������� ����
--ORDER BY salary;
--SELECT���� ������ ������ RESULTSET�� �ι� ° �÷����� �������� ����
--ORDER BY 2 DESC;
--���������� �������� ����, ���������� ���ٸ� ������ �������� �������� ����
--ORDER BY SAL_LEVEL ASC, SALARY DESC;
--���ʽ��� �������� �������� ����, �÷����� NULL�� ������ NULL�� �������� ����
--ORDER BY bonus ASC NULLS FIRST;
ORDER BY bonus ASC NULLS LAST;




















