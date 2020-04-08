-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab7_smallhotelreservations
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab7_smallhotelreservations
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab7_smallhotelreservations` DEFAULT CHARACTER SET utf8 ;
USE `lab7_smallhotelreservations` ;

-- -----------------------------------------------------
-- Table `lab7_smallhotelreservations`.`guest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab7_smallhotelreservations`.`guest` (
  `guest_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `guest_firstname` VARCHAR(45) NOT NULL,
  `guest_lastname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`guest_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab7_smallhotelreservations`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab7_smallhotelreservations`.`room` (
  `room_id` INT NOT NULL,
  `room_number` INT NULL,
  `room_price` INT NULL,
  `room_type` INT NULL,
  PRIMARY KEY (`room_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab7_smallhotelreservations`.`room_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab7_smallhotelreservations`.`room_type` (
  `room_id` INT NOT NULL,
  `room_description` VARCHAR(45) NULL,
  `room_size` VARCHAR(45) NULL,
  PRIMARY KEY (`room_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab7_smallhotelreservations`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab7_smallhotelreservations`.`reservation` (
  `reservation_number` INT NOT NULL,
  `guest_id` INT NULL,
  `length_stay` INT NULL,
  `room` INT NULL,
  `room_type` VARCHAR(45) NULL,
  `reservation_reservation_number` INT NOT NULL,
  `guest_guest_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`reservation_number`),
  UNIQUE INDEX `idreservation_UNIQUE` (`reservation_number` ASC) VISIBLE,
  INDEX `fk_reservation_guest1_idx` (`guest_guest_id` ASC) VISIBLE,
  CONSTRAINT `fk_reservation_guest1`
    FOREIGN KEY (`guest_guest_id`)
    REFERENCES `lab7_smallhotelreservations`.`guest` (`guest_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
