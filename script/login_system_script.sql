SHOW DATABASES;
CREATE DATABASE login;
USE login;
CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(16) NOT NULL,
    address VARCHAR(200),
    phoneNumber BIGINT NOT NULL,
    email  VARCHAR(50)
);
DESCRIBE users;
INSERT INTO users(name, password, phoneNumber) VALUES('admin', 'admin', 9857487895);
INSERT INTO users(name, password, address, phoneNumber, email) VALUES('akash', 1234, null, 7895468514, 'akash@gmail.com');
INSERT INTO users(name, password, address, phoneNumber, email) VALUES('amit', 0123, null, 9857454789, null);

SELECT * FROM users;