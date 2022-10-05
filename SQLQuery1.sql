CREATE TABLE People (
  id CHAR(11),
  address VARCHAR(50),
  email VARCHAR(50),
  password VARCHAR(15),
  ime VARCHAR(30),
  city VARCHAR(50) DEFAULT 'Osijek',
  CONSTRAINT people_pk PRIMARY KEY(id)
);

CREATE TABLE Orders(
	id_order CHAR(11), 
	id_user CHAR(11), 
	product CHAR(30),
	total_price DECIMAL,
	CONSTRAINT orders_pk PRIMARY KEY(id_order),
	CONSTRAINT orders_fk FOREIGN KEY (id_user) REFERENCES People(id)
);

CREATE INDEX idx0 ON People(id);

CREATE INDEX idx2 ON Orders(id_order);


INSERT INTO People (id, email, password, city) VALUES ('ASJDGB2', 'peroperic@gmail.com', '1k23123','Osijek');
INSERT INTO People (id, email, password, city) VALUES ('SADGHFS', 'duroduric@gmail.com', 'Golf123','Zagreb');
INSERT INTO People (id, email, password, city) VALUES ('NMNFFND', 'matemilosevic@yahoo.com', 'sifra0303','Rijeka');
INSERT INTO People (id, email, password, city) VALUES ('SDAFHTE', 'kataperkovic@yahoo.com', 'kolac123','Split');
INSERT INTO People (id, email, password, city) VALUES ('HDANFSE', 'ivanivankovic@gmail.com', 'nemamsifru321','Dubrovnik');
INSERT INTO People (id, email, password, city) VALUES ('JHSGDSD', 'ilijailic@gmail.com', 'monitor4251','Nasice');
INSERT INTO People (id, email, password, city) VALUES ('JEZZAVA', 'markomarkic@gmail.com', 'passwad','Pozega');
INSERT INTO People (id, email, password, city) VALUES ('QHMVXCX', 'pericapericic@yahoo.com', 'nekasifranez','Varazdin');
INSERT INTO People (id, email, password, city) VALUES ('QHZJJJF', 'matomatic@gmail.com', 'tipkovnicapassword','Virovitica');

INSERT INTO Orders (id_order, id_user, product, total_price) VALUES ('1', (SELECT id from People WHERE email = 'peroperic@gmail.com'), 'Hamburger',45.99);
INSERT INTO Orders (id_order, id_user, product, total_price) VALUES ('2', (SELECT id from People WHERE email = 'duroduric@gmail.com'), 'Pizza',65.99);
INSERT INTO Orders (id_order, id_user, product, total_price) VALUES ('3', (SELECT id from People WHERE email = 'matemilosevic@yahoo.com'), 'Cevapi',29.99);
INSERT INTO Orders (id_order, id_user, product, total_price) VALUES ('4', (SELECT id from People WHERE email = 'kataperkovic@yahoo.com'), 'Sopska salata',14.99);
INSERT INTO Orders (id_order, id_user, product, total_price) VALUES ('5', (SELECT id from People WHERE email = 'ivanivankovic@gmail.com'), 'Pohani Sir',35.99);
INSERT INTO Orders (id_order, id_user, product, total_price) VALUES ('6', (SELECT id from People WHERE email = 'ilijailic@gmail.com'), 'Kebab',18.99);
INSERT INTO Orders (id_order, id_user, product, total_price) VALUES ('7', (SELECT id from People WHERE email = 'markomarkic@gmail.com'), 'Kebab',18.99);
INSERT INTO Orders (id_order, id_user, product, total_price) VALUES ('8', (SELECT id from People WHERE email = 'pericapericic@yahoo.com'), 'Pohani Sir',35.99);
INSERT INTO Orders (id_order, id_user, product, total_price) VALUES ('9', (SELECT id from People WHERE email = 'matomatic@gmail.com'), 'Sopska salata',14.99);

/*Prikaz tablica*/
SELECT * FROM People;
SELECT * FROM Orders;

UPDATE Orders
SET product = 'Mali Hamburger'
WHERE id_order=1;

DELETE FROM Orders WHERE id_order=9;
DELETE FROM People;

/*Math(count,avg)*/
SELECT AVG(total_price)
FROM Orders;

SELECT COUNT(id_user)
FROM Orders;

/*ALTER TABLE*/
ALTER TABLE People ADD password VARCHAR(30);

ALTER TABLE People DROP COLUMN password; 

ALTER TABLE People ALTER COLUMN password CHAR(50); 

/*ORDER BY*/
SELECT email
FROM People
ORDER BY email DESC;

/*GROUP BY*/
SELECT COUNT(id_order), Product
FROM Orders
GROUP BY Product
ORDER BY COUNT(id_order) ASC;

/*HAVING*/
SELECT COUNT(id_order), Product
FROM Orders
GROUP BY Product
HAVING COUNT(id_order) > 1
ORDER BY COUNT(id_order) DESC;