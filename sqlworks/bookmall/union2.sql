-- ���ѹα��� �����ϴ� ���� �̸��� ������ �ֹ��� ���� �̸� �˻�
-- union�� ���
-- ���ѹα��� �����ϴ� ���� �̸�
SELECT name
FROM customer
WHERE address LIKE '%���ѹα�%';

-- ������ �ֹ��� ���� �̸� �˻�
SELECT name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;
-- ���� ����(���ϱ�) - UNION : �ߺ� �Ұ�
SELECT name
FROM customer
WHERE address LIKE '%���ѹα�%'
UNION
SELECT name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;
-- UNION ALL - �ߺ� ���
SELECT name
FROM customer
WHERE address LIKE '%���ѹα�%'
UNION ALL
SELECT name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;