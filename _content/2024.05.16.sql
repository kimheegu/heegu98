use 한빛무역;

/* 9-1 */
create or replace view view_사원 
as select 이름,집전화 as 전화번호,입사일,주소 from 사원;

create or replace view view_사원(이름,전화번호,입사일,주소)
as select 이름,집전화,입사일,주소 from 사원;

select * from view_사원;

/* 9-2 */
create or replace view view_제품별주문수량합
as select 제품명,sum(주문수량) as 주문수량합 from 제품
inner join 주문세부 on 제품.제품번호 = 주문세부.제품번호 group by 제품명;

select * from view_제품별주문수량합;

/* 9-3 */
create or replace view view_사원_여
as select 이름,집전화 as 전화번호,입사일,주소,성별 from 사원 where 성별='여';

select * from view_사원_여;

/* 9-4 */
select * from view_사원_여 where 전화번호 like '%88%';

/* 9-5 */
select * from view_제품별주문수량합 where 주문수량합 >= 1200;

/* 9-6 */
select * from information_schema.views where table_name = 'view_사원';
show create view view_사원;

/* 9-7 */
drop view view_사원;

/* 9-8 */
insert into view_사원_여(이름,전화번호,입사일,주소,성별) values('황여름','(02)587-4989','2023-02-10','서울시 강남구 청담동 23-5','여');

create or replace view view_사원_여
as select 사원번호,이름,집전화 as 전화번호,입사일,주소,성별 from 사원 where 성별='여';

insert into view_사원_여(사원번호,이름,전화번호,입사일,주소,성별) 
values('E13','황여름','(02)587-4989','2023-02-10','서울시 강남구 청담동 23-5','여');

select * from 사원;
select * from view_사원_여 where 사원번호='E13';

/* 9-9 (단일 테이블이 아닐때(조인,함수 사용)는 원천 테이블에 들어갈 수도 있고,안들어 갈 수도 있다.)*/
insert into view_제품별주문수량합 values('단짠 새우깡',250);

/* 9-10 */
insert into view_사원_여(사원번호,이름,입사일,주소,성별)
values('E12','강겨울','2023-02-10','서울시 성북구 장위동 123-7','남');
select * from view_사원_여 where 사원번호='E12';
select * from 사원 where 사원번호='E12';

create or replace view view_사원_여
as select 사원번호,이름,집전화 as 전화번호,입사일,주소,성별 from 사원 where 성별 ='여' with check option;

insert into view_사원_여(사원번호,이름,성별) values('E14','유봄','남');
update view_사원_여 set 성별='남' where 이름='황여름';

/* 9-11 */
create table 날씨
(
년도 int,
월 int,
일 int,
도시 varchar(20),
기온 numeric(3,1),
습도 int,
primary key(년도,월,일,도시),
index 기온인덱스(기온),
index 도시인덱스(도시)
);

/* 인덱스(실무ver) */
select * from 사원 where 부서번호 = 'A2';
create index idx_사원 on 사원(부서번호);
select * from 사원 where 부서번호 = 'A2';

/* 10-1 */
delimiter $$
create procedure proc_if()
begin
declare x int;
declare y int default 5;
set x = 10;

if x>y then
select 'x는 y보다 큽니다.' as '결과';
else
select 'x는 y보다 작거나 같습니다.' as '결과';
end if;
end $$
delimiter ;

call proc_if();


/* 10-2 */
DELIMITER $$
CREATE PROCEDURE proc_case()
BEGIN
DECLARE x INT DEFAULT 10;
DECLARE y INT;
SET y = 10 MOD 2;

CASE
WHEN y = 0 THEN
SELECT 'x는 짝수입니다.' AS '결과';
ELSE
SELECT 'x는 홀수입니다.' AS '결과';
END CASE;
END $$
DELIMITER ;

CALL proc_case();

/* 10-3 */
DELIMITER $$
CREATE PROCEDURE proc_while()
BEGIN
DECLARE x INT DEFAULT 0;
DECLARE y INT DEFAULT 0;

WHILE x<10 DO
SET x = x+1;
SET y = y+x;
END WHILE;
SELECT x,y;
END $$
DELIMITER ;

CALL proc_while();

/* 10-4 */
DELIMITER $$
CREATE PROCEDURE proc_loop()
BEGIN
DECLARE x INT DEFAULT 0;
DECLARE y INT DEFAULT 0;

loop_sum:LOOP
SET x = x+1;
SET y = x+y;
IF x>10 THEN
LEAVE loop_sum;
END IF;
SELECT x,y;
END LOOP;
END $$
DELIMITER ;

CALL proc_loop();

/* 10-5 */
DELIMITER $$
CREATE PROCEDURE proc_repeat()
BEGIN
DECLARE x INT DEFAULT 0;
DECLARE y INT DEFAULT 0;

REPEAT
SET x=x+1;
SET y=x+y;
UNTIL x>=10 END REPEAT;
SELECT x,y;
END $$
DELIMITER ;

CALL proc_repeat()

/* 10-6 */
DELIMITER $$
CREATE PROCEDURE proc_고객정보() 
BEGIN
SELECT * FROM 고객;

SELECT COUNT(*) AS 고객수 FROM 고객;
END $$
DELIMITER ;

CALL proc_고객정보();

/* 10-7 */
DELIMITER $$
CREATE PROCEDURE proc_도시고객정보
(
IN city VARCHAR(50)
)
BEGIN
SELECT * FROM 고객 WHERE 도시 = city;

SELECT COUNT(*) AS 고객수 FROM 고객 WHERE 도시 = city;
END $$
DELIMITER ;

CALL proc_도시고객정보('부산광역시');

/* 10-8 */
DELIMITER $$
CREATE PROCEDURE proc_주문년도시_고객정보
(
IN order_year INT,
IN city VARCHAR(50)
)
BEGIN
SELECT 고객.고객번호,
고객회사명,
도시,
COUNT(*) AS 주문건수
FROM 고객 JOIN 주문
ON 고객.고객번호 = 주문.고객번호
WHERE YEAR(주문일) = order_year
AND 도시 = city
GROUP BY 고객.고객번호, 고객회사명;
END $$
DELIMITER ;

CALL proc_주문년도시_고객정보(2021,'공주시');

/* 10-9 */
DELIMITER $$
CREATE PROCEDURE proc_고객회사명_마일리지추가
(
IN company VARCHAR(50),
IN add_mileage INT
)
BEGIN
SELECT 고객번호, 고객회사명, 마일리지 AS 변경전마일리지
FROM 고객
WHERE 고객회사명 = company;

UPDATE 고객
SET 마일리지=마일리지+add_mileage
WHERE 고객회사명=company;

SELECT 고객번호,고객회사명,마일리지 AS 변경후마일리지
FROM 고객
WHERE 고객회사명=company;

END $$
DELIMITER ;

CALL proc_고객회사명_마일리지추가('진영무역',1000);

/* 10-10 */
DELIMITER $$
CREATE PROCEDURE proc_고객회사명_평균마일리지로변경
(
IN company VARCHAR(50)
)
BEGIN
DECLARE 평균마일리지 INT;
DECLARE 보유마일리지 INT;

SELECT 고객회사명,마일리지 AS 변경전마일리지
FROM 고객
WHERE 고객회사명=company;

SET 평균마일리지=(SELECT ANG(마일리지) FROM 고객);
SET 보유마일리지=(SELECT 마일리지 FROM 고객 WHERE 회사명=company);

IF (보유마일리지 > 평균마일리지) THEN
UPDATE 고객
SET 마일리지 = 마일리지 +100
WHERE 고객회사명=company;
ELSE
UPDATE 고객
SET 마일리지=평균마일리지
WHERE 고객회사명 = company;
END IF;

SELECT 고객회사명,마일리지 AS 변경후마일리지
FROM 고객
WHERE 고객회사명 = company;
END $$
DELIMITER ;

CALL proc_고객회사명_평균마일리지로변경('굿모닝서울');

/* 10-11 */
DELIMITER $$
CREATE PROCEDURE proc_고객등급
(
IN company VARCHAR(50),
OUT grade VARCHAR(20)
)
BEGIN
DECLARE 보유마일리지 INT;

SELECT 마일리지 INTO 보유마일리지
FROM 고객
WHERE 고객회사명=company;

IF 보유마일리지 > 100000 THEN
SET grade = '최우수고객회사';
ELSEIF 보유마일리지 >= 50000 THEN
SET grade = '우수고객회사';
ELSE
SET grade = '관심고객회사';
END IF;
END $$
DELIMITER ;

CALL proc_고객등급('그린로더스','@그린로더스등급');
CALL proc_고객등급('오뚜락','@오뚜락등급');

SELECT @그린로더스등급,@오뚜락등급

/* 10-12 */
DELIMITER $$
CREATE PROCEDURE proc_인상금액
(
IN increase_rate INT,
INOUT price INT
)
BEGIN
SET price = price * (1+increase_rate/100);
END $$
DELIMITER ;

SET @금액 = 10000;
CALL proc_인상금액(10,@금액);
SELECT @금액;

CALL proc_인상금액(10,@금액);
SELECT @금액;

/* 10-13 */
DELIMITER $$
CREATE FUNCTION func_금액(quantity INT,price INT)
RETURNS INT
BEGIN
DECLARE amout INT;
SET amout = quantity * price;
RETURN amout;
END $$
DELIMITER ;

SELECT func_금액(100,4500);

SELECT *,func_금액(주문수량,단가) AS 주문금액 FROM 주문세부;

/* 10-14 */
CREATE TABLE 제품로그
(
로그번호 INT AUTO_INCREMENT PRIMARY KEY,
처리 VARCHAR(10),
내용 VARCHAR(100),
처리일 TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER trigger_제품추가로그
AFTER INSERT ON 제품
FOR EACH ROW
BEGIN
INSERT INTO 제품로그(처리,내용)
VALUES('INSERT',CONCAT('제품번호:',NEW.제품번호,'제품명:',NEW.제품명));
END $$
DELIMITER ;

INSERT INTO 제품(제품번호,제품명,단가,재고) VALUES(99,'레몬캔디',2000,100);

SELECT * FROM 제품 WHERE 제품번호 = 99;

/* 10-15 */
DELIMITER $$
CREATE TRIGGER trigger_제품변경로그
AFTER UPDATE ON 제품
FOR EACH ROW
BEGIN
IF(NEW.단가 <> OLD.단가) THEN
INSERT INTO 제품로그(처리,내용) VALUES('UPDATE',CONCAT('제품번호:',OLD.제품번호,'단가:',OLD.단가,'->',NEW.단가));
END IF;

IF(NEW.재고 <> OLD.재고) THEN
INSERT INTO 제품로그(처리,내용) 
VALUES ('UPDATE',CONCAT('제품번호:',OLD.제품번호,' 재고:'OLD.재고,'->',NEW.재고));
END IF;
END $$
DELIMITER ;

UPDATE 제품 SET 단가 = 2500 WHERE 제품번호=99;
SELECT * FROM 제품로그;

/* 10-16 */
DELIMITER $$
CREATE TRIGGER trigger_제품삭제로그
AFTER DELETE ON 제품
FOR EACH ROW
BEGIN
INSERT INTO 제품로그(처리,내용)
VALUES('DELETE',CONCAT('제품번호:',OLD.제품번호,' 제품명:',OLD.제품명));
END $$
DELIMITER ;

DELETE FROM 제품
WHERE 제품번호 = 99;

SELECT * FROM 제품로그;


SELECT * FROM 제품;
SELECT * FROM 주문세부;
SELECT 제품명,SUM(주문수량) AS 주문수량합,SUM(주문세부.단가 * 주문수량) AS 주문금액합 FROM 제품
INNER JOIN 주문세부 ON 제품.제품번호 = 주문세부.제품번호
GROUP BY 제품명;

/* 문제 */
DELIMITER $$
CREATE PROCEDURE proc_제품
(
IN candy VARCHAR(50)
)
BEGIN
declare 주문수량합 int;
declare 주문금액합 int;

SELECT 제품명,SUM(주문수량) AS 주문수량합,SUM(주문세부.단가 * 주문수량) AS 주문금액합 FROM 제품
INNER JOIN 주문세부 ON 제품.제품번호 = 주문세부.제품번호
group by 제품명;

SET 주문수량합 = (select sum(주문수량) from 제품 inner join 주문세부 on 제품.제품번호 = 주문세부.제품번호 group by 제품명);
SET 주문금액합 = (SELECT SUM(주문세부.단가 * 주문수량) FROM 제품
INNER JOIN 주문세부 ON 제품.제품번호 = 주문세부.제품번호);

SELECT 제품명,SUM(주문수량) AS 주문수량합,SUM(주문세부.단가 * 주문수량) AS 주문금액합 FROM 제품
INNER JOIN 주문세부 ON 제품.제품번호 = 주문세부.제품번호
WHERE 제품명 LIKE '%candy%'
GROUP BY 제품명;
END $$
DELIMITER ;

CALL proc_제품('캔디');