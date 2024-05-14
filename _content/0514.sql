/* 1 */
select * from 제품;
insert into 제품(제품번호,제품명,포장단위,단가,재고) values(95,'망고베리 아이스크림','400g',800,30);

/* 2 */
insert into  제품(제품번호,제품명,단가) values(96,'눈꽃빙수맛 아이스크림',2000);

/* 3 */
select * from 제품;
update 제품 set 재고 = null where 제품번호 = 96;
update 제품 set 재고 = 30 where 제품번호 = 96;

/* 4 */
insert into 부서 values('A4','홍보부');
select * from 사원;
select * from 부서;
select * from 부서 left outer join 사원 on 사원.부서번호 = 부서.부서번호 where 사원번호 is null;
delete 부서 from 부서 left outer join 사원 on 사원.부서번호 = 부서.부서번호 where 사원번호 is null;

CREATE DATABASE 한빛학사;
USE 한빛학사;

CREATE TABLE 학과
(
학과번호 CHAR(2)
,학과명 VARCHAR(20)
,학과장명 VARCHAR(20)
);
SELECT * FROM 학과;
INSERT INTO 학과 VALUES('AA','컴퓨터공학과','배경민'),('BB','소프트웨어학과','김남준'),('CC','디자인융합학과','박선영');

CREATE TABLE 학생
(
학번 CHAR(5)
,이름 VARCHAR(20)
,생일 DATE
,연락처 VARCHAR(20)
,학과번호 CHAR(2)
);
SELECT * FROM 학생;
INSERT INTO 학생 VALUES('S0001','이윤주','2020-01-30','01033334444','AA'),('S0001','이승은','2021-02-23','NULL','AA')
,('S0003','백재용','2018-03-31','01077778888','DD');
CREATE TABLE 휴학생 AS
SELECT * FROM 학생 WHERE 1=2;
SELECT * FROM 휴학생;

CREATE TABLE 회원
(
아이디 VARCHAR(20) PRIMARY KEY,
회원명 VARCHAR(20),
키 INT,
몸무게 INT,
체질량지수 DECIMAL(4,1) AS (몸무게/POWER(키/100,2)) STORED
);
SELECT * FROM 회원;
INSERT INTO 회원(아이디,회원명,키,몸무게) VALUES('APPLE','김사과',178,70);

SELECT * FROM 학생;
ALTER TABLE 학생 ADD 성별 CHAR(1);
ALTER TABLE 학생 MODIFY COLUMN 성별 VARCHAR(2);
ALTER TABLE 학생 CHANGE COLUMN 연락처 휴대폰번호 VARCHAR(20);
ALTER TABLE 학생 DROP COLUMN 성별;
ALTER TABLE 휴학생 RENAME 졸업생;
DROP TABLE 학과;
DROP TABLE 학생;

CREATE TABLE 학과
(
학과번호 CHAR(2) PRIMARY KEY,
학과명 VARCHAR(20) NOT NULL,
학과장명 VARCHAR(20)
);
CREATE TABLE 학과1
(
학과번호 CHAR(2),
학과명 VARCHAR(20) NOT NULL,
학과장명 VARCHAR(20),
PRIMARY KEY(학과번호)
);

CREATE TABLE 학생
(
학번 CHAR(5) PRIMARY KEY,
이름 VARCHAR(20) NOT NULL,
생일 DATE NOT NULL,
연락처 VARCHAR(20) UNIQUE,
학과번호 CHAR(2) REFERENCES 학과(학과번호),
성별 CHAR(1) CHECK(성별 IN ('남','여')),
등록일 DATE DEFAULT (CURDATE()),
FOREIGN KEY(학과번호) REFERENCES 학과(학과번호)
);
CREATE TABLE 학생1
(
학번 CHAR(5),
이름 VARCHAR(20) NOT NULL,
생일 DATE NOT NULL,
연락처 VARCHAR(20),
학과번호 CHAR(2),
성별 CHAR(1),
등록일 DATE DEFAULT(CURDATE()),
PRIMARY KEY(학번),
UNIQUE(연락처),
CHECK(성별 IN ('남','여')),
FOREIGN KEY (학과번호) REFERENCES 학과(학과번호)
);

CREATE TABLE 과목
(
과목번호 CHAR(5) PRIMARY KEY,
과목명 VARCHAR(20) NOT NULL,
학점 INT NOT NULL CHECK(학점 BETWEEN 2 AND 4),
구분 VARCHAR(20) CHECK(구분 IN ('전공','교양','일반'))
);

CREATE TABLE 수강_1
(
수강년도 CHAR(4) NOT NULL,
수강학기 VARCHAR(20) NOT NULL CHECK(수강학기 IN ('1학기','2학기','여름학기','겨울학기')),
학번 CHAR(5) NOT NULL,
과목번호 CHAR(5) NOT NULL,
성적 DECIMAL(3,1) CHECK(성적 BETWEEN 0 AND 4.5),
PRIMARY KEY(수강년도,수강학기,학번,과목번호),
FOREIGN KEY (학번) REFERENCES 학생(학번),
FOREIGN KEY (과목번호) REFERENCES 과목(과목번호)
);

CREATE TABLE 수강_2
(
수강번호 INT PRIMARY KEY AUTO_INCREMENT,
수강년도 CHAR(4) NOT NULL,
수강학기 VARCHAR(20) NOT NULL CHECK(수강학기 IN ('1학기','2학기','여름학기','겨울학기')),
학번 CHAR(5) NOT NULL,
과목번호 CHAR(5) NOT NULL,
성적 DECIMAL(3,1) CHECK(성적 BETWEEN 0 AND 4.5),
FOREIGN KEY (학번) REFERENCES 학생(학번),
FOREIGN KEY (과목번호) REFERENCES 과목(과목번호)
);

INSERT INTO 학과 VALUES('AA','컴퓨터공학과','배경민');
INSERT INTO 학과 VALUES('BB','소프트웨어학과','김남준');
INSERT INTO 학과 VALUES('CC','디자인융합학과','박선영');

INSERT INTO 학생(학번,이름,생일,학과번호) VALUES('S0001','이윤주','2020-01-30','AA');
INSERT INTO 학생(학번,이름,생일,학과번호) VALUES('S0002','이승은','2021-02-23','AA');
INSERT INTO 학생(학번,이름,생일,학과번호) VALUES('S0003','백재용','2020-03-31','CC');

INSERT INTO 과목(과목번호,과목명,구분,학점) VALUES('C0003','데이터베이스실습','전공',3);
INSERT INTO 과목(과목번호,과목명,구분,학점) VALUES('C0002','데이터베이스 설계와 구축','전공',3);
INSERT INTO 과목(과목번호,과목명,구분,학점) VALUES('C0001','데이터 분석','전공',3);

INSERT INTO 수강_1(수강년도,수강학기,학번,과목번호,성적) VALUES('2023','1학기','S0001','C0001',4.3);
INSERT INTO 수강_1(수강년도,수강학기,학번,과목번호,성적) VALUES('2023','1학기','S0002','C0002',4.5);
INSERT INTO 수강_1(수강년도,수강학기,학번,과목번호,성적) VALUES('2023','1학기','S0001','C0002',4.3);
INSERT INTO 수강_1(수강년도,수강학기,학번,과목번호,성적) VALUES('2023','1학기','S0002','C0003',4.3);
SELECT * FROM 수강_1;

INSERT INTO 수강_2(수강년도,수강학기,학번,과목번호,성적) VALUES('2023','1학기','S0001','C0001',4.3);
INSERT INTO 수강_2(수강년도,수강학기,학번,과목번호,성적) VALUES('2023','1학기','S0001','C0001',4.5);
SELECT * FROM 수강_2;

ALTER TABLE 학생 ADD CONSTRAINT CHECK(학번 LIKE 'S%');
SELECT * FROM 학생;
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = '한빛학사' AND TABLE_NAME = '학생';
ALTER TABLE 학생 DROP CONSTRAINT 연락처;

CREATE TABLE 학생2
(
학번 CHAR(5),
이름 VARCHAR(20) NOT NULL,
생일 DATE NOT NULL,
연락처 VARCHAR(20),
학과번호 CHAR(2),
성별 CHAR(1),
등록일 DATE DEFAULT(CURDATE()),
PRIMARY KEY(학번),
CONSTRAINT UK_학생2_연락처 UNIQUE(연락처),
CONSTRAINT CK_학생2_성별 CHECK(성별 IN ('남','여')),
CONSTRAINT FK_학생2_학과번호 FOREIGN KEY (학과번호) REFERENCES 학과(학과번호)
);

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = '한빛학사' AND TABLE_NAME = '학생2';

CREATE TABLE 수강평가
(
평가순번 INT PRIMARY KEY AUTO_INCREMENT,
학번 CHAR(5) NOT NULL,
과목번호 CHAR(5) NOT NULL,
평점 INT CHECK(평점 BETWEEN 0 AND 5),
과목평가 VARCHAR(500),
평가일시 DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (학번) REFERENCES 학생(학번),
FOREIGN KEY (과목번호) REFERENCES 과목(과목번호) ON DELETE CASCADE
);

DROP TABLE 수강평가;
INSERT INTO 수강평가(학번,과목번호,평점,과목평가) VALUES('S0001','C0001',5,'SQL학습에 도움이 되었습니다.'),
('S0001','C0003',5,'SQL활욜을 배워서 좋았습니다.'),('S0002','C0003',5,'데이터 분석에 관심이 생겼습니다.'),
('S0003','C0003',5,'머신러닝과 시각화 부분이 유용했습니다.');
SELECT * FROM 수강평가;
SELECT * FROM 과목;

DELETE FROM 과목 WHERE 과목번호 = 'C0003';

SELECT * FROM 과목;
SELECT * FROM 수강평가;
DELETE FROM 과목 WHERE 과목번호 = 'C0001';

CREATE DATABASE 쇼핑몰;
USE 쇼핑몰;
CREATE TABLE 회원
(
아이디 VARCHAR(20) PRIMARY KEY,
이름 VARCHAR(20) NOT NULL,
생년 INT,
지역 VARCHAR(20) NOT NULL,
국번 CHAR(5),
전화번호 VARCHAR(20),
키 INT NOT NULL,
가입일 DATETIME DEFAULT CURRENT_TIMESTAMP
);
DROP TABLE 회원;
DROP TABLE 구매;
CREATE TABLE 구매
(
순번 INT PRIMARY KEY AUTO_INCREMENT,
아이디 VARCHAR(20) NOT NULL,
물품 VARCHAR(20) NOT NULL,
분류 VARCHAR(20),
단가 INT NOT NULL,
수량 INT NOT NULL,
FOREIGN KEY (아이디) REFERENCES 회원(아이디)
);

INSERT INTO 회원(아이디,이름,생년,지역,국번,전화번호,키,가입일) VALUES('YSJ','유재석',1972,'서울','010','11111111',178,'2008.8.8'),
('KHD','강호동',1970,'경북','011','22222222',182,'2007.7.7'),('KKJ','김국진',1965,'서울','019','33333333',171,'2009.9.9'),
('KYM','김용만',1967,'서울','010','44444444',177,'2015.5.5'),('KJD','김제동',1974,'경남','','',173,'2013.3.3'),
('NHS','남희석',1971,'충남','016','66666666',180,'2017.4.4'),('SDY','신동엽',1971,'경기','','',176,'2008.10.10'),
('LHJ','이휘재',1972,'경기','011','8888888',180,'2006.4.4'),('LKK','이경규',1960,'경남','018','99999999',170,'2004.12.12'),
('PSH','박수홍',1970,'서울','010','00000000',183,'2012.5.5');
SELECT * FROM 회원;
DELETE FROM 구매;
INSERT INTO 구매(아이디,물품,분류,단가,수량) VALUES('KHD','운동화','',30,2),('KHD','노트북','전자',1000,1),
('KYM','모니터','전자',200,1),('PSH','모니터','전자',200,5),('KHD','청바지','의류',50,3),('PSH','메모리','전자',80,10),
('KJD','책','서적',15,5),('LHJ','책','서적',15,2),('LHJ','청바지','의류',50,1),('PSH','운동화','',30,2),
('LHJ','책','서적',15,1),('PSH','운동화','',30,2);
SELECT * FROM 구매;

USE 한빛무역;
/* 1 */
SELECT * FROM 제품;
ALTER TABLE 제품 ADD CONSTRAINT CHECK(재고 >= 0);

/* 2 */
SELECT * FROM 주문;
DROP TABLE 제품;
ALTER TABLE 제품 ADD 재고금액 DECIMAL(10,1) AS(단가 * 재고);
SELECT * FROM 제품;

/* 3 */
SELECT * FROM 제품;
SELECT * FROM 주문세부;
ALTER TABLE 주문세부 ADD CONSTRAINT 제품번호 FOREIGN KEY (제품번호) REFERENCES 제품(제품번호) ON DELETE CASCADE;