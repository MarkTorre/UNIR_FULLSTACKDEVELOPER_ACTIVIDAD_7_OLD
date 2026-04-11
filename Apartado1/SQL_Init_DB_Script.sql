#INSERTAR USUARIO
INSERT INTO usuarios(id, nombre, email, contraseña) VALUES (0,"Andrea","andrea@gmail.com","A4N5D6R7");

#INSERTAR ARTISTA
INSERT INTO artistas(id, nombre, foto) VALUES (0,"Brian Eno", "/public/artistas/brian-eno/brian_eno_profile.jpg");

#INSERTAR ALBUM
INSERT INTO albumes(id, titulo, discografica, año) VALUES (0,"Secret Life","Text Records",2026);

#INSERTAR TRES CANCIONES
INSERT INTO canciones(id, titulo, genero, año) VALUES (0,"I Saw You","Ambient",2023);
INSERT INTO canciones(id, titulo, genero, año) VALUES (1,"Sunset","Classic",2016);
INSERT INTO canciones(id, titulo, genero, año) VALUES (2,"Empire Systems","Black knoll",2015);

#CREAR LISTA CON TRES CANCIONES QUE ACABAS DE DAR DE ALTA
INSERT INTO listas(id, nombre, fk_usuario) VALUES (0, "MiLista1", 0);
INSERT INTO tbi_listas_canciones (id, fk_listas, fk_canciones) VALUES (0, 0, 0);
INSERT INTO tbi_listas_canciones (id, fk_listas, fk_canciones) VALUES (1, 0, 1);
INSERT INTO tbi_listas_canciones (id, fk_listas, fk_canciones) VALUES (2, 0, 2);

#REGISTRAR QUE EL USUARIO HA ESCUCHADO UNA DE LAS TRES CANCIONES
INSERT INTO tbi_usuarios_canciones (id, fk_usuarios, fk_canciones) VALUES (0, 0, 0)