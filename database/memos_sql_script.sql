-- MySQL Script generated by MySQL Workbench
-- Fri Jun 29 12:43:48 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema memos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema memos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `memos` DEFAULT CHARACTER SET utf8 ;
USE `memos` ;

-- -----------------------------------------------------
-- Table `memos`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `memos`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` CHAR(80) NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `memos`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `memos`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `memos`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `memos`.`user_role` (
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  INDEX `fk_user_has_role_role1_idx` (`role_id` ASC),
  INDEX `fk_user_has_role_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_role_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `memos`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_role_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `memos`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `memos`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `memos`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `memos`.`memo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `memos`.`memo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `description` MEDIUMTEXT NULL,
  `datetime` DATETIME NULL,
  `category_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_memo_category1_idx` (`category_id` ASC),
  INDEX `fk_memo_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_memo_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `memos`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_memo_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `memos`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
