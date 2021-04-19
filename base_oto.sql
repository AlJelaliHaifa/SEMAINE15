DROP DATABASE IF EXISTS OTO;

CREATE DATABASE OTO;

USE OTO;

CREATE TABLE CARS(
   car_id INT(11) NOT NULL AUTO_INCREMENT,
   car_serial_number INT NOT NULL,
   car_model VARCHAR(30) NOT NULL,
   car_mark VARCHAR(30) NOT NULL,
   car_year INT NOT NULL,
   car_fuel VARCHAR(30)NOT NULL,
   car_status VARCHAR(30)NOT NULL,
   PRIMARY KEY (car_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE OPTIONS(
   opt_id INT(11) NOT NULL AUTO_INCREMENT,
   opt_color VARCHAR(30)NOT NULL,
   opt_gearbox VARCHAR(30)NOT NULL,
   opt_seats VARCHAR(30)NOT NULL,
   opt_gps tinyint(1) DEFAULT '0',
   opt_extra_airbags tinyint(1) DEFAULT '0',
   opt_security VARCHAR(30)NOT NULL,
   opt_audio VARCHAR(30)NOT NULL,
   opt_conduct VARCHAR(30)NOT NULL,
   opt_saddlery VARCHAR(30)NOT NULL,
   opt_pack VARCHAR(30)NOT NULL,
   PRIMARY KEY (opt_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE CONCESSION(
   con_id INT(11) NOT NULL AUTO_INCREMENT,
   con_name VARCHAR(30)NOT NULL,
   PRIMARY KEY (con_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE GARAGE(
   gar_id INT(11) NOT NULL AUTO_INCREMENT,
   gar_upkeep VARCHAR(30)NOT NULL,
   gar_mending VARCHAR(30)NOT NULL,
   gar_price VARCHAR(30)NOT NULL,
   con_id INT NOT NULL,
   PRIMARY KEY (gar_id),
   FOREIGN KEY (con_id) REFERENCES CONCESSION (con_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE EMPLOYEES(
   emp_id INT(11) NOT NULL AUTO_INCREMENT,
   emp_firstname VARCHAR(30)NOT NULL,
   emp_lastname VARCHAR(30)NOT NULL,
   emp_particular tinyint(1) DEFAULT '0',
   emp_professional tinyint(1) DEFAULT '0',
   con_id INT NOT NULL,
   PRIMARY KEY (emp_id),
   FOREIGN KEY (con_id) REFERENCES CONCESSION (con_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;


CREATE TABLE CUSTOMERS(
   cus_id INT(11) NOT NULL AUTO_INCREMENT,
   cus_name VARCHAR(30)NOT NULL,
   cus_adress VARCHAR(30)NOT NULL,
   cus_zipcode INT NOT NULL,
   cus_mail VARCHAR(30)NOT NULL,
   cus_city VARCHAR(30)NOT NULL,
   cus_particular tinyint(1) DEFAULT '0',
   cus_professionnal tinyint(1) DEFAULT '0',
   cus_salary DECIMAL(10,2) DEFAULT 0.00,
   emp_id INT NOT NULL,
   PRIMARY KEY (cus_id),
   FOREIGN KEY (emp_id) REFERENCES EMPLOYEES (emp_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE ACCESSORIES(
   acc_id INT(11) NOT NULL AUTO_INCREMENT,
   acc_type VARCHAR(30)NOT NULL,
   acc_label VARCHAR(30)NOT NULL,
   gar_id INT NOT NULL,
   PRIMARY KEY (acc_id),
   FOREIGN KEY (gar_id) REFERENCES GARAGE (gar_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE EQUIPPING(
   car_id INT,
   opt_id INT NOT NULL,
   options_price INT NOT NULL,
   PRIMARY KEY (car_id, opt_id),
   FOREIGN KEY (car_id) REFERENCES CARS (car_id),
   FOREIGN KEY (opt_id) REFERENCES OPTIONS (opt_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

CREATE TABLE BUY(
   car_id INT NOT NULL,
   cus_id INT NOT NULL,
   price INT NOT NULL,
   cash_payement tinyint(1) DEFAULT '0',
   payement_on_credit tinyint(1) DEFAULT '0',
   PRIMARY KEY (car_id, cus_id),
   FOREIGN KEY (car_id) REFERENCES CARS (car_id),
   FOREIGN KEY (cus_id) REFERENCES CUSTOMERS (cus_id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;
