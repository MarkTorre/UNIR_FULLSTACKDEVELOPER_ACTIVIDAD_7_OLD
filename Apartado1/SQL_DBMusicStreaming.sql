-- MySQL Workbench Synchronization
-- Generated: 2026-04-20 19:27
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: artma

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `dbmusicstreaming`.`canciones` 
DROP COLUMN `fk_albumes`,
ADD COLUMN `fk_albumes` INT(11) NOT NULL AFTER `año`,
ADD INDEX `fk_canciones_albumes_idx` (`fk_albumes` ASC) VISIBLE,
DROP INDEX `fk_canciones_albumes_idx` ;
;

ALTER TABLE `dbmusicstreaming`.`listas` 
DROP COLUMN `fk_usuarios`,
ADD COLUMN `fk_usuarios` INT(11) NOT NULL AFTER `nombre`,
ADD INDEX `fk_listas_usuarios_idx` (`fk_usuarios` ASC) VISIBLE,
DROP INDEX `fk_listas_usuarios_idx` ;
;

ALTER TABLE `dbmusicstreaming`.`albumes` 
DROP COLUMN `fk_artistas`,
ADD COLUMN `fk_artistas` INT(11) NOT NULL AFTER `año`,
ADD INDEX `fk_albumes_artistas_idx` (`fk_artistas` ASC) VISIBLE,
DROP INDEX `fk_albumes_artistas_idx` ;
;

CREATE TABLE IF NOT EXISTS `dbmusicstreaming`.`listas_canciones` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fk_listas` INT(11) NOT NULL,
  `fk_canciones` INT(11) NOT NULL,
  INDEX `fk_listas_has_canciones_canciones_idx` (`fk_canciones` ASC) VISIBLE,
  INDEX `fk_listas_has_canciones_listas_idx` (`fk_listas` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_listas_has_canciones_listas`
    FOREIGN KEY (`fk_listas`)
    REFERENCES `dbmusicstreaming`.`listas` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_listas_has_canciones_canciones`
    FOREIGN KEY (`fk_canciones`)
    REFERENCES `dbmusicstreaming`.`canciones` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `dbmusicstreaming`.`usuarios_canciones` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fk_usuarios` INT(11) NOT NULL,
  `fk_canciones` INT(11) NOT NULL,
  INDEX `fk_usuarios_has_canciones_canciones_idx` (`fk_canciones` ASC) VISIBLE,
  INDEX `fk_usuarios_has_canciones_usuarios_idx` (`fk_usuarios` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_usuarios_has_canciones_usuarios1`
    FOREIGN KEY (`fk_usuarios`)
    REFERENCES `dbmusicstreaming`.`usuarios` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_usuarios_has_canciones_canciones1`
    FOREIGN KEY (`fk_canciones`)
    REFERENCES `dbmusicstreaming`.`canciones` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `dbmusicstreaming`.`listas_canciones` ;

ALTER TABLE `dbmusicstreaming`.`canciones` 
ADD CONSTRAINT `fk_canciones_albumes`
  FOREIGN KEY (`fk_albumes`)
  REFERENCES `dbmusicstreaming`.`albumes` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `dbmusicstreaming`.`listas` 
ADD CONSTRAINT `fk_listas_usuarios`
  FOREIGN KEY (`fk_usuarios`)
  REFERENCES `dbmusicstreaming`.`usuarios` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `dbmusicstreaming`.`albumes` 
ADD CONSTRAINT `fk_albumes_artistas`
  FOREIGN KEY (`fk_artistas`)
  REFERENCES `dbmusicstreaming`.`artistas` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
