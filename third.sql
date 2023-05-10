--module3.clients definition

-- CREATE TABLE clientsNew (
--   id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
--   name VARCHAR(100) NOT NULL,
--   birthday DATE NOT NULL,
--   salary FLOAT(12,2) NOT NULL,
--   gender ENUM('MAN', 'WOMAN') NOT NULL DEFAULT 'MAN',
--   PRIMARY KEY (id)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 24
Server version: 10.11.2-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> my database
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'my database' at line 1
MariaDB [(none)]> SHOW DATABASE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'DATABASE' at line 1
MariaDB [(none)]> SHOW DATABASES;
+---------------------+
| Database            |
+---------------------+
| information_schema  |
| module2practise     |
| module3             |
| mysql               |
| new_test_super_mega |
| performance_schema  |
| practisenew         |
| sys                 |
+---------------------+
8 rows in set (0.002 sec)

MariaDB [(none)]> USE practisenew
Database changed
MariaDB [practisenew]> CREATE TABLE IF NOT EXISTS users (
    ->     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ->     name VARCHAR(50) NOT NULL,
    ->     phone VARCHAR(50) NOT NULL,
    ->     CONSTRAINT users_PK PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected, 1 warning (0.016 sec)

MariaDB [practisenew]> DESC users
    -> ;
+-------+------------------+------+-----+---------+----------------+
| Field | Type             | Null | Key | Default | Extra          |
+-------+------------------+------+-----+---------+----------------+
| id    | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(50)      | NO   |     | NULL    |                |
| phone | varchar(50)      | NO   |     | NULL    |                |
+-------+------------------+------+-----+---------+----------------+
3 rows in set (0.011 sec)

MariaDB [practisenew]> DROP users
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'users' at line 1
MariaDB [practisenew]> DROP TABLE users;
Query OK, 0 rows affected (0.014 sec)

MariaDB [practisenew]> REFRESH
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'REFRESH' at line 1
MariaDB [practisenew]> SELECT id, name, phone
    ->   FROM users
    ->   ORDER BY id DESC
    ->   LIMIT 1;
+-------+----------------+--------------+
| id    | name           | phone        |
+-------+----------------+--------------+
| 10000 | Prof. Lou West | 960-257-6548 |
+-------+----------------+--------------+
1 row in set (0.000 sec)

MariaDB [practisenew]> SELECT id, name, phone
    -> FROM users
    -> WHERE name = 'Prof. Lou West';
+-------+----------------+--------------+
| id    | name           | phone        |
+-------+----------------+--------------+
| 10000 | Prof. Lou West | 960-257-6548 |
+-------+----------------+--------------+
1 row in set (0.004 sec)

MariaDB [practisenew]> WHERE name = 'Prof. Lou West';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'WHERE name = 'Prof. Lou West'' at line 1
MariaDB [practisenew]> SELECT id, name, phone
    ->     -> FROM users
    ->     -> WHERE name = 'Prof. Lou West';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '> FROM users
    -> WHERE name = 'Prof. Lou West'' at line 2
MariaDB [practisenew]> SELECT id, name, phone
    ->     -> FROM users
    ->     -> WHERE name = 'Prof. Lou West';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '> FROM users
    -> WHERE name = 'Prof. Lou West'' at line 2
MariaDB [practisenew]> SELECT * FROM users WHERE name = 'Prof. Lou West';
+-------+----------------+--------------+
| id    | name           | phone        |
+-------+----------------+--------------+
| 10000 | Prof. Lou West | 960-257-6548 |
+-------+----------------+--------------+
1 row in set (0.003 sec)

MariaDB [practisenew]> SELECT * FROM users WHERE name = 'Prof. Lou West';
+-------+----------------+--------------+
| id    | name           | phone        |
+-------+----------------+--------------+
| 10000 | Prof. Lou West | 960-257-6548 |
+-------+----------------+--------------+
1 row in set (0.003 sec)

MariaDB [practisenew]> SELECT * FROM users WHERE name = 'Prof. Lou West';
+-------+----------------+--------------+
| id    | name           | phone        |
+-------+----------------+--------------+
| 10000 | Prof. Lou West | 960-257-6548 |
+-------+----------------+--------------+
1 row in set (0.004 sec)

MariaDB [practisenew]> SELECT * FROM users WHERE name = 'Prof. Lou West';
+-------+----------------+--------------+
| id    | name           | phone        |
+-------+----------------+--------------+
| 10000 | Prof. Lou West | 960-257-6548 |
+-------+----------------+--------------+
1 row in set (0.003 sec)

MariaDB [practisenew]> CREATE CREATE INDEX users_name_ix ON users (name);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'CREATE INDEX users_name_ix ON users (name)' at line 1
MariaDB [practisenew]> CREATE INDEX users_name_ix ON users (name);
Query OK, 0 rows affected (0.030 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [practisenew]> SELECT id, name, phone
    ->   FROM users
    ->   WHERE
    ->     name = 'Jacklyn Turcotte';
+----+------------------+--------------+
| id | name             | phone        |
+----+------------------+--------------+
| 19 | Jacklyn Turcotte | 245.521.6664 |
+----+------------------+--------------+
1 row in set (0.001 sec)

MariaDB [practisenew]> EXPLAIN
    -> SELECT id, name, phone
    -> FROM users
    -> WHERE
    -> name = Jacklyn Turcotte;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Turcotte' at line 5
MariaDB [practisenew]> EXPLAIN
    -> SELECT id, name, phone
    -> FROM users
    -> WHERE
    -> name = Jacklyn Turcotte;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Turcotte' at line 5
MariaDB [practisenew]> EXPLAIN
    -> SELECT id, name, phone
    -> FROM users
    -> WHERE
    ->
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 4
MariaDB [practisenew]> EXPLAIN
    -> SELECT id, name, phone
    -> FROM users
    -> WHERE
    -> name = 'Jacklyn Turcotte'\G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: users
         type: ref
possible_keys: users_name_ix
          key: users_name_ix
      key_len: 202
          ref: const
         rows: 1
        Extra: Using index condition
1 row in set (0.007 sec)

MariaDB [practisenew]> CREATE TABLE IF NOT EXISTS orders (
    ->     id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    ->     userId INT UNSIGNED NOT NULL,
    ->     productId INT UNSIGNED NOT NULL,
    ->     note TEXT NULL DEFAULT NULL,
    ->     date DATETIME DEFAULT NOW(),
    ->     CONSTRAINT users_PK PRIMARY KEY (id),
    ->     CONSTRAINT orders_userId_fk FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE,
    ->     CONSTRAINT orders_productId_fk FOREIGN KEY (productId) REFERENCES products(id) ON DELETE CASCADE
    -> );
ERROR 1005 (HY000): Can't create table `practisenew`.`orders` (errno: 150 "Foreign key constraint is incorrectly formed")
MariaDB [practisenew]> CREATE TABLE IF NOT EXISTS orders (
    ->     id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    ->     userId INT UNSIGNED NOT NULL,
    ->     productId INT UNSIGNED NOT NULL,
    ->     note TEXT NULL DEFAULT NULL,
    ->     date DATETIME DEFAULT NOW(),
    ->     CONSTRAINT users_PK PRIMARY KEY (id),
    ->     CONSTRAINT orders_userId_fk FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE,
    ->     CONSTRAINT orders_productId_fk FOREIGN KEY (productId) REFERENCES products(id) ON DELETE CASCADE
    -> );  CONSTRAINT orders_productId_fk FOREIGN KEY (productId) REFERENCES pro
ERROR 1005 (HY000): Can't create table `practisenew`.`orders` (errno: 150 "Foreign key constraint is incorrectly formed")
    ->
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'CONSTRAINT orders_productId_fk FOREIGN KEY (productId) REFERENCES pro' at line 1
MariaDB [practisenew]> CREATE TABLE IF NOT EXISTS orders (
    ->     id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    ->     userId INT UNSIGNED NOT NULL,
    ->     productId INT UNSIGNED NOT NULL,
    ->     note TEXT NULL DEFAULT NULL,
    ->     date DATETIME DEFAULT NOW(),
    ->     CONSTRAINT users_PK PRIMARY KEY (id),
    ->     CONSTRAINT orders_userId_fk FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE,
    ->     CONSTRAINT orders_productId_fk FOREIGN KEY (productId) REFERENCES products(id) ON DELETE CASCADE
    -> );
ERROR 1005 (HY000): Can't create table `practisenew`.`orders` (errno: 150 "Foreign key constraint is incorrectly formed")
MariaDB [practisenew]> CREATE TABLE IF NOT EXISTS orders (
    ->     id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    ->     userId INT UNSIGNED NOT NULL,
    ->     productId INT UNSIGNED NOT NULL,
    ->     note TEXT NULL DEFAULT NULL,
    ->     date DATETIME DEFAULT NOW(),
    ->     CONSTRAINT users_PK PRIMARY KEY (id),
    ->     CONSTRAINT orders_userId_fk FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE,
    ->     CONSTRAINT orders_productId_fk FOREIGN KEY (productId) REFERENCES products(id) ON DELETE CASCADE
    -> );
ERROR 1005 (HY000): Can't create table `practisenew`.`orders` (errno: 150 "Foreign key constraint is incorrectly formed")
MariaDB [practisenew]> CREATE TABLE IF NOT EXISTS orders (
    ->     id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    ->     userId INT UNSIGNED NOT NULL,
    ->     productId INT UNSIGNED NOT NULL,
    ->     note TEXT NULL DEFAULT NULL,
    ->     date DATETIME DEFAULT NOW(),
    ->     CONSTRAINT users_PK PRIMARY KEY (id),
    ->     CONSTRAINT orders_userId_fk FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE,
    ->     CONSTRAINT orders_productId_fk FOREIGN KEY (productId) REFERENCES products(id) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected, 1 warning (0.018 sec)

MariaDB [practisenew]> DESC orders;
+-----------+------------------+------+-----+---------------------+----------------+
| Field     | Type             | Null | Key | Default             | Extra          |
+-----------+------------------+------+-----+---------------------+----------------+
| id        | int(10) unsigned | NO   | PRI | NULL                | auto_increment |
| userId    | int(10) unsigned | NO   | MUL | NULL                |                |
| productId | int(10) unsigned | NO   | MUL | NULL                |                |
| note      | text             | YES  |     | NULL                |                |
| date      | datetime         | YES  |     | current_timestamp() |                |
+-----------+------------------+------+-----+---------------------+----------------+
5 rows in set (0.010 sec)

MariaDB [practisenew]>