USE `comercio`;
DROP procedure IF EXISTS `insertfabricante`;

DELIMITER $$
USE `comercio`$$
CREATE PROCEDURE `insertfabricante`(
		
        IN nom VARCHAR(100)
        
)
BEGIN

	INSERT INTO fabricante ( nombre)
    VALUES (nom);

END$$

DELIMITER ;


USE `comercio`;
DROP procedure IF EXISTS `insertProducto`;

USE `comercio`;
DROP procedure IF EXISTS `comercio`.`insertProducto`;
;

DELIMITER $$
USE `comercio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertProducto`(
        IN nom VARCHAR(100),
        IN prec VARCHAR(100),
        IN fk_codfab INT(10)
        
)
BEGIN

	INSERT INTO producto ( nombre, precio, codigo_fabricante)
    VALUES ( nom, prec,  fk_codfab);

END$$

DELIMITER ;
;



