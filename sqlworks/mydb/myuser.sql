-- jdbc �׽�Ʈ�� user ���̺� ����
CREATE TABLE myuser(
    id  NUMBER PRIMARY KEY,
    pwd VARCHAR2(20) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    phone VARCHAR2(20)
);

SELECT * FROM myuser;

DROP TABLE myuser;