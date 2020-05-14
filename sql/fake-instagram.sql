CREATE SCHEMA IF NOT EXISTS `fakeinstagram` DEFAULT CHARACTER SET utf8 ;
USE `fakeinstagram` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE users (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(192) ,
  `email` VARCHAR(192)  UNIQUE,
  `username` VARCHAR(45) UNIQUE,
  `password` VARCHAR(192) ,
  `avatar` VARCHAR(192),
  `create_at` DATETIME,
  `update_at` DATETIME
  );


-- -----------------------------------------------------
-- Table `mydb`.`publications`
-- -----------------------------------------------------
CREATE TABLE publications(
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `image` VARCHAR(192),
  `like` INT,
  `create_at`DATETIME,
  `update_at` DATETIME,
  `users_id` INT NOT NULL,
    FOREIGN KEY (users_id) REFERENCES users (id)
    );


-- -----------------------------------------------------
-- Table `mydb`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS comments (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `description` TEXT,
  `create_at` DATETIME,
  `update_at` DATETIME,
  `users_id` INT,
  `publications_id` INT NOT NULL,
	FOREIGN KEY (publications_id)
	REFERENCES publications (id),
    
	FOREIGN KEY (users_id) 
	REFERENCES users(id)
)

