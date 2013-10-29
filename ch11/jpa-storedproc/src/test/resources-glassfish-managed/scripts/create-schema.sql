DROP TABLE IF EXISTS  EMPLOYEE
;
DROP TABLE IF EXISTS  DEPARTMENT
;
DROP TABLE IF EXISTS  TAX_CODE
;
DROP TABLE IF EXISTS  REGION
;


CREATE TABLE EMPLOYEE ( EMPLOYEE_ID BIGINT, FIRST_NAME VARCHAR(32), LAST_NAME VARCHAR(32), REGION_ID BIGINT, PRIMARY KEY( EMPLOYEE_ID) )
;

CREATE TABLE DEPARTMENT ( DEPT_ID BIGINT, DEPT_NAME VARCHAR(32), PRIMARY KEY( DEPT_ID) )
;

CREATE TABLE TAX_CODE ( TAX_CODE_ID BIGINT, NAME VARCHAR(16), PRIMARY KEY(TAX_CODE_ID))
;

CREATE TABLE REGION ( REGION_ID BIGINT, NAME VARCHAR(16), PRIMARY KEY(REGION_ID))
;

INSERT INTO TAX_CODE VALUES ( 101, 'FULL_TIME')
;
INSERT INTO TAX_CODE VALUES ( 102, 'CHARITY')
;
INSERT INTO TAX_CODE VALUES ( 103, 'TEMPORARY')
;
INSERT INTO TAX_CODE VALUES ( 104, 'EMPLOYED')
;
INSERT INTO TAX_CODE VALUES ( 105, 'EMPLOYED')
;

INSERT INTO REGION VALUES ( 83001, 'SOUTH EAST')
;
INSERT INTO REGION VALUES ( 83002, 'SOUTH WEST')
;
INSERT INTO REGION VALUES ( 83003, 'CENTRAL')
;
INSERT INTO REGION VALUES ( 83004, 'NORTH WEST')
;
INSERT INTO REGION VALUES ( 83005, 'EAST EAST')
;


INSERT INTO EMPLOYEE VALUES ( 1, 'Mike', 'Fields', 83001)
;
INSERT INTO EMPLOYEE VALUES ( 2, 'Sally', 'Richardson', 83003)
;
INSERT INTO EMPLOYEE VALUES ( 3, 'Brian', 'Decker', 83002)
;
INSERT INTO EMPLOYEE VALUES ( 4, 'Anne', 'Bakersfield', 83005)
;
INSERT INTO EMPLOYEE VALUES ( 5, 'Stephen', 'Schultz', 83001)
;
INSERT INTO EMPLOYEE VALUES ( 6, 'Peter', 'Brooking', 83001)
;
INSERT INTO EMPLOYEE VALUES ( 7, 'Mary', 'Smith', 83004)
;
INSERT INTO EMPLOYEE VALUES ( 8, 'Lucas', 'Robins', 83003)
;


DROP PROCEDURE IF EXISTS READ_TAX_SP
;
DROP PROCEDURE IF EXISTS TAX_AND_REGION_SP
;

CREATE PROCEDURE READ_TAX_SP (IN param1 INT)
  BEGIN
    SELECT * FROM TAX_CODE WHERE TAX_CODE_ID = param1  ;
  END
;

CREATE PROCEDURE TAX_AND_REGION_SP (IN param1 INT, IN param2 INT)
  BEGIN
    SELECT * FROM TAX_CODE WHERE TAX_CODE_ID = param1  ;
    SELECT * FROM REGION WHERE REGION_ID >= param2  ;
  END
;

DROP PROCEDURE IF EXISTS DOUBLE_SP
;

CREATE PROCEDURE DOUBLE_SP( IN v1 FLOAT, OUT v2 FLOAT)
  BEGIN
    SET v2 = v1 * 2.0;
  END
;

DROP PROCEDURE IF EXISTS COMPOUND_INTEREST_SP
;

CREATE PROCEDURE COMPOUND_INTEREST_SP(
  IN P FLOAT, IN r FLOAT, IN n FLOAT,
  IN t FLOAT, OUT A FLOAT )
  BEGIN
    DECLARE X INT;
    DECLARE nt, power, total FLOAT;
    SET nt = n * t;
    SET X = nt;
    SET total = 1;
    SET power = 1 + R / N;
    WHILE  X > 0 DO
    SET total = total * power;
    SET X = X - 1;
    END WHILE;
    SET A = P * total;
  END
;

DROP PROCEDURE IF EXISTS EMP_READ_BY_REGION_SP
;

CREATE PROCEDURE EMP_READ_BY_REGION_SP( IN region INT )
  BEGIN
    SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, r.NAME
      FROM EMPLOYEE e, REGION r
      WHERE e.REGION_ID = r.REGION_ID;
  END
;

-- This code is for Derby only
-- ==============================
--
-- CREATE PROCEDURE TAX_AND_REGION_SP( TAX_CODE_ID INTEGER, REGION_ID INTEGER)
-- PARAMETER STYLE JAVA
-- LANGUAGE JAVA
-- READS SQL DATA
-- DYNAMIC RESULT SETS 2
-- EXTERNAL NAME 'je7hb.jpa.advanced.storedproc1.CustomStoreProcedure.selectRowsFromTaxAndRegion'  \
--
-- CREATE PROCEDURE READ_TAX_SP( TAX_CODE_ID INTEGER )
-- PARAMETER STYLE JAVA
-- LANGUAGE JAVA
-- READS SQL DATA
-- DYNAMIC RESULT SETS 1
-- EXTERNAL NAME 'je7hb.jpa.advanced.storedproc1.CustomStoreProcedure.selectTaxCode'  \
