SELECT * FROM tbl_class;
SELECT * FROM tbl_student;

-- ���� 
SELECT stu.sname, stu.age, stu.gender, cls.cid, cls.cname
FROM tbl_class cls, tbl_student stu
WHERE cls.cid = stu.cid;

-- �а��� �л����� ���Ͻÿ�
SELECT cls.cid, cls.cname, COUNT(*) �л���
FROM tbl_class cls, tbl_student stu
WHERE cls.cid = stu.cid
GROUP BY cls.cid, cls.cname;

-- �а��� �л����� �Ұ� �� �Ѱ踦 ���Ͻÿ�
SELECT cls.cid, cls.cname, COUNT(*) �л���
FROM tbl_class cls, tbl_student stu
WHERE cls.cid = stu.cid
GROUP BY ROLLUP(cls.cid, cls.cname);

