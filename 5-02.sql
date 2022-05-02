-- ����(LEFT) �ڸ��� Ư�� ��ȣ�� ä���(PAD) �����Լ�
-- LPAD(�÷���, �ڸ���, ä�﹮��)
SELECT LPAD(SALARY, 10, '*')
FROM EMPLOYEE;


-- ������(RIGHT) �ڸ��� Ư�� ��ȣ�� ä���(PAD) �����Լ�

SELECT RPAD(SALARY, 10, '*')
FROM EMPLOYEE;

-- LTRIM(���ڿ�) : ���� ���� ����
-- RTRIM(���ڿ�) : ������ ���� ����
-- TRIM(���ڿ�) : ���� ���� ����
SELECT ' Oracle mania',
    LTRIM( ' Oracle mania '),
    RTRIM( ' Oracle mania ')
    FROM DUAL;

SELECT (' Oracle mania '),
    TRIM(' Oracle mania ')  
    FROM DUAL;
    
-- ���� �Լ�
-- ROUND : Ư���ڸ������� �ݿø��ϴ� ���� �Լ�
SELECT 98.7654,
    ROUND(98.7654), -- ù°�ڸ� �ݿø�
    ROUND(98.7654, 2), -- ��°�ڸ� �ݿø� (�Ű������� 2°�ڸ� ����)
    ROUND(98.7654, -1) -- ���� 1�ڸ� �ݿø�
    FROM DUAL;  
    
-- TRUNC : Ư�� �ڸ������� ����
SELECT 98.7654,
    TRUNC(98.7654), -- ù° �ڸ����� ����
    TRUNC(98.7654, 2), -- ��° �ڸ����� ����
    TRUNC(98.7654, -1) -- ���� 1�ڸ� ���� 
    FROM DUAL;

-- MOD : ù��° ���� �ι�° ������ ���� ������ ��ȯ
SELECT MOD(31, 2), -- �� 15 , ������ 1 (31��, 2�γ���)
    MOD(31, 5),
    MOD(31, 8)
FROM DUAL;

-- ���� 1) ������� �޿��� 500���� ������������ ����ؼ� ���
SELECT ENAME, SALARY, MOD(SALARY,500)
    FROM EMPLOYEE;
    
-- ��¥�Լ�
-- �ý��ۿ� ����� ���� ��¥�� ��ȯ�ϴ� ����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

-- ��¥ ����
SELECT SYSDATE - 1 AS ����,
    SYSDATE AS ����,
    SYSDATE + 1 AS ����
FROM DUAL;

-- ������� ��������� �ٹ��ϼ� ���ϱ�
-- ��, �Ǽ��� ������ �ݿø��ϱ�
SELECT ENAME,HIREDATE, ROUND(SYSDATE - HIREDATE) AS �ٹ��ϼ� FROM EMPLOYEE;

-- ������ �������� ���ʷ� �����ϴ� ����� ���ϱ�
-- NEXT_DAY(��¥, ����)

SELECT SYSDATE,
    NEXT_DAY(SYSDATE, '�����')AS "�̹��� �����",
    NEXT_DAY(SYSDATE, 7)AS "���ڷ� �̹��� �����"
FROM DUAL;

-- �Ի��� ���� ������ �� ���ϱ�
SELECT ENAME, HIREDATE,
    LAST_DAY(HIREDATE)
    FROM EMPLOYEE;
    
-- �ڷ��� ��ȯ �Լ�
-- TO_CHAR : ��¥�� �������� ���������� ��ȯ�ϴ� �����Լ�
-- TO_CHAR(��¥�÷�, ��������) : ��¥�� ������ ������ ���� ���ڿ��� ��ȯ
SELECT ENAME, HIREDATE,
    TO_CHAR(HIREDATE, 'YY-MM') AS "�⵵(2�ڸ�)��",
    TO_CHAR(HIREDATE, 'YYYY/MM/DD DAY') AS "�⵵(4�ڸ�)�� �� ����",
    TO_CHAR(HIREDATE, 'YYYY-MM-DD HH24:MI:SS') AS "���־��� ����"
    FROM EMPLOYEE;

-- TO_CHAR : ���ڸ� ������ ������ ���� ���ڿ��� ��ȯ
-- L : �� ������ ��ȭ ��ȣ�� �տ� ǥ��
-- 9 : �ڸ����� ��Ÿ��, �ڸ����� ���� ������ ������ ä��������
-- 0 : �ڸ����� ��Ÿ��, �ڸ����� ���� ������ 0���� ä��
-- , : õ���� �ڸ� ������ ���� ǥ��
SELECT ENAME, SALARY,
    TO_CHAR(SALARY, 'L999,999') AS "�� ǥ��",
     TO_CHAR(SALARY, 'L000,000') AS "�� ǥ��2"
FROM EMPLOYEE;
    
-- TO_DATE : ���ڸ� ��¥�� ��ȯ�ϴ� ���� �Լ�
-- ��������1)1981�� 2�� 20�Ͽ� �Ի��� ��� �˻��ϱ�
-- ������̺� : EMPLOYEE
-- �Ի��� : HIREDATE
SELECT ENAME, HIREDATE FROM EMPLOYEE 
WHERE HIREDATE = TO_DATE('19810220' , 'YYYY-MM-DD');

-- ���ڸ� ���ڷ� �ٲٴ� ���� �Լ�
-- TO_NUMBER(���ڿ�����, ��������) : ���ڿ��� ������������ ���ڷ� �ٲٱ�
SELECT TO_NUMBER('100,000', '999,999') 
- TO_NUMBER('50,000','999,999') 
FROM DUAL;

-- �������� 1) SUBSTR�Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ���.
SELECT ENAME , SUBSTR(HIREDATE , 1,2) AS �Ի�⵵ 
,SUBSTR(HIREDATE , 4,2) AS �Ի��  
FROM EMPLOYEE;
-- SELECT �⵵ , �� FROM EMPLOYEE

-- �������� 2) SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ���
SELECT ENAME, HIREDATE FROM EMPLOYEE WHERE SUBSTR(HIREDATE, 4,2) = '04';

-- �������� 3)
-- ����� ¦���� ��� ����ϱ�
-- MOD �Լ����

SELECT ENAME, ENO FROM EMPLOYEE WHERE MOD(ENO,2) = 0;

-- �������� 4)
-- ���� ��ĥ�� �������� ����Ͻÿ�. ���� ��¥���� ���� 1��1�� �� �� ����� ����ϰ�,
-- ��, TO_DATE �Լ��� ����ؼ� ���� ��ġ ���� ����Ͻÿ�.
SELECT TRUNC(SYSDATE - TO_DATE('20220101' , 'YYYYMMDD')) FROM EMPLOYEE;

-- �Ϲ� �Լ�
-- NULL �̸� 0 �Ǵ� �ٸ� ������ �ٲٴ� ���� �Լ�
-- NVL(NULL�� ���Ե� �÷�, �ٲܰ�) : NULL�̸� 0 �Ǵ� �ٸ� ������ �ٲٴ� �����Լ�
SELECT ENAME, SALARY,
    COMMISSION,
    NVL(COMMISSION, 0) AS "���ʽ�",
    SALARY * 12 + NVL(COMMISSION,0) AS "����"
    FROM EMPLOYEE
    ORDER BY JOB;

-- NVL2 (�÷���, ǥ����1, ǥ����2)
-- �÷����� NULL �̸� ǥ����2�� ��ȯ , NULL�� �ƴϸ� ǥ����1�� ��ȯ
SELECT ENAME, SALARY, COMMISSION,
    NVL2(COMMISSION, SALARY*12+COMMISSION, SALARY*12) FROM EMPLOYEE
    ORDER BY JOB;
    
-- NULLIF (ǥ����1, ǥ����2)
-- ǥ����1 == ǥ����2 NULL ���
-- �ƴϸ� ǥ���� 1�� ���
SELECT NULLIF('A', 'A'),
    NULLIF('A', 'B')
    FROM DUAL;
    
-- ����Ŭ���� IF/ ELSE IF/ ELSE ���
-- DECODE(ǥ����, ����1, ���1,
--               ����2, ���2,
--               ����3, ���3,
--               ����4, ���4,
--               �⺻���(DEFUALT)
SELECT ENAME, DNO,
    DECODE(DNO, 10, 'ȸ���',
                20, '������',
                30, '������',
                40, '���',
                'DEFAULT') AS "�μ��̸�"
FROM EMPLOYEE
ORDER BY DNO;

-- �Ǵٸ� ��� IF / ELSE IF / ELSE 
SELECT ENAME, DNO,
    CASE WHEN DNO = 10 THEN 'ȸ���'
         WHEN DNO = 20 THEN '������'
         WHEN DNO = 30 THEN '������'
         WHEN DNO = 40 THEN '���'
         ELSE 'DEFAULT'
              END AS "�μ��̸�"
FROM EMPLOYEE
ORDER BY DNO;

-- �������� 5) ������� �������� ����ϵ� ����� ���� ����� ���ؼ���
-- NULL �� ��� 0�� ���
DESC DEPARTMENT;
SELECT ENAME, JOB, MANAGER, NVL(MANAGER, 0) FROM EMPLOYEE; 

-- �������� 6) DECODE �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �Ͻÿ�.
-- ������ 'ANALYST' �� ����� 200,
-- ������ 'SALESMAN' �� ����� 180,
-- ������ 'MANAGER' �� ����� 150
-- ������ 'CLERK' �� ����� 100
SELECT ENO, ENAME, JOB, SALARY,
    DECODE(JOB, 'ANALYST', SALARY+200,
                'SALESMAN', SALARY+180,
                'MANAGER', SALARY+150,
                'CLERK', SALARY+100,
                SALARY) AS �޿��λ�
           FROM EMPLOYEE
ORDER BY JOB;

-- �׷� �Լ�
-- SUM : ���� �հ踦 ��ȯ
-- AVG : �׷��� ����� ��ȯ
-- COUNT : �׷��� ������ ��ȯ
-- MAX : �׷��� �ִ밪�� ��ȯ
-- MIX : �׷��� �ּҰ��� ��ȯ

SELECT MAX(HIREDATE) AS �ֱ�,
    MIN(HIREDATE) AS ������
    FROM EMPLOYEE;
    
-- �׷��Լ� VS NULL : NULL�� ���������� �����ϰ� �����
SELECT COMMISSION FROM EMPLOYEE;
SELECT SUM(COMMISSION) AS "Ŀ�̼� �Ѿ�"
FROM EMPLOYEE;

-- COUNT : �Ǽ� ����
SELECT COUNT(*)
FROM EMPLOYEE;

-- COMMISSION�� �޴� ����� ���� �˰� ���� 1��
-- �׷��Լ��� NULL�� �����ϱ� ������
-- Ŀ�̼ǹ޴� ��� ������ ���� �� ����.

SELECT COUNT(COMMISSION)
FROM EMPLOYEE;
-- ���� ���� ����
SELECT COUNT(COMMISSION)
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL;

-- Ȱ�� ��)
-- �ߺ����Ե� ��
SELECT COUNT(JOB) AS "��������"
FROM EMPLOYEE;

-- �ߺ����� �ȵ� ��
SELECT COUNT(DISTINCT JOB) AS "��������"
FROM EMPLOYEE;

-- �׷��Լ� ���� �����ؾ� �� ��
-- �Ϲ��÷��� �Բ� ����� �� ����.
SELECT MAX(SALARY)
FROM EMPLOYEE;

-- ** GROUP BY ��
-- �׷��Լ� : �ϳ��� ������� ������(COUNT, MAX, SUM)
-- ����) �μ����� ��� �޿��� �˰������.
-- �߸����� ���� : ENAME -> GROUP BY ���� ���� �÷���
SELECT DNO AS "�μ���ȣ",
--    ENAME,
    TRUNC(AVG(SALARY)) "��� �޿�"
FROM EMPLOYEE
GROUP BY DNO; -- �μ���ȣ�� �׷���

-- ��������) �μ���, ���޺� �ѱ޿��� ����Ͽ� ���.
SELECT 
    DNO, JOB,
    SUM(SALARY) AS �ѱ޿�
    FROM EMPLOYEE
    GROUP BY DNO,JOB
    ORDER BY DNO;

-- GROUP BY ���� ���ǰɱ�
-- �μ����� �޿� �Ѿ��� ���ϴµ� 3000�̻� �Ǵ� �͸� ������ּ���
-- HAVING �׷��Լ� : �׷��Լ��� ���ǰɱ�
SELECT DNO, MAX(SALARY)
FROM EMPLOYEE
GROUP BY DNO
HAVING MAX(SALARY) > 3000;

-- �������� 
-- 1)MANAGER�� �����ϰ� 
-- 2)�޿� �Ѿ��� 5000�̻��� ���޺�
-- �޿� �Ѿ�(SUM)���ϱ�
SELECT JOB,
    SUM(SALARY)
FROM EMPLOYEE
WHERE JOB NOT LIKE '%MANAGER%'
GROUP BY JOB
HAVING SUM(SALARY) > 5000
ORDER BY JOB;

-- ��������1) ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ���.
-- �÷��� ��Ī�� ��� ȭ��� 
SELECT DNO,
MAX(SALARY) AS �ְ��,
MIN(SALARY) AS ������,
SUM(SALARY) AS �Ѿ�,
ROUND(AVG(SALARY)) AS ��ձ޿�
FROM EMPLOYEE
GROUP BY DNO; 

-- ��������2) �� ������ �������� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ���.
SELECT JOB,
MAX(SALARY) AS �ְ��,
MIN(SALARY) AS ������,
SUM(SALARY) AS �Ѿ�,
ROUND(AVG(SALARY)) AS ��ձ޿�
FROM EMPLOYEE
GROUP BY JOB; 

-- ��������3) count(*) �Լ��� �̿��Ͽ� ��� ������ ������ ��� ���� ���.
SELECT JOB,COUNT(*) AS "��� ��"
FROM EMPLOYEE
GROUP BY JOB;

-- ��������4) ������ ���� ����.
SELECT COUNT(MANAGER) AS ������ FROM EMPLOYEE;

-- �������� 5) �޿� �ְ��, �޿� �������� �������.
SELECT MAX(SALARY) - MIN(SALARY) AS ���� FROM EMPLOYEE;

-- �������� 6) ���޺� ����� ���� �޿� ���.
SELECT JOB,
MIN(SALARY)
FROM EMPLOYEE
WHERE JOB NOT LIKE '%NULL%'
GROUP BY JOB
HAVING MIN(SALARY) > 2000
ORDER BY MIN(SALARY) DESC;

-- �������� 7) �� �μ��� ���� �μ���ȣ, �����
-- �μ� ���� ��� ����� ��� �޿��� ���.
SELECT DNO,
        COUNT(*) AS �����,
        ROUND(AVG(SALARY) , 2) AS ��ձ޿�
        FROM EMPLOYEE
        GROUP BY DNO;
-- ��������8) �� �μ��� ���� �μ��̸�, ������, �����
-- �μ��� ����� ��� �޿� ��� ( DECODE, CASE WHEN )
-- �÷���Ī �μ��̸�, ������, �����, ��ձ޿�
SELECT * FROM EMPLOYEE;
-- 1) 1�� DECODE ���� ���ϱ�
-- 2) 2�� DECODE ���ϱ�
SELECT DECODE(DNO, 10, 'ACCOUNTING',
                   20, 'RESEARCH',
                   30, 'SALES',
                   40, 'OPERATIONS') AS �μ��̸�,
       DECODE(DNO, 10, 'NEW YORK',
                   20, 'DALLAS',
                   30, 'CHICAGO',
                   40, 'BOSTON') AS ������,
    COUNT(*) AS �����,
    ROUND(AVG(SALARY),2) AS ��ձ޿�
FROM EMPLOYEE
GROUP BY DNO;

-- ���� *****
-- �����ȣ�� 7788�� ������ �μ����� ?
SELECT DNO
FROM EMPLOYEE
WHERE ENO = 7788;

SELECT DNAME
FROM DEPARTMENT
WHERE DNO = 20;

SELECT *
FROM DEPARTMENT A,
    EMPLOYEE B
    WHERE A.DNO = B.DNO;
