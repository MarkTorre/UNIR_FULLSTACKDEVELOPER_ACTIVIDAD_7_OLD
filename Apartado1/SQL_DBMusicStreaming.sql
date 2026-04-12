-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DBMusicStreaming
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DBMusicStreaming
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DBMusicStreaming` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `DBMusicStreaming` ;

-- -----------------------------------------------------
-- Table `DBMusicStreaming`.`artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBMusicStreaming`.`artistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `foto` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `foto_UNIQUE` (`foto` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `DBMusicStreaming`.`albumes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBMusicStreaming`.`albumes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(50) NOT NULL,
  `discografica` VARCHAR(50) NOT NULL,
  `año` YEAR NOT NULL,
  `fk_artistas` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_albumes_artistas1_idx` (`fk_artistas` ASC) VISIBLE,
  CONSTRAINT `fk_albumes_artistas1`
    FOREIGN KEY (`fk_artistas`)
    REFERENCES `DBMusicStreaming`.`artistas` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `DBMusicStreaming`.`canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBMusicStreaming`.`canciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(50) NOT NULL,
  `genero` VARCHAR(50) NOT NULL,
  `año` YEAR NOT NULL,
  `fk_albumes` INT NOT NULL,
  `cancionescol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_canciones_albumes1_idx` (`fk_albumes` ASC) VISIBLE,
  CONSTRAINT `fk_canciones_albumes1`
    FOREIGN KEY (`fk_albumes`)
    REFERENCES `DBMusicStreaming`.`albumes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `DBMusicStreaming`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBMusicStreaming`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `contraseña` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `contraseña_UNIQUE` (`contraseña` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `DBMusicStreaming`.`listas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBMusicStreaming`.`listas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `fk_usuarios` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_listas_usuarios_idx` (`fk_usuarios` ASC) VISIBLE,
  CONSTRAINT `fk_listas_usuarios`
    FOREIGN KEY (`fk_usuarios`)
    REFERENCES `DBMusicStreaming`.`usuarios` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `DBMusicStreaming`.`tbi_listas_canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBMusicStreaming`.`tbi_listas_canciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fk_listas` INT NOT NULL,
  `fk_canciones` INT NOT NULL,
  INDEX `fk_listas_has_canciones_canciones1_idx` (`fk_canciones` ASC) VISIBLE,
  INDEX `fk_listas_has_canciones_listas1_idx` (`fk_listas` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_listas_has_canciones_listas1`
    FOREIGN KEY (`fk_listas`)
    REFERENCES `DBMusicStreaming`.`listas` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_listas_has_canciones_canciones1`
    FOREIGN KEY (`fk_canciones`)
    REFERENCES `DBMusicStreaming`.`canciones` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `DBMusicStreaming`.`tbi_usuarios_canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBMusicStreaming`.`tbi_usuarios_canciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fk_usuarios` INT NOT NULL,
  `fk_canciones` INT NOT NULL,
  INDEX `fk_usuarios_has_canciones_canciones1_idx` (`fk_canciones` ASC) VISIBLE,
  INDEX `fk_usuarios_has_canciones_usuarios1_idx` (`fk_usuarios` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_usuarios_has_canciones_usuarios1`
    FOREIGN KEY (`fk_usuarios`)
    REFERENCES `DBMusicStreaming`.`usuarios` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_usuarios_has_canciones_canciones1`
    FOREIGN KEY (`fk_canciones`)
    REFERENCES `DBMusicStreaming`.`canciones` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
