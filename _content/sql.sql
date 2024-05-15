select 고객번호,주소 from 고객;
select 도시,지역 from 고객;
select * from 고객;
select * from 고객 where 지역='강원도';
select 고객번호,담당자명,마일리지 AS 포인트,마일리지 * 1.1 AS "10%인상된 마일리지" from 고객; 
select 고객번호,담당자명,마일리지 from 고객 where 마일리지 >= 100000;
select 고객번호,담당자명,도시,마일리지 AS 포인트 FROM 고객 WHERE 도시 = '서울특별시' ORDER BY 마일리지 ASC;
select 고객번호 as 번호 from 고객;
select 고객회사명,마일리지 as 포인트,담당자명 from 고객 where 담당자직위='영업 사원' order by 지역 ASC;
select distinct 도시 from 고객;
select distinct 도시 from 고객;
select 23+5 as 더하기,23-5 as 빼기,23*5 as 곱하기,23/5 as 실수나누기, 23 div 5 as 정수나누기, 23 % 5 as 나머지1, 23 mod 5 as 나머지2;
select 25>= 3 as 비교연산,23 <= 5 as 비교연산, 23 > 23 as 비교연산, 23 < 23 as 비교연산, 23=23 as 비교연산,23!=23 as 비교연산,23<>23 as 비교연산;
select * from 고객 where 담당자직위 <> '대표 이사';
select 담당자명 from 고객 where 도시 = '서울특별시' and 마일리지 >10000;
select * from 고객 where 도시 = '부산광역시' and 마일리지 < 1000;
select 고객회사명 from 고객 where 도시 = '대전광역시' and 마일리지 >500;
select 고객번호,담당자명,마일리지,도시 from 고객 where 도시 = '부산광역시' 
union 
select 고객번호,담당자명,마일리지,도시 from 고객 where 마일리지 < 1000;
select 고객번호,담당자명,마일리지,도시 from 고객 where 마일리지 < 1000 or 도시 = '부산광역시';
select * from 고객 where 지역 is null;
select * from 고객 where 지역='';
update 고객 set 지역 = null 
where 지역 = '';
select * from 고객 where 지역 is null;
select 고객번호,담당자명,담당자직위 from 고객 where 담당자직위 = '영업 과장' or 담당자직위 = '마케팅 과장';
select 고객번호,담당자명,담당자직위 from 고객 where 담당자직위 in ('영업 과장','마케팅 과장');
select 담당자명,마일리지 from 고객 where 마일리지 >=100000 and 마일리지 <= 200000;
select 담당자명,마일리지 from 고객 where 마일리지 between 100000 and 200000;
select * from 고객 where 도시 like '%광역시' and (고객번호 like '_C%' or 고객번호 like '__C%');
select * from 고객 where 도시 = '서울특별시' and 마일리지 between 15000 and 20000;
select distinct 지역,도시 from 고객 order by 지역;
select * from 고객 where 도시 in('춘천시','과천시','광명시') and (담당자직위 like '%이사' or 담당자직위 like '%사원');
select * from 고객 where not (도시 like '%광역시' or 도시 like '%특별시') order by 마일리지 DESC limit 3;
select * from 고객 where 지역 <> '' and 담당자직위 <> '대표 이사';

select char_length('Hello'),length('Hello'),char_length('안녕'),length('안녕');
select concat('Dreams ','Come ','True'),concat_ws('-','2024','05','09');
select left('SQL 완전정복',2),right('SQL 완전정복',5),substr('SQL 완전정복',5,1),substr('SQL 완전정복',3);
select substring_index('서울시 동작구 흑석로',' ',2),substring_index('서울시 동작구 흑석로',' ',-2);
select lpad('SQL',10,'%'),rpad('SQL',5,'#');
SELECT LENGTH(LTRIM(' SQL ')),LENGTH(RTRIM(' SQL ')),LENGTH(TRIM(' SQL '));
SELECT TRIM(BOTH 'abc' FROM 'abcSQLabcabc'),TRIM(LEADING 'abc' FROM 'abcSQLabcabc'),TRIM(TRAILING 'abc' FROM 'abcSQLabcabc');
select field('sql','SQL','JAVA','C'),find_in_set('c','SQL,JAVA,C'),instr('네 인생을 살아라','을'),locate('살아','네 인생을 살아라');
select elt(3,'SQL','JAVA','C');
select repeat('*',5);
select replace('010.1234.5678','.','-');
select reverse('OLLEH');

select ceiling(123.56),floor(123.56),round(123.56),round(123.56,1),truncate(123.56,1);
select abs(-120),abs(120),sign(-120),sign(120);
select mod(203,4),203 % 4,203 mod 4;
select power(2,3),sqrt(16),rand(),rand(100),round(rand()*100);
select now(),sysdate(),curdate(),curtime();
select now(),year(now()),quarter(now()),month(now()),day(now()),hour(now()),minute(now()),second(now());

select now(),datediff('2025-12-20',now()),datediff(now(),'2025-12-20'),timestampdiff(year,now(),'2025-12-20'),timestampdiff(month,now(),'2025-12-20'),timestampdiff(day,now(),'2025-12-20');
select now(),adddate(now(),50),adddate(now(),interval 50 day),adddate(now(),interval 50 month),adddate(now(),interval 50 hour);
select now(),last_day(now()),dayofyear(now()),monthname(now()),weekday(now());

select cast('1' as unsigned),cast(2 as char(1)),convert('1',unsigned),convert(2,char(1));
select if(12500 *450 > 5000000,'초과달성','미달성');
select ifnull(1,0),ifnull(null,0),ifnull(1/0,'ok');
select nullif(12*10,120),nullif(12*10,1200);

/* 1 */
select 고객회사명,전화번호,
concat(repeat('*',2),substr(고객회사명,3)) as 고객회사명2,
trim(leading '(' from replace(전화번호,')','-')) as 전화번호2 from 고객;

/* 2 */
select * ,truncate((주문수량*단가),-1) as 주문금액,
truncate((주문수량*단가*할인율),-1) as 할인금액,
truncate(((주문수량*단가)-(주문수량*단가*할인율)),-1) as 실주문금액 
from 주문세부;

/* 3 */
select *,
adddate(입사일,interval 500 day) as 500일후, 
timestampdiff(day,입사일,now()) as 입사일수 from 사원;

/* 4 */
select *,if(도시 like '%특별시' or 도시 like '%광역시','대도시','도시') as 도시구분,
case when 마일리지 >= 100000 then 'VVIP고객' 
when 마일리지 >= 10000 then 'VIP고객'
else '일반고객'
end as 마일리지구분
from 고객;

/* 5 */ 
 select 주문번호,고객번호,주문일,year(주문일) as 주문년도,quarter(주문일) as 주문분기,
 month(주문일) as 주문월,day(주문일) as 주문일,
 weekday(주문일) as 주문요일,
 case when weekday(주문일) = 0 then '월'
 when weekday(주문일) = 1 then '화'
 when weekday(주문일) = 2 then '수'
 when weekday(주문일) = 3 then '목'
 when weekday(주문일) = 4 then '금'
 when weekday(주문일) = 5 then '토'
 else '일'
 end as 한글요일
 from 주문;
 
 select * from 고객;
 
 /* 6 */
 select *,timestampdiff(day,요청일,발송일) as 지연일수 from 주문 
 where timestampdiff(day,요청일,발송일) >= 7 order by 지연일수;
 
 select count(*),count(고객번호),count(도시),count(지역) from 고객;
 select sum(마일리지),avg(마일리지),min(마일리지),max(마일리지) from 고객;
 select sum(마일리지),avg(마일리지),min(마일리지),max(마일리지) from 고객 where 도시 = '서울특별시';
 select 도시,count(*) as 고객수,avg(마일리지) as 평균마일리지 from 고객 group by 도시;
 select 도시,count(*) as 고객수,avg(마일리지) as 평균마일리지 from 고객 group by 1;
 select 담당자직위,도시,count(*) as 고객수,avg(마일리지) as 평균마일리지 from 고객 group by 담당자직위,도시 order by 1, 2 ; 
 select 도시,count(*) as 고객수,avg(마일리지) as 평균마일리지 from 고객 group by 도시 having count(*) >= 10;
 select 도시,sum(마일리지) as 마일리지합 from 고객 where 고객번호 like 'T%' group by 도시 having sum(마일리지)>=1000;
 
 select 도시,count(*) as 고객수,avg(마일리지) as 평균마일리지 from 고객 where 지역 is null group by 도시 with rollup;
 select ifnull(도시,'총계') as 도시,count(*) as 고객수,avg(마일리지) as 평균마일리지 from 고객 where 지역 is null group by 도시 with rollup;
 select 담당자직위,ifnull(도시,'합계') as 도시,count(*) as 고객수 from 고객 where 담당자직위 like '%마케팅%' group by 담당자직위,도시 with rollup;
 
select 지역,count(*) as 고객수 from 고객 where 담당자직위 = '대표 이사' group by 지역 with rollup;
 select 지역,count(*) as 고객수,grouping(지역) as 구분 from 고객 where 담당자직위 = '대표 이사' group by 지역 with rollup;
select group_concat(이름) from 사원;
select group_concat(distinct 지역) from 고객;
select 도시,group_concat(고객회사명) as 고객회사명목록 from 고객 group by 도시;

/* 1 */
select count(도시), count(distinct 도시) from 고객;

/* 2 */
select year(주문일) as 주문년도,count(주문일) as 주문건수 from 주문 group by year(주문일);

/* 3 */
select year(주문일) as 주문년도,quarter(주문일) as 분기,count(quarter(주문일)) as 주문건수 from 주문 group by 주문년도,분기 with rollup;

/* 4 */
select timestampdiff(day,요청일,발송일) from 주문;
select month(주문일) as 주문월,count(*) as 주문건수 from 주문 where timestampdiff(day,요청일,발송일)>=1 group by 1 order by 1;

/* 5 */
select * from 제품;
select 제품명,SUM(재고) as 재고합 from 제품 group by 제품명,재고 having 제품명 like '%아이스크림';
select 제품명,sum(재고) as 재고합 from 제품 where 제품명 like '%아이스크림' group by 제품명,재고;

/* 6 */
select * from 고객;
select if(마일리지 >= 50000,'VIP고객','일반고객') as 고객구분,count(*) as 고객수,
avg(마일리지) as 평균마일리지 from 고객 group by 고객구분;

SELECT 부서.부서번호,부서명,이름,사원.부서번호 FROM 부서
CROSS JOIN 사원 WHERE 이름 = '이소미';
SELECT 사원번호,직위,사원.부서번호,부서명 FROM 사원
INNER JOIN 부서
ON 사원.부서번호 = 부서.부서번호
WHERE 이름 = '이소미';

SELECT 고객.고객번호,담당자명,고객회사명,COUNT(*) AS 주문건수 FROM 고객
INNER JOIN 주문
ON 고객.고객번호 = 주문.고객번호
GROUP BY 고객.고객번호,담당자명,고객회사명
ORDER BY COUNT(*) DESC;

SELECT * FROM 고객;
SELECT * FROM 주문세부;
SELECT 고객.고객번호,담당자명,고객회사명,SUM(주문수량 * 단가) AS 주문금액합 FROM 고객
INNER JOIN 주문
ON 고객.고객번호 = 주문.고객번호
INNER JOIN 주문세부
ON 주문.주문번호 = 주문세부.주문번호
GROUP BY 고객.고객번호, 담당자명, 고객회사명
ORDER BY 4 DESC;

SELECT 고객번호,담당자명,마일리지,등급.* FROM 고객
CROSS JOIN 마일리지등급 AS 등급
WHERE 담당자명 = '이은광';

SELECT 고객번호,고객회사명,담당자명,마일리지,등급명 FROM 고객
INNER JOIN 마일리지등급사원
ON 마일리지 >= 하한마일리지
AND 마일리지 <= 상한마일리지
WHERE 담당자명 = '이은광';

SELECT 사원번호,이름,부서명 FROM 사원
LEFT OUTER JOIN 부서
ON 사원.부서번호 = 부서.부서번호
WHERE 성별 = '여';

SELECT 부서명,사원.* FROM 부서
LEFT OUTER JOIN 사원
ON 사원.부서번호 = 부서.부서번호
WHERE 사원.부서번호 IS NULL;

SELECT 이름,부서.* FROM 사원
LEFT OUTER JOIN 부서
ON 사원.부서번호 = 부서.부서번호
WHERE 부서.부서번호 IS NULL;

SELECT 사원.사원번호,사원.이름,사원.사원번호 AS '상사의 사원번호',상사.이름 AS '상사의 이름' FROM 사원
INNER JOIN 사원 AS 상사
ON 사원.상사번호 = 사원.상사번호;

SELECT 사원.이름 AS 이름, 사원.직위, 상사.이름 AS 상사이름 FROM 사원 AS 상사
RIGHT OUTER JOIN 사원
ON 사원.사원번호 = 상사.사원번호
ORDER BY 상사이름;

/* 1 */
SELECT 단가 FROM 주문세부;
SELECT * FROM 제품;

SELECT 제품명,SUM(주문수량) AS 주문수량합,SUM(주문수량*주문세부.단가) AS 주문금액합 FROM 제품
LEFT OUTER JOIN 주문세부
ON 제품.제품번호 = 주문세부.제품번호
GROUP BY 제품명;


/* 2 */
SELECT * FROM 주문;

SELECT year(주문일) AS 주문년도,제품명,SUM(주문수량) AS 주문수량합 FROM 주문
INNER JOIN 주문세부
ON 주문.주문번호 = 주문세부.주문번호
INNER JOIN 제품
ON 주문세부.제품번호 = 제품.제품번호
WHERE 제품명 LIKE '%아이스크림'
GROUP BY 주문년도,제품명;

/* 3 */
SELECT 제품명,SUM(주문수량) AS 주문수량합 FROM 제품
LEFT OUTER JOIN 주문세부
ON 제품.제품번호 = 주문세부.제품번호
GROUP BY 제품명
ORDER BY 2 DESC;

/* 4 */
SELECT * FROM 마일리지등급;

SELECT 고객번호,고객회사명,담당자명,마일리지,등급명 FROM 고객
INNER JOIN 마일리지등급
ON 고객.마일리지 >= 하한마일리지
AND 고객.마일리지 <= 99999
WHERE 등급명 = 'A'
ORDER BY 4 DESC;

SELECT MAX(마일리지) FROM 고객;
SELECT 고객번호,고객회사명,담당자명,마일리지 FROM 고객 WHERE 마일리지 = (SELECT MAX(마일리지) FROM 고객);
SELECT * FROM 고객;
SELECT * FROM 주문;
SELECT 고객번호 FROM 주문 WHERE 주문번호 = 'H0250';
SELECT 고객회사명,담당자명,주소,전화번호 FROM 고객 WHERE 고객번호 = (SELECT 고객번호 FROM 주문 WHERE 주문번호 = 'H0250');
SELECT 고객회사명,담당자명,주소,전화번호 FROM 고객 INNER JOIN 주문 ON 고객.고객번호 = 주문.고객번호
WHERE 주문번호 = 'H0250';
SELECT MIN(마일리지) FROM 고객 WHERE 도시 = '부산광역시';
SELECT 담당자명,고객회사명,마일리지 FROM 고객 WHERE 마일리지 > (SELECT MIN(마일리지) FROM 고객 WHERE 도시 = '대전광역시');
SELECT * FROM 고객;

SELECT COUNT(*) AS 주문건수 FROM 주문 WHERE 고객번호 IN (SELECT 고객번호 FROM 고객 WHERE 도시='부산광역시');
SELECT 고객번호 FROM 고객 WHERE 도시='부산광역시';
SELECT 마일리지 FROM 고객 WHERE 도시 = '부산광역시';
SELECT 담당자명,고객회사명,마일리지 FROM 고객 WHERE 마일리지 > ANY(SELECT 마일리지 FROM 고객 WHERE 도시='부산광역시');
SELECT AVG(마일리지),지역 FROM 고객 GROUP BY 지역;
SELECT 담당자명,고객회사명,마일리지 FROM 고객 WHERE 마일리지 > ALL (SELECT AVG(마일리지) FROM 고객 GROUP BY 지역);

/* 6-7 */
SELECT * FROM 고객;
SELECT * FROM 주문;
SELECT 고객회사명,전화번호,주소 FROM 고객 INNER JOIN 주문
ON 고객.고객번호 = 주문.고객번호;

SELECT 고객.고객번호,고객회사명,주소,전화번호 FROM 고객 WHERE EXISTS (SELECT 고객회사명,전화번호,주소 FROM 고객 INNER JOIN 주문
ON 고객.고객번호 = 주문.고객번호);

SELECT 고객번호,고객회사명,주소,전화번호 FROM 고객 WHERE 고객번호 IN (SELECT distinct 고객번호 FROM 주문);

SELECT DISTINCT 고객.고객번호,고객회사명,주소,전화번호 FROM 고객 INNER JOIN 주문
ON 고객.고객번호 = 주문.고객번호;

/* 단 한번이라도 주문한 적 없는 고객정보 */
SELECT * FROM 주문;
SELECT DISTINCT 고객.고객번호,고객회사명,주소,전화번호 FROM 고객 LEFT OUTER JOIN 주문
ON 고객.고객번호 = 주문.고객번호
WHERE 주문.주문번호 IS NULL;

SELECT 도시,AVG(마일리지) AS 평균마일리지 FROM 고객 GROUP BY 도시 HAVING AVG(마일리지) > (SELECT AVG(마일리지) FROM 고객);
SELECT 도시,AVG(마일리지) AS 도시_평균마일리지 FROM 고객 GROUP BY 도시;

SELECT 담당자명,고객회사명,마일리지,고객.도시,도시_평균마일리지,도시_평균마일리지 - 마일리지 AS 차이 FROM 고객,
(SELECT 도시,AVG(마일리지) AS 도시_평균마일리지 FROM 고객 GROUP BY 도시) AS 도시별요약
WHERE 고객.도시 = 도시별요약.도시;

SELECT * FROM 주문;
SELECT 고객번호,MAX(주문일) FROM 주문 GROUP BY 고객번호;
SELECT 고객번호,담당자명,(SELECT MAX(주문일) FROM 주문 WHERE 주문.고객번호 = 고객.고객번호) AS 최종주문일 FROM 고객;

SELECT 도시,AVG(마일리지) AS 평균마일리지 FROM 고객 GROUP BY  도시 HAVING AVG(마일리지) > (SELECT AVG(마일리지) FROM 고객);

SELECT 도시,AVG(마일리지) AS 도시_평균마일리지 FROM 고객 GROUP BY 도시;
SELECT 담당자명,고객회사명,마일리지,고객.도시,도시_평균마일리지,도시_평균마일리지 - 마일리지 AS 차이 FROM 고객,
(SELECT 도시,AVG(마일리지) AS 도시_평균마일리지 FROM 고객 GROUP BY 도시) AS 도시별요약 WHERE 고객.도시=도시별요약.도시;

SELECT 고객번호,담당자명,(SELECT MAX(주문일) FROM 주문 WHERE 주문.고객번호 = 고객.고객번호) AS 최종주문일 FROM 고객;

WITH 도시별요약 AS(
SELECT 도시,AVG(마일리지) AS 도시_평균마일리지 FROM 고객 GROUP BY 도시)
SELECT 담당자명,고객회사명,마일리지,고객.도시,도시_평균마일리지,도시_평균마일리지 - 마일리지 AS 차이 FROM 고객,도시별요약
WHERE 고객.도시 = 도시별요약.도시;

SELECT 사원.사원번호,사원.이름 FROM 사원 INNER JOIN 사원 AS 상사;

SELECT 사원번호,이름,상사번호,(SELECT 이름 FROM 사원 AS 상사 WHERE 상사.사원번호 = 사원.상사번호) AS 상사이름 FROM 사원;

/* 1 */
SELECT * FROM 사원;
SELECT * FROM 부서;
SELECT 부서번호 FROM 사원 WHERE 이름 = '배재용';
SELECT 부서명 FROM 부서 WHERE 부서번호 IN (SELECT 부서번호 FROM 사원 WHERE 이름 = '배재용');

/* 2 */
SELECT * FROM 제품;
SELECT * FROM 주문세부;
SELECT 제품번호,제품명,포장단위,단가,재고,SUM(재고*단가) AS 재고금액 FROM 제품
WHERE 제품번호 NOT IN (SELECT 제품번호 FROM 주문세부)
GROUP BY 제품번호;

SELECT DISTINCT 제품.제품번호,제품명,포장단위,제품.단가,재고,SUM(제품.재고 * 제품.단가) AS 재고금액 FROM 제품 LEFT OUTER JOIN 주문세부
ON 제품.제품번호 = 주문세부.제품번호
WHERE 주문수량 IS NULL
GROUP BY 제품번호;

SELECT DISTINCT 제품.제품번호,제품명,포장단위,단가,재고,SUM(재고 * 단가) AS 재고금액 FROM 제품 
WHERE EXISTS (SELECT * FROM 주문세부 WHERE 제품번호 = 주문세부.제품번호)
GROUP BY 제품번호;

SELECT 고객.고객번호,고객회사명,주소,전화번호 FROM 고객 WHERE EXISTS (SELECT 고객회사명,전화번호,주소 FROM 고객 INNER JOIN 주문
ON 고객.고객번호 = 주문.고객번호);
/* 3 */
SELECT * FROM 고객;
SELECT * FROM 주문;
SELECT MAX(주문일) FROM 주문;
SELECT MIN(주문일) FROM 주문;
SELECT COUNT(*) FROM 주문;
SELECT 담당자명,고객회사명,(SELECT COUNT(*) FROM 주문 WHERE 주문.고객번호 = 고객.고객번호) AS 주문건수,
(SELECT MIN(주문일) FROM 주문 WHERE 주문.고객번호 = 고객.고객번호) AS 최초주문일,
(SELECT MAX(주문일) FROM 주문 WHERE 주문.고객번호 = 고객.고객번호) AS 최종주문일 FROM 고객
WHERE (SELECT MIN(주문일) FROM 주문 WHERE 주문.고객번호 = 고객.고객번호) IS NOT NULL;

INSERT INTO 부서 VALUES('A5','마케팅부');
SELECT * FROM 부서;

INSERT INTO 제품(제품번호,제품명,단가,재고) VALUES(90,'연어핫소스',4000,50);
INSERT INTO 제품 VALUES(91,'연어피클소스',NULL,5000,40);
SELECT * FROM 제품;
INSERT INTO 사원(사원번호,이름,직위,성별,입사일)
VALUES('E20','김사과','수습사원','남',CURDATE())
,('E21','박바나나','수습사원','여',CURDATE())
,('E22','정오렌지','수습사원','여',CURDATE());
SELECT * FROM 사원;
UPDATE 사원 SET 이름='김레몬' WHERE 사원번호 = 'E20';
UPDATE 제품 SET 포장단위='200ML BOTTLES' WHERE 제품번호 = 91;
UPDATE 제품 SET 단가 = 단가*1.1,재고 = 재고-10 WHERE 제품번호 =91;
DELETE FROM 제품 WHERE 제품번호 = 91;
DELETE FROM 사원 ORDER BY 입사일 DESC LIMIT 3;
SELECT * FROM 사원 WHERE 이름 IN('김레몬','박바나나','정오렌지');
INSERT INTO 제품(제품번호, 제품명,단가,재고)
VALUES(91,'연어피클소스',6000,50)
ON DUPLICATE KEY UPDATE
제품명 = '연어피클핫소스',단가=6000,재고=50;

CREATE TABLE 고객주문요약
(
고객번호 CHAR(5) PRIMARY KEY
,고객회사명 VARCHAR(50)
,주문건수 INT
,최종주문일 DATE
);

SELECT * FROM 고객주문요약;

INSERT INTO 고객주문요약
SELECT 고객.고객번호,고객회사명,COUNT(*),MAX(주문일) FROM 고객,주문 WHERE 고객.고객번호 = 주문.고객번호 
GROUP BY 고객.고객번호,고객회사명;

SELECT * FROM 제품;
UPDATE 제품 SET 단가 = (SELECT * FROM (SELECT AVG(단가) FROM 제품 WHERE 제품명 LIKE '%소스%') AS T) WHERE 제품번호 = 91;

SELECT DISTINCT 고객번호 FROM 주문;
UPDATE 고객,(SELECT DISTINCT 고객번호 FROM 주문) AS 주문고객 SET 마일리지 = 마일리지 * 1.1  WHERE 고객.고객번호 IN (주문고객.고객번호);
SELECT * FROM 고객 WHERE 고객번호 IN (SELECT DISTINCT 고객번호 FROM 주문);

SELECT * FROM 고객 INNER JOIN 마일리지등급 ON 마일리지 BETWEEN 하한마일리지 AND 상한마일리지
WHERE 등급명 = 'S';
UPDATE 고객 INNER JOIN 마일리지등급 ON 마일리지 BETWEEN 하한마일리지 AND 상한마일리지 SET 마일리지 = 마일리지 +1000
WHERE 등급명 = 'S';

SELECT * FROM 주문 WHERE 주문번호 NOT IN(SELECT DISTINCT 주문번호 FROM 주문세부);
DELETE FROM 주문 WHERE 주문번호 NOT IN(SELECT DISTINCT 주문번호 FROM 주문세부); 

SELECT * FROM 주문 WHERE 주문번호 = 'H0248';
SELECT * FROM 주문세부 WHERE 주문번호 = 'H0248';

SELECT * FROM 주문 INNER JOIN 주문세부 ON 주문.주문번호 = 주문세부.주문번호 WHERE 주문.주문번호 = 'H0248';
DELETE 주문,주문세부 FROM 주문 INNER JOIN 주문세부 ON 주문.주문번호 = 주문세부.주문번호 WHERE 주문.주문번호 = 'H0248';

SELECT 고객.* FROM 고객 LEFT OUTER JOIN 주문 ON 고객.고객번호 = 주문.고객번호 WHERE 주문.고객번호 IS NULL;
DELETE 고객 FROM 고객 LEFT OUTER JOIN 주문 ON 고객.고객번호 = 주문.고객번호 WHERE 주문.고객번호 IS NULL;