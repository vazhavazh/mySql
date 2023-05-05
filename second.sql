-- Создание базы данных
CREATE DATABASE module3 
    CHARACTER SET = 'utf8'
  COLLATE = 'utf8_general_ci';

USE module3

-- Удаление таблицы
DROP TABLE IF EXISTS table1;

-- Создание таблицы с помощью описания
CREATE TABLE table1
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Код товара',
    name VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Название товара',
    price FLOAT NOT NULL DEFAULT 0 COMMENT 'Цена товара',
    PRIMARY KEY (id)
) COMMENT 'Таблица товаров с первичным ключем';

-- Создание индекса
CREATE INDEX table1_name_ix ON table1 (name);
CREATE INDEX table1_price_ix ON table1 (price);
/*
    Может быть не только колонка, а так же группа колонок или целая функция. 
*/
-- Удаление индексов
DROP INDEX table1_price_ix ON table1;

-- Создание индекса при создании таблицы.
DROP TABLE IF EXISTS table2;
CREATE TABLE table2
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Код товара',
    code char(4) NOT NULL DEFAULT 'AAAA',
    name VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Название товара',
    price FLOAT NOT NULL DEFAULT 0 COMMENT 'Цена товара',
    description TEXT NOT NULL DEFAULT '' COMMENT 'Описание товара',
    CONSTRAINT table2_id_pk PRIMARY KEY (id),
    CONSTRAINT table2_code_un UNIQUE KEY (code),
    INDEX table2_name_ix(name),
    INDEX table2_price_ix(price)
) COMMENT 'Таблица товаров с ключами и индексами';

DROP TABLE IF EXISTS children;
CREATE TABLE children
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Код записи',
    code char(4) NOT NULL DEFAULT 'AAAA' COMMENT 'код товара',
    que FLOAT NOT NULL DEFAULT 0 COMMENT 'Приход/расход товара',
    CONSTRAINT children_id_pk PRIMARY KEY (id),
    INDEX children_code_ix (code),
    CONSTRAINT children_code_fk FOREIGN KEY (code)
        REFERENCES table2 (code) 
) COMMENT 'Таблица товаров с ключами и индексами';
/*
    CONSTRAINT children_code_fk FOREIGN KEY (code)
        REFERENCES table2 (code) Поле code ссылается на поле code в таблице table2
    Если задать ON DELETE CASCADE то при удалении с table2 кода в таблице children удалятся все связанные с данным кодом записи.
*/

-- Добавить товар
INSERT INTO table2 (code, name, price, description)
    VALUE ('ZZZZ', 'Проба', 16.8, 'Описание товара');

-- Добавить товар с тем же артиклем
INSERT INTO table2 (code, name, price)
    VALUE ('ZZZZ', 'Ошибочная проба', 16.8, 'Описание товара');

-- Приход товара
INSERT INTO children (code, que)
    VALUE ('ZZZZ', 10);

-- Ошибка прихода товара
INSERT INTO children (code, que)
    VALUE ('XXXX', 10);
    
    -- Полнотекстовый индекс
CREATE FULLTEXT INDEX table2_code_ix ON table2 (name, description);