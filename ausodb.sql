-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ausodb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ausodb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ausodb` DEFAULT CHARACTER SET utf8 ;
USE `ausodb` ;

-- -----------------------------------------------------
-- Table `ausodb`.`faculty_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ausodb`.`faculty_info` (
  `Faculty_Code` VARCHAR(2) NOT NULL,
  `Faculty_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Faculty_Code`),
  UNIQUE INDEX `Faculty_Name_UNIQUE` (`Faculty_Name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ausodb`.`position_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ausodb`.`position_info` (
  `Role_Code` VARCHAR(2) NOT NULL,
  `Role_Name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Role_Code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ausodb`.`project_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ausodb`.`project_info` (
  `No` INT(11) NOT NULL AUTO_INCREMENT,
  `Project_ID` VARCHAR(45) NOT NULL,
  `Proeject Title` VARCHAR(50) NOT NULL,
  `Project Type` VARCHAR(45) NOT NULL,
  `Project Level` VARCHAR(45) NOT NULL,
  `Semester` VARCHAR(45) NOT NULL,
  `Startdate` DATE NOT NULL,
  `Enddate` DATE NOT NULL,
  `Venue Name` VARCHAR(45) NOT NULL,
  `Expected Participant` VARCHAR(45) NOT NULL,
  `KPI` VARCHAR(300) NOT NULL,
  `Goal` VARCHAR(300) NOT NULL,
  `Method` VARCHAR(300) NOT NULL,
  `Expected Outcome` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`No`, `Project_ID`),
  INDEX `ProjectID_idx` (`Project_ID` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ausodb`.`isprogress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ausodb`.`isprogress` (
  `No` INT(11) NOT NULL AUTO_INCREMENT,
  `Project_ID` VARCHAR(45) NOT NULL,
  `FromRoleCode` VARCHAR(2) NOT NULL,
  `ToRoleCode` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`No`),
  INDEX `ProjectInfo_idx` (`Project_ID` ASC),
  INDEX `FromPosition_idx` (`FromRoleCode` ASC),
  INDEX `ToPosition_idx` (`ToRoleCode` ASC),
  CONSTRAINT `FromPosition`
    FOREIGN KEY (`FromRoleCode`)
    REFERENCES `ausodb`.`position_info` (`Role_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ProjectInfo`
    FOREIGN KEY (`Project_ID`)
    REFERENCES `ausodb`.`project_info` (`Project_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ToPosition`
    FOREIGN KEY (`ToRoleCode`)
    REFERENCES `ausodb`.`position_info` (`Role_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ausodb`.`project_expenses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ausodb`.`project_expenses` (
  `No` INT(11) NOT NULL AUTO_INCREMENT,
  `Project_ID` VARCHAR(45) NOT NULL,
  `Expense Type` VARCHAR(100) NULL DEFAULT NULL,
  `Amount` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`No`),
  INDEX `ProjectID_idx` (`Project_ID` ASC),
  CONSTRAINT `ProjectID`
    FOREIGN KEY (`Project_ID`)
    REFERENCES `ausodb`.`project_info` (`Project_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ausodb`.`project_revenue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ausodb`.`project_revenue` (
  `No` INT(11) NOT NULL AUTO_INCREMENT,
  `Project_ID` VARCHAR(45) NOT NULL,
  `Revenue Type` VARCHAR(100) NULL DEFAULT NULL,
  `Amount` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`No`),
  INDEX `ID_idx` (`Project_ID` ASC),
  CONSTRAINT `ID`
    FOREIGN KEY (`Project_ID`)
    REFERENCES `ausodb`.`project_info` (`Project_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ausodb`.`user_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ausodb`.`user_info` (
  `No` INT(11) NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(40) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `FacultyCode` VARCHAR(2) NOT NULL,
  `RoleCode` VARCHAR(2) NOT NULL,
  `Firstname` VARCHAR(45) NOT NULL,
  `Lastname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`No`),
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC),
  INDEX `Faculty_idx` (`FacultyCode` ASC),
  INDEX `Position_idx` (`RoleCode` ASC),
  CONSTRAINT `Faculty`
    FOREIGN KEY (`FacultyCode`)
    REFERENCES `ausodb`.`faculty_info` (`Faculty_Code`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Position`
    FOREIGN KEY (`RoleCode`)
    REFERENCES `ausodb`.`position_info` (`Role_Code`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ausodb`.`user_project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ausodb`.`user_project` (
  `Username` VARCHAR(45) NOT NULL,
  `Project_ID` VARCHAR(45) NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `Advisor` VARCHAR(45) NOT NULL,
  INDEX `User_idx` (`Username` ASC),
  INDEX `Project_idx` (`Project_ID` ASC),
  CONSTRAINT `Project`
    FOREIGN KEY (`Project_ID`)
    REFERENCES `ausodb`.`project_info` (`Project_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `User`
    FOREIGN KEY (`Username`)
    REFERENCES `ausodb`.`user_info` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
