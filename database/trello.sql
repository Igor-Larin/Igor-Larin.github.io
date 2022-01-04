-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `iduser` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `url` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cards` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cards` (
  `idcard` INT NOT NULL,
  `user_iduser` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcard`, `user_iduser`),
  INDEX `fk_cards_user1_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_cards_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `mydb`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tasks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tasks` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tasks` (
  `idtask` INT NOT NULL,
  `cards_idcard` INT NOT NULL,
  `cards_user_iduser` INT NOT NULL,
  `timelimit` INT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`idtask`, `cards_idcard`, `cards_user_iduser`),
  INDEX `fk_tasks_cards1_idx` (`cards_idcard` ASC, `cards_user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_tasks_cards1`
    FOREIGN KEY (`cards_idcard` , `cards_user_iduser`)
    REFERENCES `mydb`.`cards` (`idcard` , `user_iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`authorisation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`authorisation` ;

CREATE TABLE IF NOT EXISTS `mydb`.`authorisation` (
  `idauthorisation` INT NOT NULL,
  `user_iduser` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idauthorisation`, `user_iduser`),
  INDEX `fk_authorisation_user_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_authorisation_user`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `mydb`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
