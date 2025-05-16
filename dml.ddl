call insertfabricante("Asus");
call insertfabricante("Lenovo");
call insertfabricante("Hewlett-Packard");
call insertfabricante("Samsung");
call insertfabricante("Seagate");
call insertfabricante("Crucial");
call insertfabricante("Gigabyte");
call insertfabricante("Huawei");
call insertfabricante("Xiaomi");

call insertProducto("Disco duro SATA3 1TB",86.99,5);
call insertProducto("Memoria RAM DDR4 8GB",120,6);
call insertProducto("Disco SSD 1 TB",150.99,4);
call insertProducto("GeForce GTX 1050Ti",185,7);
call insertProducto("GeForce GTX 1080 Xtreme",755,6);
call insertProducto("Monitor 24 LED Full HD",202,1);
call insertProducto("Monitor 27 LED Full HD",245.99,1);
call insertProducto("Portátil Yoga 520",559,2);
call insertProducto("Portátil Ideapd 320",444,2);
call insertProducto("Impresora HP Deskjet 3720",59.99,3);
call insertProducto("Impresora HP Laserjet Pro M26nw",180,3);

/*Consultas de una tabla*/
/* 1 */ select nombre from producto;
/* 2 */ select nombre,precio from producto;
/* 3 */ select * from producto;
/* 4 */ select nombre, precio, precio*0.894 from producto;
/* 5 */ select nombre as 'nombre de producto', precio*0.894 as euros, precio as dolares from producto;
/* 6 */ select UPPER(nombre), precio from producto;
/* 7 */ select LOWER(nombre), precio from producto;
/* 8 */ select  nombre, upper(substring(nombre, 1,2)) from fabricante;
/* 9 */ select nombre, round(precio) from producto;
/* 10 */ select nombre, truncate(precio,0) from producto;
/* 11 */ select codigo_fabricante from producto;
/* 12 */ select distinct codigo_fabricante  from producto;
/* 13 */ select nombre from fabricante order by codigo asc;
/* 14 */ select nombre from fabricante order by codigo desc;
/* 15 */ select nombre, precio from producto order by nombre asc;
/* 16 */ select nombre,precio from producto order by precio desc;
/* 17 */ select * from fabricante limit 5;
/* 18 */ select * from fabricante limit 3,3;
/* 19 */ select nombre,precio from producto order by precio asc limit 1;
/* 20 */ select nombre,precio from producto order by precio desc limit 1;
/* 21 */ select nombre from producto where codigo_fabricante=2;
/* 22 */ select nombre from producto where precio*0.894 <= 120;
/* 23 */ select nombre from producto where precio*0.894 >= 400;
/* 24 */ select nombre from producto where precio*0.894 < 400;
/* 25 */ select nombre, precio*0.894 as 'precio en euros' from producto where precio*0.894 >= 80 and precio*0.894<= 300;
/* 26 */ select nombre, precio*0.894 as 'precio en euros' from producto where precio*0.894 between 60 and 200;
/* 27 */ select nombre,precio*0.894 as 'precio en euros' from producto where precio*0.894>=200 and  codigo_fabricante=6;
/* 28 */ select nombre from producto where codigo=1 or codigo=3 or codigo=5;
/* 29 */ select nombre from producto where codigo in (1,3,5);
/* 30 */ select nombre, precio*100 as centimos from producto;
/* 31 */ select nombre from fabricante where nombre like'S%';
/* 32 */ select nombre from fabricante where nombre like'%e';
/* 33 */ select nombre from fabricante where nombre like'%w%';
/* 34 */ select nombre from fabricante where nombre like'____';
/* 35 */ select nombre from producto where nombre like'%Portatil%';
/* 36 */ select nombre from producto where nombre like'%Monitor%' and precio*0.894<215;
/* 37 */ select precio*0.894 as 'precio en euros', nombre from producto where precio*0.894>=180 order by precio desc;
/* 38 */ select precio*0.894 as 'precio en euros', nombre from producto where precio*0.894>=180 order by nombre asc;

/*1.1.4 Consultas multitabla (Composición interna)*/

/* 1 */ SELECT p.nombre, p.precio, f.nombre FROM producto as p
		JOIN fabricante as f ON p.codigo_fabricante = f.codigo;
        
/* 2 */ SELECT p.nombre, p.precio, f.nombre FROM producto as p
		JOIN fabricante as f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre asc;

/* 3 */ SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM producto as p
		JOIN fabricante as f ON p.codigo_fabricante = f.codigo;
        
/* 4 */	SELECT p.nombre, p.precio, f.nombre FROM producto AS p
		JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MIN(precio) FROM producto);
        
/* 5 */	SELECT p.nombre, p.precio, f.nombre FROM producto AS p
		JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MAX(precio) FROM producto);
        
/* 6 */	SELECT p.nombre, f.nombre FROM producto AS p
		JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
        
/* 7 */	SELECT p.nombre, p.precio, f.nombre FROM producto AS p
		JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' and p.precio > 200;
        
/* 8 */	SELECT p.nombre, f.nombre FROM producto AS p
		JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';
        
/* 9 */	SELECT p.nombre, f.nombre FROM producto AS p
		JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus','Hewlett-Packard','Seagate');
        
/* 10 */ SELECT p.nombre, p.precio, f.nombre FROM producto AS p
		 JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE "%e" ;
        
/* 11 */ SELECT p.nombre, p.precio, f.nombre FROM producto AS p
		 JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE "%W%" ;
         
/* 12 */ SELECT p.nombre, p.precio, f.nombre AS nombre_fabricante FROM producto AS p
		 JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC;
         
         SELECT p.nombre, p.precio, f.nombre AS nombre_fabricante FROM producto AS p
		 JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.nombre ASC;
         
/* 13 */ SELECT DISTINCT f.codigo, f.nombre FROM fabricante AS f
		 JOIN producto AS p ON p.codigo_fabricante = f.codigo;

/*1.1.5 Consultas multitabla (Composición externa)*/

/* 1 */ SELECT f.codigo, f.nombre, p.nombre FROM fabricante AS f
		LEFT JOIN producto AS p ON p.codigo_fabricante = f.codigo;


/* 2 */ SELECT f.nombre FROM producto AS p
		RIGHT JOIN fabricante AS f ON p.codigo_fabricante = f.codigo where p.codigo_fabricante is null;
	


/* 3. Dependiendo si el campo tiene not null no se puede pero si no si se puede agregar  */

/*1.1.6 Consultas resumen*/
/*1*/SELECT COUNT(*) AS 'Cantidad de productos' FROM producto;
/*2*/SELECT COUNT(*) AS 'Cantidad de fabricantes' FROM fabricante;
/*3*/SELECT COUNT(DISTINCT codigo_fabricante) FROM producto;
/*4*/SELECT AVG(precio) AS Promedio FROM producto;
/*5*/SELECT MIN(precio) AS Precio FROM producto; 
/*6*/SELECT MAX(precio) AS Precio FROM producto;
/*7*/SELECT nombre, precio AS Precio FROM producto WHERE precio = (SELECT MIN(precio) FROM producto);
/*8*/SELECT nombre, precio AS Precio FROM producto WHERE precio = (SELECT MAX(precio) FROM producto);
/*9*/SELECT SUM(precio) AS 'Suma total' FROM producto;
/*10*/SELECT COUNT(*) AS 'Productos Asus'FROM producto as p INNER JOIN fabricante as f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';
/*11*/SELECT AVG(p.precio) AS 'Promedio de precio Asus'FROM producto as p INNER JOIN fabricante as f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';
/*12*/SELECT MIN(p.precio) AS 'Precio mas barato Asus'FROM producto as p INNER JOIN fabricante as f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';
/*13*/SELECT MAX(p.precio) AS 'Precio mas caro Asus'FROM producto as p INNER JOIN fabricante as f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';
/*14*/SELECT SUM(p.precio) AS 'Suma precios Asus'FROM producto as p INNER JOIN fabricante as f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';
/*15*/SELECT MAX(p.precio) AS Máximo, MIN(p.precio) AS Mínimo, AVG(p.precio) AS Promedio, COUNT(*) AS 'Cantidad de Productos'  
FROM producto as p INNER JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial';
/*16*/SELECT f.nombre AS 'Fabricante', COUNT(p.codigo_fabricante) AS 'Cantidad de productos' FROM producto as p RIGHT JOIN fabricante as f 
ON p.codigo_fabricante = f.codigo GROUP BY f.nombre ORDER BY 'Cantidad de productos' DESC;
/*17*/SELECT f.nombre AS 'Fabricante', MAX(p.precio)AS Máximo, MIN(p.precio) AS Mínimo, AVG(p.precio) AS Promedio
FROM producto as p RIGHT JOIN fabricante as f ON p.codigo_fabricante = f.codigo GROUP BY f.nombre;
/*18*/SELECT f.codigo AS 'Código Fabricante', MAX(p.precio) AS Máximo, MIN(p.precio) AS Mínimo, AVG(p.precio) AS 'Promedio', COUNT(p.codigo_fabricante) 
AS 'Cantidad'FROM producto p RIGHT JOIN fabricante f ON p.codigo_fabricante = f.codigo GROUP BY f.codigo HAVING Promedio*0.894 > 200;
/*19*/SELECT f.nombre, MAX(p.precio) AS Máximo, MIN(p.precio) AS Mínimo, AVG(p.precio) AS Promedio, COUNT(p.codigo_fabricante) AS Cantidad
FROM producto as p RIGHT JOIN fabricante as f ON p.codigo_fabricante = f.codigo GROUP BY f.codigo HAVING Promedio*0.894 > 200;
/*20*/SELECT COUNT(*) AS 'Cantidad de productos con Precio igual o mayor a 180 euros' FROM producto as p RIGHT JOIN fabricante as f 
ON p.codigo_fabricante = f.codigo WHERE p.precio*0.894 > 180;
/*21*/SELECT f.nombre, COUNT(p.nombre) AS 'Cantidad' FROM producto as p RIGHT JOIN fabricante as f ON p.codigo_fabricante = f.codigo
WHERE p.precio*0.894 >= 180 GROUP BY f.nombre;
/*22*/SELECT f.codigo, AVG(p.precio) AS 'Promedio' FROM producto as  p RIGHT JOIN fabricante as f ON p.codigo_fabricante = f.codigo
GROUP BY  f.codigo;
/*23*/SELECT f.nombre, AVG(p.precio) AS 'Promedio'FROM producto as p RIGHT JOIN fabricante as f ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre;
/*24*/SELECT f.nombre, AVG(p.precio) AS 'Promedio' FROM producto as p RIGHT JOIN fabricante as f ON p.codigo_fabricante = f.codigo 
GROUP BY f.nombre HAVING Promedio*0.894 >= 150;
/*25*/SELECT f.nombre FROM producto as p INNER JOIN fabricante as f ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre HAVING COUNT(p.codigo_fabricante) >= 2;
/*26*/SELECT f.nombre, COUNT(p.codigo_fabricante) AS 'Cantidad' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE p.precio*0.894 >= 220 GROUP BY f.nombre;
/*27*/SELECT f.nombre, COUNT(CASE WHEN p.precio*0.894 >= 220 THEN f.nombre ELSE NULL END) AS 'Cantidad' FROM fabricante as f
LEFT JOIN producto as p ON p.codigo_fabricante = f.codigo GROUP BY f.nombre;
/*28*/SELECT f.nombre, SUM(p.precio*0.894) AS 'Suma' FROM producto as p INNER JOIN fabricante as f ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre HAVING Suma > 1000;
/*29*/SELECT p.nombre, p.precio AS 'Producto mas caro', f.nombre FROM producto as p JOIN fabricante as f ON p.codigo_fabricante = f.codigo
LEFT JOIN producto as p2 ON p.codigo_fabricante = p2.codigo_fabricante AND p2.precio > p.precio WHERE p2.codigo IS NULL
ORDER BY f.nombre ASC;

/*1.1.7 Subconsultas (En la cláusula WHERE)*/
/*1.1.7.1 Con operadores básicos de comparación*/
/*1*/SELECT p.nombre FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo');
/*2*/SELECT * FROM producto as p WHERE p.precio = (SELECT MAX(p.precio) FROM fabricante as f, producto as p WHERE f.codigo = p.codigo_fabricante
AND f.nombre = 'Lenovo');
/*3*/SELECT nombre FROM producto as p WHERE p.precio = (SELECT MAX(p.precio) FROM fabricante as f, producto as p WHERE p.codigo_fabricante = f.codigo
AND f.nombre= 'Lenovo');
/*4*/SELECT nombre FROM producto as p WHERE p.precio = (SELECT MIN(p.precio) FROM fabricante as f, producto as p  WHERE f.codigo = p.codigo_fabricante 
AND f.nombre = 'Hewlett-Packard');
/*5*/SELECT nombre
FROM producto as p WHERE p.precio >= (SELECT MAX(p.precio) FROM fabricante as f, producto as p WHERE p.codigo_fabricante = f.codigo 
AND f.nombre= 'Lenovo');
/*6*/SELECT nombre FROM producto as p WHERE p.precio > (SELECT AVG(p.precio) FROM fabricante as f, producto as p WHERE p.codigo_fabricante = f.codigo
AND f.nombre= 'Asus');













