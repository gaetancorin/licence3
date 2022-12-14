-- MySQL Script generated by MySQL Workbench
-- Fri Nov 18 11:18:28 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema quizz
-- -----------------------------------------------------
-- a databasefor question with multiple choice

-- -----------------------------------------------------
-- Schema quizz
--
-- a databasefor question with multiple choice
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quizz` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `quizz` ;

-- -----------------------------------------------------
-- Table `quizz`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quizz`.`questions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT NOW(),
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quizz`.`choices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quizz`.`choices` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT NOW(),
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL,
  `questions_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_choices_questions_idx` (`questions_id` ASC) VISIBLE,
  CONSTRAINT `fk_choices_questions`
    FOREIGN KEY (`questions_id`)
    REFERENCES `quizz`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
