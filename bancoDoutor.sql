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
-- Table `mydb`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medico` (
  `idmedico` INT NOT NULL,
  `especialidade` VARCHAR(45) NULL,
  `crm` VARCHAR(45) NULL,
  PRIMARY KEY (`idmedico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Login` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  `Medico_idmedico` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_Login_Medico1_idx` (`Medico_idmedico` ASC) VISIBLE,
  CONSTRAINT `fk_Login_Medico1`
    FOREIGN KEY (`Medico_idmedico`)
    REFERENCES `mydb`.`Medico` (`idmedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paciente` (
  `idPaciente` INT NOT NULL,
  `cpfPaciente` VARCHAR(45) NULL,
  `altura` FLOAT NULL,
  `peso` FLOAT NULL,
  `dataDeNascimento` DATE NULL,
  `nomeDaMae` VARCHAR(45) NULL,
  PRIMARY KEY (`idPaciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consulta` (
  `idConsulta` INT NOT NULL,
  `horarioInicio` DATETIME NULL,
  `horarioFim` DATETIME NULL,
  `pressaoArterial` VARCHAR(45) NULL,
  `frequenciaArterial` VARCHAR(45) NULL,
  `saturacao` VARCHAR(45) NULL,
  `glicemia` VARCHAR(45) NULL,
  `anamnese` VARCHAR(255) NULL,
  `medicacao` VARCHAR(255) NULL,
  `Medico_idmedico` INT NOT NULL,
  `Paciente_idPaciente` INT NOT NULL,
  `horaInicial` TIME NULL,
  `horaFinal` TIME NULL,
  PRIMARY KEY (`idConsulta`),
  INDEX `fk_Consulta_Medico_idx` (`Medico_idmedico` ASC) VISIBLE,
  INDEX `fk_Consulta_Paciente1_idx` (`Paciente_idPaciente` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Medico`
    FOREIGN KEY (`Medico_idmedico`)
    REFERENCES `mydb`.`Medico` (`idmedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente`)
    REFERENCES `mydb`.`Paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cid` (
  `idCid` INT NOT NULL,
  `codigoDoCid` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idCid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consulta_has_Cid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consulta_has_Cid` (
  `Consulta_idConsulta` INT NOT NULL,
  `Cid_idCid` INT NOT NULL,
  PRIMARY KEY (`Consulta_idConsulta`, `Cid_idCid`),
  INDEX `fk_Consulta_has_Cid_Cid1_idx` (`Cid_idCid` ASC) VISIBLE,
  INDEX `fk_Consulta_has_Cid_Consulta1_idx` (`Consulta_idConsulta` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_has_Cid_Consulta1`
    FOREIGN KEY (`Consulta_idConsulta`)
    REFERENCES `mydb`.`Consulta` (`idConsulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_has_Cid_Cid1`
    FOREIGN KEY (`Cid_idCid`)
    REFERENCES `mydb`.`Cid` (`idCid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
