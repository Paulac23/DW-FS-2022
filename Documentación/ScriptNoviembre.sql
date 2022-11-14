-- MySQL Script generated by MySQL Workbench
-- Sat Nov  5 14:45:50 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema trueque2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `trueque2` ;

-- -----------------------------------------------------
-- Schema trueque2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trueque2` DEFAULT CHARACTER SET utf8 ;
USE `trueque2` ;

-- -----------------------------------------------------
-- Table `trueque2`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trueque2`.`categorias` (
  `idcategoria` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trueque2`.`provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trueque2`.`provincias` (
  `idprovincia` INT(11) NOT NULL,
  `nombre_provincia` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idprovincia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '	';


-- -----------------------------------------------------
-- Table `trueque2`.`ciudades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trueque2`.`ciudades` (
  `idciudad` INT(11) NOT NULL,
  `nombre_ciudad` VARCHAR(45) NOT NULL,
  `provincia` INT(11) NOT NULL,
  `codigo_postal` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idciudad`),
  CONSTRAINT `provincia`
    FOREIGN KEY (`provincia`)
    REFERENCES `trueque2`.`provincias` (`idprovincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `provincia_idx` ON `trueque2`.`ciudades` (`provincia` ASC);


-- -----------------------------------------------------
-- Table `trueque2`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trueque2`.`personas` (
  `idpersonas` INT(11) NOT NULL,
  `nombres` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `fecha_alta` DATETIME NOT NULL,
  `fecha_mod` DATETIME NULL DEFAULT NULL,
  `fecha_nac` DATETIME NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `ciudad` INT(11) NOT NULL,
  `provincia` INT(11) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idpersonas`),
  CONSTRAINT `ciudad`
    FOREIGN KEY (`ciudad`)
    REFERENCES `trueque2`.`ciudades` (`idciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prov`
    FOREIGN KEY (`provincia`)
    REFERENCES `trueque2`.`provincias` (`idprovincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `ciudad_idx` ON `trueque2`.`personas` (`ciudad` ASC);

CREATE INDEX `provincia_idx` ON `trueque2`.`personas` (`provincia` ASC);


-- -----------------------------------------------------
-- Table `trueque2`.`publicaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trueque2`.`publicaciones` (
  `idpublicacion` INT(11) NOT NULL,
  `categoria` INT(11) NOT NULL,
  `usuario` INT(11) NOT NULL,
  `estado` TINYINT(4) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(1000) NOT NULL,
  `fecha_publicacion` DATETIME NOT NULL,
  `fecha_mod` DATETIME NULL DEFAULT NULL,
  `cantidad` VARCHAR(45) NOT NULL,
  `foto` BLOB NULL DEFAULT NULL,
  `preferencias` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idpublicacion`),
  CONSTRAINT `categoria`
    FOREIGN KEY (`categoria`)
    REFERENCES `trueque2`.`categorias` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `usuario`
    FOREIGN KEY (`usuario`)
    REFERENCES `trueque2`.`personas` (`idpersonas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `categoria_idx` ON `trueque2`.`publicaciones` (`categoria` ASC);

CREATE INDEX `usuario_idx` ON `trueque2`.`publicaciones` (`usuario` ASC);


-- -----------------------------------------------------
-- Table `trueque2`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trueque2`.`roles` (
  `idrol` INT(11) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `trueque2`.`registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trueque2`.`registro` (
  `idregistro` INT(11) NOT NULL,
  `persona` INT(11) NOT NULL,
  `rol` INT(11) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(70) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `estado` TINYINT(4) NOT NULL,
  PRIMARY KEY (`idregistro`),
  CONSTRAINT `persona`
    FOREIGN KEY (`persona`)
    REFERENCES `trueque2`.`personas` (`idpersonas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rol`
    FOREIGN KEY (`rol`)
    REFERENCES `trueque2`.`roles` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `persona_idx` ON `trueque2`.`registro` (`persona` ASC);

CREATE INDEX `rol_idx` ON `trueque2`.`registro` (`rol` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
