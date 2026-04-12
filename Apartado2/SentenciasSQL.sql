USE db_restaurantes;

#CONSULTA #1: Obtener todas las reservas que tiene el restaurante con id = 1 para 
#             el dia 14-03-2024. Mostrando los datos del cliente y de la mesa reserva.
/*
SELECT c.nombre as 'cliente', c.telefono, c.email, m.nombre as 'mesa', m.max_comensales 
FROM cliente as c 
JOIN reserva as r 
	ON c.id = r.cliente_id
JOIN mesa as m
	ON r.mesa_id = m.id
WHERE m.restaurante_id = 1 and DATE(r.fecha_reserva) = '2024-03-14';
*/

#CONSULTA #2: obtener todos los nombres de los restaurantes favoritos y que estén abiertos, 
#             para el cliente con id igual a 1.
/*
SELECT rest.nombre as 'restaurante'
FROM restaurante as rest
JOIN favorito as fav
	ON rest.id = fav.restaurante_id
WHERE fav.cliente_id = 1 and rest.is_open = 1;
*/

# Consulta #3: modificar la fecha y hora de la reserva con id igual a 10 a la siguiente fecha y hora 13-04-2025 18:00. 
/*
SELECT * FROM reserva WHERE reserva.id = 10;

UPDATE reserva
SET reserva.fecha_reserva = '2025-04-13 18:00'
WHERE reserva.id = 10;

SELECT * FROM reserva WHERE reserva.id = 10;
*/

#tODO Consulta #4: eliminar todos los restaurantes favoritos que no se encuentren abiertos para el cliente con id igual a 1.
/*
SELECT * FROM reserva WHERE reserva.id = 10;

DELETE FROM  favorito as fav 
JOIN restaurante as res
	ON
WHERE reserva.id = 10;

SELECT * FROM reserva WHERE reserva.id = 10;
*/

#Consulta #5: obtener el nombre de los restaurantes con más de tres reservas de cuatro o más comensales para la fecha 01-04-2024.

SELECT r.nombre FROM restaurante as r
WHERE (
	SELECT COUNT(*) FROM mesa as m
    JOIN reserva as re
		ON m.id = re.mesa_id 
	WHERE m.restaurante_id = r.id AND re.comensales >= 4 AND DATE(re.fecha_reserva) = '2024-04-01'
) > 3;

#Consulta #6: obtener el aforo máximo del restaurante con id igual a 5.

#Consulta #7: obtener las mesas que dispongan de espacio para dos comensales y que se encuentren disponibles (sin reserva) en el restaurante con id igual a 5 para la fecha y hora 31-12-2024 19:00.

#Consulta #8: obtener el nombre del cliente que ha realizado más reservas en el restaurante con id igual a 1 entre las fechas 01-01-2024 y 31-12-2024 (ambos días inclusive).


