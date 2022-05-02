-- 왼쪽(LEFT) 자리를 특정 기호로 채우는(PAD) 내장함수
-- LPAD(컬럼명, 자리수, 채울문자)
SELECT LPAD(SALARY, 10, '*')
FROM EMPLOYEE;


-- 오른쪽(RIGHT) 자리를 특정 기호로 채우는(PAD) 내장함수

SELECT RPAD(SALARY, 10, '*')
FROM EMPLOYEE;

-- LTRIM(문자열) : 왼쪽 공백 제거
-- RTRIM(문자열) : 오른쪽 공백 제거
-- TRIM(문자열) : 양쪽 공백 제거
SELECT ' Oracle mania',
    LTRIM( ' Oracle mania '),
    RTRIM( ' Oracle mania ')
    FROM DUAL;

SELECT (' Oracle mania '),
    TRIM(' Oracle mania ')  
    FROM DUAL;
    
-- 숫자 함수
-- ROUND : 특정자리수에서 반올림하는 내장 함수
SELECT 98.7654,
    ROUND(98.7654), -- 첫째자리 반올림
    ROUND(98.7654, 2), -- 둘째자리 반올림 (매개변수에 2째자리 지정)
    ROUND(98.7654, -1) -- 정수 1자리 반올림
    FROM DUAL;  
    
-- TRUNC : 특정 자릿수에서 버림
SELECT 98.7654,
    TRUNC(98.7654), -- 첫째 자리에서 버림
    TRUNC(98.7654, 2), -- 둘째 자리에서 버림
    TRUNC(98.7654, -1) -- 정수 1자리 버림 
    FROM DUAL;

-- MOD : 첫번째 값을 두번째 값으로 나눈 나머지 반환
SELECT MOD(31, 2), -- 몫 15 , 나머지 1 (31을, 2로나눔)
    MOD(31, 5),
    MOD(31, 8)
FROM DUAL;

-- 문제 1) 모든사원의 급여를 500으로 나눈나머지를 계속해서 출력
SELECT ENAME, SALARY, MOD(SALARY,500)
    FROM EMPLOYEE;
    
-- 날짜함수
-- 시스템에 저장된 현재 날짜를 반환하는 변수
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

-- 날짜 연산
SELECT SYSDATE - 1 AS 어제,
    SYSDATE AS 오늘,
    SYSDATE + 1 AS 내일
FROM DUAL;

-- 사원들의 현재까지의 근무일수 구하기
-- 단, 실수로 나오면 반올림하기
SELECT ENAME,HIREDATE, ROUND(SYSDATE - HIREDATE) AS 근무일수 FROM EMPLOYEE;

-- 오늘을 기준으로 최초로 도래하는 토요일 구하기
-- NEXT_DAY(날짜, 요일)

SELECT SYSDATE,
    NEXT_DAY(SYSDATE, '토요일')AS "이번주 토요일",
    NEXT_DAY(SYSDATE, 7)AS "숫자로 이번주 토요일"
FROM DUAL;

-- 입사한 날의 마지막 날 구하기
SELECT ENAME, HIREDATE,
    LAST_DAY(HIREDATE)
    FROM EMPLOYEE;
    
-- 자료형 변환 함수
-- TO_CHAR : 날짜형 숫자형을 문자형으로 변환하는 내장함수
-- TO_CHAR(날짜컬럼, 지정포맷) : 날짜를 지정된 포맷을 가진 문자열로 변환
SELECT ENAME, HIREDATE,
    TO_CHAR(HIREDATE, 'YY-MM') AS "년도(2자리)월",
    TO_CHAR(HIREDATE, 'YYYY/MM/DD DAY') AS "년도(4자리)월 일 요일",
    TO_CHAR(HIREDATE, 'YYYY-MM-DD HH24:MI:SS') AS "자주쓰는 포맷"
    FROM EMPLOYEE;

-- TO_CHAR : 숫자를 지정된 포맷을 가진 문자열로 변환
-- L : 각 지역별 통화 기호를 앞에 표시
-- 9 : 자릿수를 나타냄, 자릿수가 맞지 않으면 공간을 채우지않음
-- 0 : 자릿수를 나타냄, 자릿수가 맞지 않으면 0으로 채움
-- , : 천단위 자리 구분을 위해 표시
SELECT ENAME, SALARY,
    TO_CHAR(SALARY, 'L999,999') AS "돈 표시",
     TO_CHAR(SALARY, 'L000,000') AS "돈 표시2"
FROM EMPLOYEE;
    
-- TO_DATE : 문자를 날짜로 변환하는 내장 함수
-- 도전과제1)1981년 2월 20일에 입사한 사원 검색하기
-- 사원테이블 : EMPLOYEE
-- 입사일 : HIREDATE
SELECT ENAME, HIREDATE FROM EMPLOYEE 
WHERE HIREDATE = TO_DATE('19810220' , 'YYYY-MM-DD');

-- 문자를 숫자로 바꾸는 내장 함수
-- TO_NUMBER(문자열숫자, 지정포맷) : 문자열을 지정된포맷의 숫자로 바꾸기
SELECT TO_NUMBER('100,000', '999,999') 
- TO_NUMBER('50,000','999,999') 
FROM DUAL;

-- 연습문제 1) SUBSTR함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력.
SELECT ENAME , SUBSTR(HIREDATE , 1,2) AS 입사년도 
,SUBSTR(HIREDATE , 4,2) AS 입사달  
FROM EMPLOYEE;
-- SELECT 년도 , 달 FROM EMPLOYEE

-- 연습문제 2) SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력
SELECT ENAME, HIREDATE FROM EMPLOYEE WHERE SUBSTR(HIREDATE, 4,2) = '04';

-- 연습문제 3)
-- 사번이 짝수인 사원 출력하기
-- MOD 함수사용

SELECT ENAME, ENO FROM EMPLOYEE WHERE MOD(ENO,2) = 0;

-- 연습문제 4)
-- 올해 며칠이 지났는지 출력하시오. 현재 날짜에서 올해 1월1일 을 뺀 결과를 출력하고,
-- 단, TO_DATE 함수를 사용해서 형을 일치 시켜 계산하시오.
SELECT TRUNC(SYSDATE - TO_DATE('20220101' , 'YYYYMMDD')) FROM EMPLOYEE;

-- 일반 함수
-- NULL 이면 0 또는 다른 값으로 바꾸는 내장 함수
-- NVL(NULL이 포함된 컬럼, 바꿀값) : NULL이면 0 또는 다른 값으로 바꾸는 내장함수
SELECT ENAME, SALARY,
    COMMISSION,
    NVL(COMMISSION, 0) AS "보너스",
    SALARY * 12 + NVL(COMMISSION,0) AS "연봉"
    FROM EMPLOYEE
    ORDER BY JOB;

-- NVL2 (컬럼값, 표현식1, 표현식2)
-- 컬럼값이 NULL 이면 표현식2을 반환 , NULL이 아니면 표현식1를 반환
SELECT ENAME, SALARY, COMMISSION,
    NVL2(COMMISSION, SALARY*12+COMMISSION, SALARY*12) FROM EMPLOYEE
    ORDER BY JOB;
    
-- NULLIF (표현식1, 표현식2)
-- 표현식1 == 표현식2 NULL 출력
-- 아니면 표현식 1을 출력
SELECT NULLIF('A', 'A'),
    NULLIF('A', 'B')
    FROM DUAL;
    
-- 오라클에서 IF/ ELSE IF/ ELSE 방법
-- DECODE(표현식, 조건1, 결과1,
--               조건2, 결과2,
--               조건3, 결과3,
--               조건4, 결과4,
--               기본결과(DEFUALT)
SELECT ENAME, DNO,
    DECODE(DNO, 10, '회계부',
                20, '연구소',
                30, '영업부',
                40, '운영팀',
                'DEFAULT') AS "부서이름"
FROM EMPLOYEE
ORDER BY DNO;

-- 또다른 방식 IF / ELSE IF / ELSE 
SELECT ENAME, DNO,
    CASE WHEN DNO = 10 THEN '회계부'
         WHEN DNO = 20 THEN '연구소'
         WHEN DNO = 30 THEN '영업부'
         WHEN DNO = 40 THEN '운영팀'
         ELSE 'DEFAULT'
              END AS "부서이름"
FROM EMPLOYEE
ORDER BY DNO;

-- 연습문제 5) 사원들의 상관사번을 출력하되 상관이 없는 사원에 대해서는
-- NULL 값 대신 0을 출력
DESC DEPARTMENT;
SELECT ENAME, JOB, MANAGER, NVL(MANAGER, 0) FROM EMPLOYEE; 

-- 연습문제 6) DECODE 함수로 직급에 따라 급여를 인상하도록 하시오.
-- 직급이 'ANALYST' 인 사원은 200,
-- 직급이 'SALESMAN' 인 사원은 180,
-- 직급이 'MANAGER' 인 사원은 150
-- 직급이 'CLERK' 인 사원은 100
SELECT ENO, ENAME, JOB, SALARY,
    DECODE(JOB, 'ANALYST', SALARY+200,
                'SALESMAN', SALARY+180,
                'MANAGER', SALARY+150,
                'CLERK', SALARY+100,
                SALARY) AS 급여인상
           FROM EMPLOYEE
ORDER BY JOB;

-- 그룹 함수
-- SUM : 누적 합계를 반환
-- AVG : 그룹의 평균을 반환
-- COUNT : 그룹의 개수를 반환
-- MAX : 그룹의 최대값을 반환
-- MIX : 그룹의 최소값을 반환

SELECT MAX(HIREDATE) AS 최근,
    MIN(HIREDATE) AS 오래전
    FROM EMPLOYEE;
    
-- 그룹함수 VS NULL : NULL은 내부적으로 제외하고 계산함
SELECT COMMISSION FROM EMPLOYEE;
SELECT SUM(COMMISSION) AS "커미션 총액"
FROM EMPLOYEE;

-- COUNT : 건수 세기
SELECT COUNT(*)
FROM EMPLOYEE;

-- COMMISSION을 받는 사원의 수를 알고 싶은 1인
-- 그룹함수는 NULL을 제외하기 때문에
-- 커미션받는 사람 개수를 구할 수 있음.

SELECT COUNT(COMMISSION)
FROM EMPLOYEE;
-- 위와 동일 문법
SELECT COUNT(COMMISSION)
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL;

-- 활용 예)
-- 중복포함된 값
SELECT COUNT(JOB) AS "직업개수"
FROM EMPLOYEE;

-- 중복포함 안된 값
SELECT COUNT(DISTINCT JOB) AS "직업개수"
FROM EMPLOYEE;

-- 그룹함수 사용시 주의해야 할 것
-- 일반컬럼과 함께 사용할 수 없다.
SELECT MAX(SALARY)
FROM EMPLOYEE;

-- ** GROUP BY 절
-- 그룹함수 : 하나의 결과값을 보여줌(COUNT, MAX, SUM)
-- 예시) 부서별로 평균 급여를 알고싶을때.
-- 잘못쓰임 예시 : ENAME -> GROUP BY 절에 없는 컬럼임
SELECT DNO AS "부서번호",
--    ENAME,
    TRUNC(AVG(SALARY)) "평균 급여"
FROM EMPLOYEE
GROUP BY DNO; -- 부서번호로 그룹핑

-- 도전과제) 부서별, 직급별 총급여를 계산하여 출력.
SELECT 
    DNO, JOB,
    SUM(SALARY) AS 총급여
    FROM EMPLOYEE
    GROUP BY DNO,JOB
    ORDER BY DNO;

-- GROUP BY 절에 조건걸기
-- 부서별로 급여 총액을 구하는데 3000이상 되는 것만 출력해주세요
-- HAVING 그룹함수 : 그룹함수에 조건걸기
SELECT DNO, MAX(SALARY)
FROM EMPLOYEE
GROUP BY DNO
HAVING MAX(SALARY) > 3000;

-- 도전과제 
-- 1)MANAGER를 제외하고 
-- 2)급여 총액이 5000이상인 직급별
-- 급여 총액(SUM)구하기
SELECT JOB,
    SUM(SALARY)
FROM EMPLOYEE
WHERE JOB NOT LIKE '%MANAGER%'
GROUP BY JOB
HAVING SUM(SALARY) > 5000
ORDER BY JOB;

-- 연습문제1) 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력.
-- 컬럼의 별칭은 결과 화면과 
SELECT DNO,
MAX(SALARY) AS 최고액,
MIN(SALARY) AS 최저액,
SUM(SALARY) AS 총액,
ROUND(AVG(SALARY)) AS 평균급여
FROM EMPLOYEE
GROUP BY DNO; 

-- 연습문제2) 각 담당업무 유형별로 급여 최고액, 최저액, 총액 및 평균액을 출력.
SELECT JOB,
MAX(SALARY) AS 최고액,
MIN(SALARY) AS 최저액,
SUM(SALARY) AS 총액,
ROUND(AVG(SALARY)) AS 평균급여
FROM EMPLOYEE
GROUP BY JOB; 

-- 연습문제3) count(*) 함수를 이용하여 담당 업무가 동일한 사원 수를 출력.
SELECT JOB,COUNT(*) AS "사원 수"
FROM EMPLOYEE
GROUP BY JOB;

-- 연습문제4) 관리자 수를 나열.
SELECT COUNT(MANAGER) AS 관리자 FROM EMPLOYEE;

-- 연습문제 5) 급여 최고액, 급여 최저액의 차액출력.
SELECT MAX(SALARY) - MIN(SALARY) AS 차액 FROM EMPLOYEE;

-- 연습문제 6) 직급별 사원의 최저 급여 출력.
SELECT JOB,
MIN(SALARY)
FROM EMPLOYEE
WHERE JOB NOT LIKE '%NULL%'
GROUP BY JOB
HAVING MIN(SALARY) > 2000
ORDER BY MIN(SALARY) DESC;

-- 연습문제 7) 각 부서에 대해 부서번호, 사원수
-- 부서 내의 모든 사원의 평균 급여를 출력.
SELECT DNO,
        COUNT(*) AS 사원수,
        ROUND(AVG(SALARY) , 2) AS 평균급여
        FROM EMPLOYEE
        GROUP BY DNO;
-- 연습문제8) 각 부서에 대해 부서이름, 지역명, 사원수
-- 부서별 사원의 평균 급여 출력 ( DECODE, CASE WHEN )
-- 컬럼별칭 부서이름, 지역명, 사원수, 평균급여
SELECT * FROM EMPLOYEE;
-- 1) 1차 DECODE 빼고 구하기
-- 2) 2차 DECODE 구하기
SELECT DECODE(DNO, 10, 'ACCOUNTING',
                   20, 'RESEARCH',
                   30, 'SALES',
                   40, 'OPERATIONS') AS 부서이름,
       DECODE(DNO, 10, 'NEW YORK',
                   20, 'DALLAS',
                   30, 'CHICAGO',
                   40, 'BOSTON') AS 지역명,
    COUNT(*) AS 사원수,
    ROUND(AVG(SALARY),2) AS 평균급여
FROM EMPLOYEE
GROUP BY DNO;

-- 조인 *****
-- 사원번호가 7788인 직원의 부서명은 ?
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
