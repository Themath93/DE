--dml : ������ ���۾�
-- ���̺� ���� �߰��ϰų�(insert) �����ϰų�(update) ����(delete)

--insert 
--���ο� ���� �߰��ϴ� ����
--insert into ���̺��(�÷���1, �÷���2...) values(������1, ������2...)
--�÷��� �������� ������ null�� ����.
--��� �÷��� ���� �ִ� ������ ��� �÷����� ������ �����ϴ�.
--insert into ���̺�� values(������1, ������2...)

INSERT INTO HMD_EMP(EID, ENO, ENAME, MARRIAGE, AGE)
VALUES(2, '000000-1111113', 'HMD', 'N', 21);

--���������� ������ �Է��ϱ�
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
--����
--UPDATE ���̺�� SET �÷��� = ������ ��, ... [WHERE��]
--������ ����� �μ����� �ٲ���
UPDATE HMD_EMP_DEPT SET DPET_TITLE = '�λ����Ժ�' WHERE EMP_NAME='������';
SELECT * FROM HMD_EMP_DEPT;
ROLLBACK;

UPDATE HMD_EMP_DEPT
SET DPET_TITLE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME='������')
WHERE EMP_NAME='������';

--5. DELETE
-- ���̺��� ���� �����ϴ� ����
-- WHERE�� �������������� ��� �����Ͱ� �������.
-- DELETE FROM ���̺�� WHERE ���ǽ�

--HMD_EMP_DEPT ������ �����ϱ�
DELETE HMD_EMP_DEPT WHERE EMP_NAME='������';
ROLLBACK;

-- TRUNCATE : ���̺� ��ü �� ����
--             ���� : ������.
--             ���� : ROLLBACK�� �ȵȴ�.
TRUNCATE TABLE HMD_EMP_DEPT;
SELECT * FROM HMD_EMP_DEPT;
ROLLBACK;











