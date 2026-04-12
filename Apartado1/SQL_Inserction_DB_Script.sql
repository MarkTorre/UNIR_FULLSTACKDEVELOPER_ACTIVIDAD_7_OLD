#INSERTAR USUARIO
INSERT INTO dbmusicstreaming.usuarios(id, nombre, email, contraseña) VALUES (1,"Andrea","andrea@gmail.com","A4N5D6R7");

#INSERTAR ARTISTA
INSERT INTO dbmusicstreaming.artistas(id, nombre, foto) VALUES (1, "Brian Eno", "/public/artistas/brian-eno/brian_eno_profile.jpg");

#INSERTAR ALBUM
INSERT INTO dbmusicstreaming.albumes(id, titulo, discografica, año, fk_artistas) VALUES (1, "Secret Life","Text Records",2023,1);

#INSERTAR TRES CANCIONES
INSERT INTO dbmusicstreaming.canciones(id, titulo, genero, año, fk_albumes) VALUES (1, "I Saw You","Ambient",2023,1);
INSERT INTO dbmusicstreaming.canciones(id, titulo, genero, año, fk_albumes) VALUES (2, "Secret","Ambient",2023,1);
INSERT INTO dbmusicstreaming.canciones(id, titulo, genero, año, fk_albumes) VALUES (3, "Radio","Ambient",2023,1);

#CREAR LISTA CON TRES CANCIONES QUE ACABAS DE DAR DE ALTA
INSERT INTO dbmusicstreaming.listas (id, nombre, fk_usuarios) VALUES (1, "MiLista1", 1);
INSERT INTO dbmusicstreaming.tbi_listas_canciones (id, fk_listas, fk_canciones) VALUES (1, 1, 1);
INSERT INTO dbmusicstreaming.tbi_listas_canciones (id, fk_listas, fk_canciones) VALUES (2, 1, 2);
INSERT INTO dbmusicstreaming.tbi_listas_canciones (id, fk_listas, fk_canciones) VALUES (3, 1, 3);

#REGISTRAR QUE EL USUARIO HA ESCUCHADO UNA DE LAS TRES CANCIONES
INSERT INTO dbmusicstreaming.tbi_usuarios_canciones (id, fk_usuarios, fk_canciones) VALUES (1, 1, 2)