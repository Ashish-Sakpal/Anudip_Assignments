Question:
Lab 1: Database Schema: Consider a simple database with one tables: BankAccount BankAccount

 Table: ● Columns: account_id (Primary Key), account_holder_name, account_balance

 Task 1: Insert Data Write an SQL INSERT statement to insert data into the BankAccount table

. Task 2: Retrieving Data Write an SQL SELECT statement to retrieve the account_holder_name and account_balance of all account holders from the BankAccount table. 

Task 3: Filtering Data Write an SQL SELECT statement to retrieve the account_holder_name and account_balance where the account_balance is more than 30,000.

 Task 4: Updating Data Write an SQL UPDATE statement to change the account_balance of the account holder whose ID is 101. 

answer:

mysql> use ecommerce;
Database changed

mysql> create table BankAccount (account_id varchar(15) not null primary key,account_holder_name varchar(15) not null,account_balance double not null);
Query OK, 0 rows affected (0.11 sec)

mysql> desc BankAccount;
+---------------------+-------------+------+-----+---------+-------+
| Field               | Type        | Null | Key | Default | Extra |
+---------------------+-------------+------+-----+---------+-------+
| account_id          | varchar(15) | NO   | PRI | NULL    |       |
| account_holder_name | varchar(15) | NO   |     | NULL    |       |
| account_balance     | double      | NO   |     | NULL    |       |
+---------------------+-------------+------+-----+---------+-------+
3 rows in set (0.06 sec)

mysql> insert into BankAccount values(101, 'Rahul Sharma', 45000),(102, 'Anita Patil', 28000),(103, 'Sneha Joshi', 52000);
Query OK, 3 rows affected (0.04 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from BankAccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
| 101        | Rahul Sharma        |           28000 |
| 102        | Anita Patil         |           28000 |
| 103        | Sneha Joshi         |           52000 |
+------------+---------------------+-----------------+
3 rows in set (0.00 sec)

mysql> select account_holder_name,account_balance from BankAccount;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| Rahul Sharma        |           45000 |
| Anita Patil         |           28000 |
| Sneha Joshi         |           52000 |
+---------------------+-----------------+
3 rows in set (0.01 sec)

mysql> select account_holder_name,account_balance from BankAccount where account_balance > 30000;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| Rahul Sharma        |           45000 |
| Sneha Joshi         |           52000 |
+---------------------+-----------------+
2 rows in set (0.01 sec)

mysql> update BankAccount set account_balance = 50000 where account_id ='101';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from BankAccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
| 101        | Rahul Sharma        |           50000 |
| 102        | Anita Patil         |           28000 |
| 103        | Sneha Joshi         |           52000 |
+------------+---------------------+-----------------+
3 rows in set (0.00 sec)