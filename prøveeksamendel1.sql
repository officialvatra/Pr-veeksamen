-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `idUsers` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `Userscol` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `Role` ENUM('Admin', 'User') NOT NULL,
  PRIMARY KEY (`idUsers`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  UNIQUE INDEX `Userscol_UNIQUE` (`Userscol` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categories` (
  `idCategories` INT NOT NULL AUTO_INCREMENT,
  `nameCategories` ENUM('Faktura', 'Support', 'Vedlikehold', 'Programvarelisens') NOT NULL,
  PRIMARY KEY (`idCategories`),
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tickets` (
  `idTickets` INT NOT NULL AUTO_INCREMENT,
  `idUsers` INT NULL,
  `idCategories` INT NULL,
  `Status` ENUM('Open', 'CLosed')
  PRIMARY KEY (`idTickets`),
  UNIQUE INDEX `idTickets_UNIQUE` (`idTickets` ASC) ,
  INDEX `fk_Tickets_Users_idx` (`idUsers` ASC) ,
  INDEX `fk_Tickets_Categories1_idx` (`idCategories` ASC) ,
  CONSTRAINT `fk_Tickets_Users`
    FOREIGN KEY (`idUsers`)
    REFERENCES `mydb`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tickets_Categories1`
    FOREIGN KEY (`idCategories`)
    REFERENCES `mydb`.`Categories` (`idCategories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

