-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema movie_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `movie_db` ;

-- -----------------------------------------------------
-- Schema movie_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movie_db` DEFAULT CHARACTER SET utf8 ;
USE `movie_db` ;

-- -----------------------------------------------------
-- Table `countries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `countries` ;

CREATE TABLE IF NOT EXISTS `countries` (
  `country_id` TINYINT UNSIGNED NOT NULL,
  `country_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies` ;

CREATE TABLE IF NOT EXISTS `movies` (
  `movie_id` TINYINT UNSIGNED NOT NULL,
  `title` VARCHAR(90) NOT NULL,
  `ranking` TINYINT UNSIGNED NOT NULL,
  `rating` FLOAT UNSIGNED NOT NULL,
  `year` YEAR NOT NULL,
  `votes` MEDIUMINT UNSIGNED NOT NULL,
  `duration` SMALLINT UNSIGNED NOT NULL,
  `oscars` TINYINT UNSIGNED NULL,
  `budget` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `producer_countries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `producer_countries` ;

CREATE TABLE IF NOT EXISTS `producer_countries` (
  `movie_id` TINYINT UNSIGNED NOT NULL,
  `country_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_id`, `country_id`),
  CONSTRAINT `fk_producer_countries_movies`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producer_countries_countries1`
    FOREIGN KEY (`country_id`)
    REFERENCES `countries` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_producer_countries_movies_idx` ON `producer_countries` (`movie_id` ASC) VISIBLE;

CREATE INDEX `fk_producer_countries_countries1_idx` ON `producer_countries` (`country_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `languages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `languages` ;

CREATE TABLE IF NOT EXISTS `languages` (
  `movie_id` TINYINT UNSIGNED NOT NULL,
  `language_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`movie_id`, `language_name`),
  CONSTRAINT `fk_languages_movies1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_languages_movies1_idx` ON `languages` (`movie_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `directors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `directors` ;

CREATE TABLE IF NOT EXISTS `directors` (
  `director_id` TINYINT UNSIGNED NOT NULL,
  `country_id` TINYINT UNSIGNED NOT NULL,
  `director_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`director_id`),
  CONSTRAINT `fk_directors_countries1`
    FOREIGN KEY (`country_id`)
    REFERENCES `countries` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_directors_countries1_idx` ON `directors` (`country_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `movie_directors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie_directors` ;

CREATE TABLE IF NOT EXISTS `movie_directors` (
  `movie_id` TINYINT UNSIGNED NOT NULL,
  `director_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_id`, `director_id`),
  CONSTRAINT `fk_movie_directors_movies1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_directors_directors1`
    FOREIGN KEY (`director_id`)
    REFERENCES `directors` (`director_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_movie_directors_movies1_idx` ON `movie_directors` (`movie_id` ASC) VISIBLE;

CREATE INDEX `fk_movie_directors_directors1_idx` ON `movie_directors` (`director_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `stars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stars` ;

CREATE TABLE IF NOT EXISTS `stars` (
  `star_id` SMALLINT UNSIGNED NOT NULL,
  `country_id` TINYINT UNSIGNED NOT NULL,
  `star_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`star_id`),
  CONSTRAINT `fk_stars_countries1`
    FOREIGN KEY (`country_id`)
    REFERENCES `countries` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_stars_countries1_idx` ON `stars` (`country_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `movie_stars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie_stars` ;

CREATE TABLE IF NOT EXISTS `movie_stars` (
  `movie_id` TINYINT UNSIGNED NOT NULL,
  `star_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_id`, `star_id`),
  CONSTRAINT `fk_movie_stars_movies1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_stars_stars1`
    FOREIGN KEY (`star_id`)
    REFERENCES `stars` (`star_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_movie_stars_movies1_idx` ON `movie_stars` (`movie_id` ASC) VISIBLE;

CREATE INDEX `fk_movie_stars_stars1_idx` ON `movie_stars` (`star_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `genres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genres` ;

CREATE TABLE IF NOT EXISTS `genres` (
  `movie_id` TINYINT UNSIGNED NOT NULL,
  `genre_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`movie_id`, `genre_name`),
  CONSTRAINT `fk_genres_movies1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_genres_movies1_idx` ON `genres` (`movie_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
