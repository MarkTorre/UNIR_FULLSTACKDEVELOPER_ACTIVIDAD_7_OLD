#INSERTAR USUARIO
INSERT INTO usuarios(nombre, email, contraseña) VALUES ("Andrea","andrea@gmail.com","A4N5D6R7");
#INSERTAR ARTISTA
INSERT INTO artistas(nombre, foto) VALUES ("Brian Eno", "/public/artistas/brian-eno/brian_eno_profile.jpg");
#INSERTAR ALBUM
INSERT INTO albumes(titulo, discografica, año) VALUES ("Secret Life","Text Records",2026);
#INSERTAR TRES CANCIONES
INSERT INTO canciones(titulo, genero, año) VALUES ("","Ambient",2026);
#CREAR LISTA CON TRES CANCIONES QUE ACABAS DE DAR DE ALTA
INSERT INTO listas(nombre, fd_usuario)
#REGISTRAR QUE EL USUARIO HA ESCUCHADO UNA DE LAS TRES CANCIONES