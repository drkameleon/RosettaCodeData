--#SET TERMINATOR @

SET SERVEROUTPUT ON@

CREATE OR REPLACE FUNCTION ACKERMANN(
  IN M SMALLINT,
  IN N BIGINT
 ) RETURNS BIGINT
 BEGIN
  DECLARE RET BIGINT;
  DECLARE STMT STATEMENT;

  IF (M = 0) THEN
   SET RET = N + 1;
  ELSEIF (N = 0) THEN
   PREPARE STMT FROM 'SET ? = ACKERMANN(? - 1, 1)';
   EXECUTE STMT INTO RET USING M;
  ELSE
   PREPARE STMT FROM 'SET ? = ACKERMANN(? - 1, ACKERMANN(?, ? - 1))';
   EXECUTE STMT INTO RET USING M, M, N;
  END IF;
  RETURN RET;
 END @

BEGIN
 DECLARE M SMALLINT DEFAULT 0;
 DECLARE N SMALLINT DEFAULT 0;
 DECLARE MAX_LEVELS CONDITION FOR SQLSTATE '54038';
 DECLARE CONTINUE HANDLER FOR MAX_LEVELS BEGIN END;

 WHILE (N <= 6) DO
  WHILE (M <= 3) DO
   CALL DBMS_OUTPUT.PUT_LINE('ACKERMANN(' || M || ', ' || N || ') = ' || ACKERMANN(M, N));
   SET M = M + 1;
  END WHILE;
  SET M = 0;
  SET N = N + 1;
 END WHILE;
END @