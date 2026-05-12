Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ecommerce          |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql> use ecommerce;
Database changed
mysql> show tables;
+---------------------+
| Tables_in_ecommerce |
+---------------------+
| customer            |
| demo                |
| product             |
+---------------------+
3 rows in set (0.02 sec)

mysql> select * from product;
Empty set (0.01 sec)

mysql> desc product;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| product_id     | varchar(10) | NO   | PRI | NULL    |       |
| product_name   | varchar(10) | NO   |     | NULL    |       |
| category       | varchar(10) | NO   |     | NULL    |       |
| Sub_category   | varchar(15) | NO   |     | NULL    |       |
| original_price | double      | NO   |     | NULL    |       |
| selling_price  | double      | NO   |     | NULL    |       |
| stock          | varchar(20) | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> create database aggregation;
Query OK, 1 row affected (0.04 sec)

mysql> use aggregation;
Database changed

mysql> create table orders(order_id varchar(20) not null primary key, product_name varchar(30) not null, category varchar(30) not null, selling_price double(12,2) not null, original_price double(12,2) not null, stock int not null);
Query OK, 0 rows affected, 2 warnings (0.07 sec)

mysql> desc orders;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| order_id       | varchar(20)  | NO   | PRI | NULL    |       |
| product_name   | varchar(30)  | NO   |     | NULL    |       |
| category       | varchar(30)  | NO   |     | NULL    |       |
| selling_price  | double(12,2) | NO   |     | NULL    |       |
| original_price | double(12,2) | NO   |     | NULL    |       |
| stock          | int          | NO   |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> create table product(product_id varchar(20) not null primary key, product_name varchar(30) not null, category varchar(30) not null, selling_price double(12,2) not null, original_price double(12,2) not null, stock int not null);
Query OK, 0 rows affected, 2 warnings (0.03 sec)

mysql> desc product;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| product_id     | varchar(20)  | NO   | PRI | NULL    |       |
| product_name   | varchar(30)  | NO   |     | NULL    |       |
| category       | varchar(30)  | NO   |     | NULL    |       |
| selling_price  | double(12,2) | NO   |     | NULL    |       |
| original_price | double(12,2) | NO   |     | NULL    |       |
| stock          | int          | NO   |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> insert into product values('p101','chair','furniture','6000','5000',12),('p102','table','furniture','8000','7500',14),('p103','mobile','electronics','20000','17000',20),('p104','jeans','clothing','2000','1500',14),('p105','webcam','electronics','6000','5500',13);
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0


mysql> select * from product;
+------------+--------------+-------------+---------------+----------------+-------+
| product_id | product_name | category    | selling_price | original_price | stock |
+------------+--------------+-------------+---------------+----------------+-------+
| p101       | chair        | furniture   |       6000.00 |        5000.00 |    12 |
| p102       | table        | furniture   |       8000.00 |        7500.00 |    14 |
| p103       | mobile       | electronics |      20000.00 |       17000.00 |    20 |
| p104       | jeans        | clothing    |       2000.00 |        1500.00 |    14 |
| p105       | webcam       | electronics |       6000.00 |        5500.00 |    13 |
+------------+--------------+-------------+---------------+----------------+-------+
5 rows in set (0.01 sec)

mysql> select sum(selling_price) from product;
+--------------------+
| sum(selling_price) |
+--------------------+
|           42000.00 |
+--------------------+
1 row in set (0.01 sec)

mysql> select avg(selling_price) from product;
+--------------------+
| avg(selling_price) |
+--------------------+
|        8400.000000 |
+--------------------+
1 row in set (0.00 sec)

mysql> select count(*) from product;
+----------+
| count(*) |
+----------+
|        5 |
+----------+
1 row in set (0.01 sec)

mysql> select max(stock) from product;
+------------+
| max(stock) |
+------------+
|         20 |
+------------+
1 row in set (0.01 sec)

mysql> select min(stock) from product;
+------------+
| min(stock) |
+------------+
|         12 |
+------------+
1 row in set (0.01 sec)

mysql> select * from product order by stock;
+------------+--------------+-------------+---------------+----------------+-------+
| product_id | product_name | category    | selling_price | original_price | stock |
+------------+--------------+-------------+---------------+----------------+-------+
| p101       | chair        | furniture   |       6000.00 |        5000.00 |    12 |
| p105       | webcam       | electronics |       6000.00 |        5500.00 |    13 |
| p102       | table        | furniture   |       8000.00 |        7500.00 |    14 |
| p104       | jeans        | clothing    |       2000.00 |        1500.00 |    14 |
| p103       | mobile       | electronics |      20000.00 |       17000.00 |    20 |
+------------+--------------+-------------+---------------+----------------+-------+
5 rows in set (0.00 sec)

mysql> select * from product order by selling_price;
+------------+--------------+-------------+---------------+----------------+-------+
| product_id | product_name | category    | selling_price | original_price | stock |
+------------+--------------+-------------+---------------+----------------+-------+
| p104       | jeans        | clothing    |       2000.00 |        1500.00 |    14 |
| p101       | chair        | furniture   |       6000.00 |        5000.00 |    12 |
| p105       | webcam       | electronics |       6000.00 |        5500.00 |    13 |
| p102       | table        | furniture   |       8000.00 |        7500.00 |    14 |
| p103       | mobile       | electronics |      20000.00 |       17000.00 |    20 |
+------------+--------------+-------------+---------------+----------------+-------+
5 rows in set (0.00 sec)

mysql> select * from product order by product_name;
+------------+--------------+-------------+---------------+----------------+-------+
| product_id | product_name | category    | selling_price | original_price | stock |
+------------+--------------+-------------+---------------+----------------+-------+
| p101       | chair        | furniture   |       6000.00 |        5000.00 |    12 |
| p104       | jeans        | clothing    |       2000.00 |        1500.00 |    14 |
| p103       | mobile       | electronics |      20000.00 |       17000.00 |    20 |
| p102       | table        | furniture   |       8000.00 |        7500.00 |    14 |
| p105       | webcam       | electronics |       6000.00 |        5500.00 |    13 |
+------------+--------------+-------------+---------------+----------------+-------+
5 rows in set (0.00 sec)


mysql> select * from product order by stock desc limit 3;
+------------+--------------+-------------+---------------+----------------+-------+
| product_id | product_name | category    | selling_price | original_price | stock |
+------------+--------------+-------------+---------------+----------------+-------+
| p103       | mobile       | electronics |      20000.00 |       17000.00 |    20 |
| p102       | table        | furniture   |       8000.00 |        7500.00 |    14 |
| p104       | jeans        | clothing    |       2000.00 |        1500.00 |    14 |
+------------+--------------+-------------+---------------+----------------+-------+
3 rows in set (0.00 sec)

mysql> select * from product order by stock desc;
+------------+--------------+-------------+---------------+----------------+-------+
| product_id | product_name | category    | selling_price | original_price | stock |
+------------+--------------+-------------+---------------+----------------+-------+
| p103       | mobile       | electronics |      20000.00 |       17000.00 |    20 |
| p102       | table        | furniture   |       8000.00 |        7500.00 |    14 |
| p104       | jeans        | clothing    |       2000.00 |        1500.00 |    14 |
| p105       | webcam       | electronics |       6000.00 |        5500.00 |    13 |
| p101       | chair        | furniture   |       6000.00 |        5000.00 |    12 |
+------------+--------------+-------------+---------------+----------------+-------+
5 rows in set (0.00 sec)

mysql> create table employee(employee_id varchar(20) not null primary key, employee_name varchar(30) not null, department varchar(30) not null, salary int not null);
Query OK, 0 rows affected (0.02 sec)

mysql> desc employee;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| employee_id   | varchar(20) | NO   | PRI | NULL    |       |
| employee_name | varchar(30) | NO   |     | NULL    |       |
| department    | varchar(30) | NO   |     | NULL    |       |
| salary        | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> insert into employee values('E101','Ashish','HR','40000'),('E102','lokesh','IT','6000'),('E103','sheyansh','IT','7000'),('E104','Sheetal','Finance','4500'),('E105','Harsh','HR','5000');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+-------------+---------------+------------+--------+
| employee_id | employee_name | department | salary |
+-------------+---------------+------------+--------+
| E101        | Ashish        | HR         |  40000 |
| E102        | lokesh        | IT         |   6000 |
| E103        | sheyansh      | IT         |   7000 |
| E104        | Sheetal       | Finance    |   4500 |
| E105        | Harsh         | HR         |   5000 |
+-------------+---------------+------------+--------+
5 rows in set (0.00 sec)

mysql> select department, count(*) as total_employee from employee group by department;
+------------+----------------+
| department | total_employee |
+------------+----------------+
| HR         |              2 |
| IT         |              2 |
| Finance    |              1 |
+------------+----------------+
3 rows in set (0.00 sec)


mysql> select department, sum(salary) as total_salary from employee group by department;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| HR         |        45000 |
| IT         |        13000 |
| Finance    |         4500 |
+------------+--------------+
3 rows in set (0.01 sec)

mysql> select department, avg(salary) as average_salary from employee group by department;
+------------+----------------+
| department | average_salary |
+------------+----------------+
| HR         |     22500.0000 |
| IT         |      6500.0000 |
| Finance    |      4500.0000 |
+------------+----------------+
3 rows in set (0.01 sec)

mysql> select department, salary, count(*) from employee group by department, salary;
+------------+--------+----------+
| department | salary | count(*) |
+------------+--------+----------+
| HR         |  40000 |        1 |
| IT         |   6000 |        1 |
| IT         |   7000 |        1 |
| Finance    |   4500 |        1 |
| HR         |   5000 |        1 |
+------------+--------+----------+
5 rows in set (0.00 sec)

mysql> select * from employee;
+-------------+---------------+------------+--------+
| employee_id | employee_name | department | salary |
+-------------+---------------+------------+--------+
| E101        | Ashish        | HR         |  40000 |
| E102        | lokesh        | IT         |   6000 |
| E103        | sheyansh      | IT         |   7000 |
| E104        | Sheetal       | Finance    |   4500 |
| E105        | Harsh         | HR         |   5000 |
+-------------+---------------+------------+--------+
5 rows in set (0.00 sec)

mysql> select department, count(*) as total_employee from employee group by department having count(*) > 1;
+------------+----------------+
| department | total_employee |
+------------+----------------+
| HR         |              2 |
| IT         |              2 |
+------------+----------------+
2 rows in set (0.01 sec)

mysql> select department, sum(salary) as total_salary from employee group by department having sum(salary) > 8000;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| HR         |        45000 |
| IT         |        13000 |
+------------+--------------+
2 rows in set (0.00 sec)

mysql> select department, sum(salary) as total_salary from employee group by department having sum(salary) > 2000;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| HR         |        45000 |
| IT         |        13000 |
| Finance    |         4500 |
+------------+--------------+
3 rows in set (0.00 sec)

mysql> select department, avg(salary) as average_salary from employee group by department having sum(salary) > 5000;
+------------+----------------+
| department | average_salary |
+------------+----------------+
| HR         |     22500.0000 |
| IT         |      6500.0000 |
+------------+----------------+
2 rows in set (0.00 sec)





