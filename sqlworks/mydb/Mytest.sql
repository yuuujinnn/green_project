-- Mytest
CREATE TABLE Mytest(
    class   VARCHAR2(1), 
    name    VARCHAR2(6)
);

INSERT INTO Mytest VALUES ('A', '����');
INSERT INTO Mytest VALUES ('A', '����');
INSERT INTO Mytest VALUES ('A', '����');
INSERT INTO Mytest VALUES ('B', '����');
INSERT INTO Mytest VALUES ('B', '����');
INSERT INTO Mytest VALUES ('C', '����');
INSERT INTO Mytest VALUES ('C', '����');

SELECT * FROM Mytest;

-- �ݺ�, �л��� �л����� ���Ͻÿ�
SELECT class, COUNT(NAME) RESULT1
FROM Mytest
GROUP BY class;

-- �̸� - �ߺ� ����
SELECT class, COUNT(DISTINCT NAME) RESULT2
FROM Mytest
GROUP BY class;

/*
CASE 
  WHEN ���� 1 THEN ��1
  WHEN ���� 2 THEN ��2
  ELSE �� 3
END
*/

SELECT 
    COUNT(CASE WHEN class = 'A' THEN 1
          END) AS A,
    COUNT(CASE WHEN class = 'B' THEN 1
          END) AS B,
    COUNT(CASE WHEN class = 'C' THEN 1
          END) AS C        
FROM MYtest;

-- DECODE(Į��, ����, ���ΰ�, �����ΰ�)
SELECT 
    COUNT(DECODE(class, 'A', 1)) AS A, 
    COUNT(DECODE(class, 'B', 1)) AS B, 
    COUNT(DECODE(class, 'C', 1)) AS C 
FROM MYtest;





