--create, alter, drop
--�����͹��Ἲ : �������� ��Ȯ��, �ϰ����� �����Ǵ� ��
--��Ȯ�� : �ߺ��̳� �����̾��� ����
--�ϰ��� : ���ΰ� ����� ���������� ����Ǵ� ����

create table hmd_emp(
    --�⺻Ű
    --�⺻Ű�� ���̺��� �� ���� �����ϰ� �ĺ��ϴ� ������ ����Ѵ�.
    --���̺� �� �ϳ��� ���� �����ϴ�.
    --�⺻Ű�� �ּҼ�(NOT NULL) ���ϼ�(UNIQUE)�� �����Ǿ�� �Ѵ�.
    --���࿡ �ּҼ��� ���ϼ��� �����Ǵ� �÷��� ���� ���
    --��ǥ���� ���ϴ� �÷��� �⺻Ű�� �����Ѵ�.
    --�⺻Ű�� �����ϸ� ���� �ε����� �ڵ����� ������ �ȴ�.
    EID NUMBER PRIMARY KEY,

    --�÷���(�Ӽ�) Ÿ�� ��������
    --�������� ���� �÷�
    PHONE VARCHAR2(13),
    
    --DEFAULT : �⺻ �� ����, ���� ���̺� ROW�� �߰��� �� �ش� �÷������� ������ ���� ������
    --          NULL ��� �⺻������ ������ ���� �Է�
    HIRE_DATE DATE DEFAULT SYSDATE,
    
    --���� ���Ἲ(UNIQUE) : ���̺��� Ư�� �÷����� ���ؼ� �� ROW�� ������ ���� �޶���Ѵٴ� ����
    --                      �ߺ� �� �ȵ�
    ENO CHAR(14) UNIQUE,
    
    --NULL ���Ἲ : ���̺��� Ư�� �÷����� NULL�� �� �� ����
    ENAME VARCHAR2(30 CHAR) NOT NULL,
    
    --�����ι��Ἲ : Ư�� �÷����� �� �÷��� ���ǵ� �����ο� ���� ���̾�� �Ѵٴ� ����
    MARRIAGE CHAR(1) DEFAULT 'N' CHECK(MARRIAGE IN('Y','N')),
    
    AGE NUMBER CHECK(AGE > 20)
    
    --�ܷ�Ű
    --�������Ἲ : �⺻Ű�� ����Ű ���� ���谡 �׻� ���� ��
    --CONSTRAIN FOREIGN KEY(�÷���) REFERENCES �θ����̺�(�÷���)
    --ON UPDATE CASCADE : �θ����̺��� ���� �����Ǹ� �ڽ����̺��� �൵ ���� ����(����Ŭ ����X)
    --ON DELETE CASCADE : �θ����̺��� ���� �����Ǹ� �ڽ� ���̺��� �൵ ���� ����, 
    --                  �ɼ� ���� ���ϸ� �θ����̺� ������ ���� �Ұ���
    --ON DELETE SET NULL : �θ����̺��� ���� �����Ǹ� �ڽ����̺��� ���� NULL�� ����    
);

--�������� 
--�������� ��ܺ���
--1. AGE�� 20���� ���� ���� �ְ�, MARRIAGE�� 'Z'�� �־ �����ι��Ἲ�� ��ܺ���!
--2. NOT NULL �� ������ �÷��� NULL�� �־ NULL���Ἲ�� ��ܺ���!
--3. PROMARY KEY�� ������ E_ID�� NULL���� �־ �⺻Ű�� �ּҼ��� Ȯ���ϰ�
--  �ߺ��� ���� �־ �⺻Ű�� ���ϼ��� Ȯ��
--4. HIRE_DATE�� NULL�� �־ DEFAULT�� ������ ���� �� �ԷµǴ��� Ȯ��

--INSERT INTO HMD_EMP(EID, PHONE, HIRE_DATE, ENO, ENAME, MARRIAGE, AGE)
--VALUES(0, '010-0000-4141', '2022-09-29', '000000-1111111', 'HMD', 'N', 21);

--INSERT INTO HMD_EMP(EID, PHONE, HIRE_DATE, ENO, MARRIAGE, AGE)
--VALUES(1, '010-0000-4141', '2022-09-29', '000000-1111112', 'N', 21);

--INSERT INTO HMD_EMP(PHONE, HIRE_DATE, ENO, ENAME, MARRIAGE, AGE)
--VALUES('010-0000-4141', '2022-09-29', '000000-1111111', 'HMD', 'N', 21);

INSERT INTO HMD_EMP(EID, ENO, ENAME, MARRIAGE, AGE)
VALUES(1, '000000-1111112', 'HMD', 'N', 21);
COMMIT;

-- ���̺� ���� �� ������ ����
--CREATE TABLE CP_HMD_EMP
--AS SELECT * FROM EMPLOYEE WHERE ENT_YN = 'Y';
DROP TABLE CP_HMD_EMP;

--���̺� �÷��� �����ؿ���
CREATE TABLE CP_HMD_EMP
AS SELECT * FROM EMPLOYEE WHERE 1=0;
SELECT * FROM CP_HMD_EMP;

-------------------------------------------------------------------------------
--���̺� ����
--ALTER TABLE ���̺�� ADD|MODIFY|DROP(�÷��� ��������)

--�÷� �߰� ADD
ALTER TABLE HMD_EMP ADD(JOB_CODE CHAR(2));
SELECT * FROM HMD_EMP;

--�÷� ���� MODIFY
--1. �÷��� Ÿ���� ���̺� �÷����� �ϳ��� ���� ��쿡�� ������ ����
--2. �÷��� ũ��� ���ݺ��� ū ũ��θ� ������ ����
--3. ���������� ������ ��� �ش� ���������� ��� �����Ͱ� �����ؼ��� �ȵȴ�.
--      NOT NULL, �� NULL�� �����Ͱ� �� �ϳ��� ���� ���� ���� ����
--      UNIQUE, �� �ߺ������Ͱ� ���� ����
ALTER TABLE HMD_EMP MODIFY(JOB_CODE NOT NULL);
ALTER TABLE HMD_EMP MODIFY(JOB_CODE CHAR(10));
ALTER TABLE HMD_EMP MODIFY(JOB_CODE UNIQUE);

--�÷� ����
ALTER TABLE HMD_EMP DROP COLUMN JOB_CODE;

--���̺� ����
--DROP
--�ڽ����̺��� �ִ� ��� ���̺� ���� �Ұ���
--�������������� �����ϸ� ���̺��� ���� �ϰ� ���� ���
--DROP TABLE HMD_EMP CASCADE CONSTRAINTS;
DROP TABLE HMD_EMP;








