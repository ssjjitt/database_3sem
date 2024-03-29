USE Gl_MyBase

SELECT MAX(���������_������) AS [������������],
       MIN(���������_������) AS [�����������],
       AVG(���������_������) AS [�������],
       SUM(���������_������) AS [�����]
FROM (
    SELECT SUM(�������������.������) AS ���������_������
    FROM �������������
    GROUP BY �������������.�������
) AS subquery;

--������������ ���������� ���������� ������, ������ GROUP BY � ���������� �������. 
SELECT MAX(���������_������) AS [������������],
       MIN(���������_������) AS [�����������],
       AVG(���������_������) AS [�������],
       SUM(���������_������) AS [�����]
FROM (
    SELECT SUM(p.������) AS ���������_������
    FROM ������������� p
    INNER JOIN ����� d ON p.���_������������� = d.���_�������������
    GROUP BY p.�������
) AS subquery;

select �������, ���� from �������������

--���������� ����� ������ �������������� � �������, �������� ��������.
--������������ ��������� � ������ FROM, � ���������� ��������� GROUP BY � CASE. 
SELECT *
FROM(SELECT CASE
WHEN ���� BETWEEN 1 AND 3 THEN '���� �� 3 ������������'
WHEN ���� BETWEEN 3 AND 7 THEN '���� �� 3 �� 7'
ELSE '���� > 7'
END AS [���� � ��������], COUNT(*) AS [����������]
FROM �������������
GROUP BY CASE
WHEN ���� BETWEEN 1 AND 3 THEN '���� �� 3 ������������'
WHEN ���� BETWEEN 3 AND 7 THEN '���� �� 3 �� 7'
ELSE '���� > 7'
END
)AS T
ORDER BY CASE [���� � ��������]
WHEN '���� �� 3 ������������' THEN 3
WHEN '���� �� 3 �� 7' THEN 2
WHEN '���� > 7' THEN 1
ELSE 0
END;

select ��������, �������, ����, ������ from ������������� inner join ����� on �����.���_������������� = �������������.���_������������� 

--������ ������������� � ������� ��������,  
--������������ ���������� ���������� ������, ���������� ������� AVG � ���������� ������� CAST � ROUND.
SELECT �����.�������, ROUND(AVG(CAST(�������������.������ AS FLOAT)), 2) AS �������_������
FROM �����
INNER JOIN ������������� ON �����.���_������������� = �������������.���_�������������
GROUP BY �����.�������
ORDER BY �������_������ DESC;

--���������� SELECT-������, ����� � ������� �������� �������������� ������ �������� �� �����. ������������ WHERE.
SELECT �����.�������, ROUND(AVG(CAST(�������������.���� AS FLOAT)), 2) AS �������_����
FROM �����
INNER JOIN ������������� ON �����.���_������������� = �������������.���_�������������
WHERE �������������.�������� IN ('��������', '��������')
GROUP BY �����.�������
ORDER BY �������_���� DESC;

--��������� �����_������, ������������� � ��������� ���������� �� �������������� ���, ����, �� ��
select �����_������, �������������, sum(����������_���������) ���������� from ������
where ������������� in ('�����������', '���������', '����������� �����')
group by �����_������, �������������

--������������ �����������, ������ HAVING, ����������.
SELECT �����_������, ����������_���������
FROM ������
GROUP BY �����_������, ����������_���������
HAVING ����������_��������� > 15 AND ����������_��������� < 30
ORDER BY �����_������;

