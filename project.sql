CREATE SCHEMA IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8 ;

use store;

CREATE TABLE IF NOT EXISTS `store`.`User` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(300) NULL DEFAULT NULL,
  `email` VARCHAR(60) NULL DEFAULT NULL,
  `created_date` TIMESTAMP NULL,
  `alter_date` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `store`.`Client` (
  `id` INT  NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `id_user` INT NULL,
  `created_date` TIMESTAMP NULL,
  `alter_date` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_1_idx` (`id_user` ASC) ,
  CONSTRAINT `fk_client_1`
    FOREIGN KEY (`id_user`)
    REFERENCES `store`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `store`.`Product` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `status` INT(1) NULL DEFAULT '1' COMMENT '0 - INACTIVE; 1 - ACTIVE',
  `created_date` TIMESTAMP NULL,
  `alter_date` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `store`.`Orders` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_client` INT(11) NULL DEFAULT NULL,
  `created_date` TIMESTAMP NULL,
  `alter_date` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user1_idx` (`id_client` ASC),
  CONSTRAINT `fk_user1`
    FOREIGN KEY (`id_client`)
    REFERENCES `store`.`Client` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `store`.`OrderItem` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_product` INT(11) NOT NULL,
  `id_Order` INT(11) NOT NULL,
  `amount` INT(2) NULL,
  `created_date` TIMESTAMP NULL,
  `alter_date` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `idProduct_idx` (`id_product` ASC),
  INDEX `idOrder_idx` (`id_Order` ASC),
  CONSTRAINT `idOrder`
    FOREIGN KEY (`id_Order`)
    REFERENCES `store`.`Orders` (`id`),
  CONSTRAINT `idProduct`
    FOREIGN KEY (`id_product`)
    REFERENCES `store`.`Product` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;