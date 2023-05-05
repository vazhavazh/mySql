Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 10.11.2-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> \h

General information about MariaDB can be found at
http://mariadb.org

List of all client commands:
Note that all text commands must be first on line and end with ';'
?         (\?) Synonym for `help'.
clear     (\c) Clear the current input statement.
connect   (\r) Reconnect to the server. Optional arguments are db and host.
delimiter (\d) Set statement delimiter.
edit      (\e) Edit command with $EDITOR.
ego       (\G) Send command to MariaDB server, display result vertically.
exit      (\q) Exit mysql. Same as quit.
go        (\g) Send command to MariaDB server.
help      (\h) Display this help.
nopager   (\n) Disable pager, print to stdout.
notee     (\t) Don't write into outfile.
pager     (\P) Set PAGER [to_pager]. Print the query results via PAGER.
print     (\p) Print current command.
prompt    (\R) Change your mysql prompt.
quit      (\q) Quit mysql.
rehash    (\#) Rebuild completion hash.
source    (\.) Execute an SQL script file. Takes a file name as an argument.
status    (\s) Get status information from the server.
system    (\!) Execute a system shell command.
tee       (\T) Set outfile [to_outfile]. Append everything into given outfile.
use       (\u) Use another database. Takes database name as argument.
charset   (\C) Switch to another charset. Might be needed for processing binlog with multi-byte charsets.
warnings  (\W) Show warnings after every statement.
nowarning (\w) Don't show warnings after every statement.

For server side help, type 'help contents'

MariaDB [(none)]> connect
Connection id:    11
Current database: *** NONE ***

MariaDB [(none)]> CREATE DATABASE practiseNew;
Query OK, 1 row affected (0.007 sec)

MariaDB [(none)]> SHOW DATABASES;
+---------------------+
| Database            |
+---------------------+
| information_schema  |
| module2practise     |
| mysql               |
| new_test_super_mega |
| performance_schema  |
| practisenew         |
| sys                 |
+---------------------+
7 rows in set (0.001 sec)

MariaDB [(none)]> CREATE DATABASE practiseNew;
ERROR 1007 (HY000): Can't create database 'practisenew'; database exists
MariaDB [(none)]> DROP DATABASE practisenew
    -> DROP DATABASE practisenew;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'DROP DATABASE practisenew' at line 2
MariaDB [(none)]> DROP DATABASE practisenew;
Query OK, 0 rows affected (0.014 sec)

MariaDB [(none)]> CREATE DATABASE practisenew
    -> CHARACTER SET = 'utf8'
    -> COLLATE = 'utf8_general_ci';
Query OK, 1 row affected (0.008 sec)

MariaDB [(none)]> USE practisenew
Database changed
MariaDB [practisenew]> CREATE TABLE IF NOT EXISTS productsnew ()
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')' at line 1
MariaDB [practisenew]> CREATE TABLE IF NOT EXISTS productsnew (
    -> id INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Код товара',
    -> name CHAR(50) NOT NULL DEFAUKT '' COMMENT 'Название товара',
    -> CONSTRAINT productsnew_PK PRIMARY KEY (id)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''' COMMENT 'Название товара',
CONSTRAINT productsnew_PK PRIMARY...' at line 3
MariaDB [practisenew]> CREATE TABLE IF NOT EXISTS productsnew (
    -> id INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT 'Код товара',
    -> name CHAR(50) NOT NULL DEFAULT '' COMMENT 'Название товара',
    -> CONSTRAINT productsnew_PK PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected, 1 warning (0.015 sec)

MariaDB [practisenew]> CREATE TABLE productNewCopy
    -> SELECT id, name
    -> FROM products;
ERROR 1146 (42S02): Table 'practisenew.products' doesn't exist
MariaDB [practisenew]> CREATE TABLE productNewCopy
    -> SELECT id, name
    -> FROM productsnew;
Query OK, 0 rows affected (0.016 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [practisenew]> DESC productsnewCopy
    -> ;
ERROR 1146 (42S02): Table 'practisenew.productsnewcopy' doesn't exist
MariaDB [practisenew]> DESC productNewCopy;
+-------+------------------+------+-----+---------+-------+
| Field | Type             | Null | Key | Default | Extra |
+-------+------------------+------+-----+---------+-------+
| id    | int(10) unsigned | NO   |     | 0       |       |
| name  | char(50)         | NO   |     |         |       |
+-------+------------------+------+-----+---------+-------+
2 rows in set (0.003 sec)

MariaDB [practisenew]> DROP TABLE productNewCopy;
Query OK, 0 rows affected (0.013 sec)

MariaDB [practisenew]> ALTER TABLE productsnew MODIFY name VARCHAR(50) NOT NUL COMMENT 'Название товара';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'NUL COMMENT 'Название товара'' at line 1
MariaDB [practisenew]> ALTER TABLE productsnew MODIFY name VARCHAR(50) NOT NULL COMMENT 'Название товара';
Query OK, 0 rows affected (0.019 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [practisenew]> ALTER TABLE productsnew ADD price FLOAT(10,2) NOT NULL DEFAULT 0 COMMENT 'Цена товара' AFTER name;
Query OK, 0 rows affected (0.015 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [practisenew]> DESC productsnew;
+-------+------------------+------+-----+---------+----------------+
| Field | Type             | Null | Key | Default | Extra          |
+-------+------------------+------+-----+---------+----------------+
| id    | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(50)      | NO   |     | NULL    |                |
| price | float(10,2)      | NO   |     | 0.00    |                |
+-------+------------------+------+-----+---------+----------------+
3 rows in set (0.009 sec)

MariaDB [practisenew]> SELECT column_name, data_type, column_coment
    -> FROM information_schema.columns
    -> WHERE table_schema = 'module2practise'
    -> AND table_name = 'products';
ERROR 1054 (42S22): Unknown column 'column_coment' in 'field list'
MariaDB [practisenew]> SELECT column_name, data_type, column_comment
    -> FROM information_schema.columns
    -> WHERE table_schema = 'module2practise'
    -> AND table_name = 'products';
+-------------+-----------+-------------------------------+
| column_name | data_type | column_comment                |
+-------------+-----------+-------------------------------+
| id          | int       | Код товара                    |
| name        | varchar   | Название товара               |
| price       | float     | Цена товара                   |
+-------------+-----------+-------------------------------+
3 rows in set (0.003 sec)

MariaDB [practisenew]>


// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


