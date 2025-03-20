-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema acedemia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema acedemia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `acedemia` DEFAULT CHARACTER SET utf8 ;
USE `acedemia` ;

-- -----------------------------------------------------
-- Table `acedemia`.`estudiantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acedemia`.`estudiantes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL,
  `apellido` VARCHAR(255) NULL,
  `dni` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acedemia`.`asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acedemia`.`asignaturas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `matematicas` VARCHAR(255) NULL,
  `quimica` VARCHAR(255) NULL,
  `fisica` VARCHAR(255) NULL,
  `deporte` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acedemia`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acedemia`.`notas` (
  `id` INT NOT NULL,
  `id1` INT NOT NULL,
  `nota` INT NOT NULL,
  PRIMARY KEY (`id`, `id1`),
  INDEX `fk_estudiantes_has_asignaturas_asignaturas1_idx` (`id1` ASC) ,
  INDEX `fk_estudiantes_has_asignaturas_estudiantes_idx` (`id` ASC) ,
  CONSTRAINT `fk_estudiantes_has_asignaturas_estudiantes`
    FOREIGN KEY (`id`)
    REFERENCES `acedemia`.`estudiantes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estudiantes_has_asignaturas_asignaturas1`
    FOREIGN KEY (`id1`)
    REFERENCES `acedemia`.`asignaturas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
