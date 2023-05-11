-- bookmall ���� ���̺�
SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- ���� �ֹ��� ������ �� �Ǹž� ���ϱ�
SELECT SUM(saleprice) ���Ǹž� 
FROM orders;

-- ����, ������ ���Ǹž� ���
SELECT custid,
       bookid,
       SUM(saleprice) ���Ǹž� 
FROM orders
GROUP BY custid, bookid;

-- ���� ���Ǹž� ���, �Ұ�, �Ѱ� ���ϱ�
-- ROLLUP() : �μ��� �Ұ�, �Ѱ�
SELECT custid, bookid,
       SUM(saleprice) ���Ǹž� 
FROM orders
GROUP BY ROLLUP(custid, bookid)
ORDER BY custid;

-- CUBE() : �μ���, ������ �Ұ� �� �Ѱ�
SELECT custid, bookid,
       SUM(saleprice) ���Ǹž� 
FROM orders
GROUP BY CUBE(custid, bookid)
ORDER BY custid;

-- GROUPING SETS() : ����, ������ �Ұ�
SELECT custid, bookid,
       SUM(saleprice) ���Ǹž� 
FROM orders
GROUP BY GROUPING SETS(custid, bookid)
ORDER BY custid, bookid;




