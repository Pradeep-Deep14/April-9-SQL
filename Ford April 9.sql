CREATE TABLE TABLE_A
(
ID INT,
VALUE INT)


CREATE TABLE TABLE_B
(
ID INT,
NAME CHAR(10))


INSERT INTO TABLE_A(ID, VALUE)
VALUES
(1, 100),
(1, 150),
(2, 200),
(NULL, 300);

INSERT INTO TABLE_B(ID, NAME)
VALUES
(1, 'ABC'),
(2, 'BCD'),
(NULL, 'EFG');


SELECT * FROM TABLE_A
SELECT * FROM TABLE_B

--OUTPUT
--ABC 250 
--BCD 200

SELECT B.Name,COALESCE(SUM(A.VALUE),0) AS TOTAL FROM TABLE_B B
LEFT JOIN TABLE_A A ON B.id=A.id
GROUP BY B.Name
HAVING COALESCE(SUM(A.VALUE),0) > 0
