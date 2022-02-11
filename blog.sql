--1) Crear base de datos llamada blog.
--2) Crear las tablas indicadas de acuerdo al modelo de datos.
create table usuario(id serial primary key,
email varchar(30));

create table post(id serial primary key,
usuario_id smallint, titulo varchar(50), fecha date, foreign key(usuario_id) references usuario(id));

create table comentario(id serial primary key, post_id smallint, usuario_id smallint, texto varchar(50), fecha date,
					foreign key(post_id) references post(id), foreign key(usuario_id) references usuario(id));

--3) Insertar los siguientes registros.
insert into usuario(email)
values 
('usuario01@hotmail.com'),
('usuario02@gmail.com'),
('usuario03@gmail.com'),
('usuario04@hotmail.com'),
('usuario05@yahoo.com'),
('usuario06@hotmail.com'),
('usuario07@yahoo.com'),
('usuario08@yahoo.com'),
('usuario09@yahoo.com');

select * from usuario;
--para revisar que se aplicaron los inserts;

insert into post (usuario_id,titulo,fecha)
values
(1,'Post 1: Esto es malo','2020-06-29'),
(5,'Post 2: Esto es malo','2020-06-20'),
(1,'Post 3: Esto es excelente','2020-05-30'),
(9,'Post 4: Esto es bueno','2020-05-09'),
(7,'Post 5: Esto es bueno','2020-07-10'),
(5,'Post 6: Esto es excelente','2020-07-18'),
(8,'Post 7: Esto es excelente','2020-07-07'),
(5,'Post 8: Esto es excelente','2020-05-14'),
(2,'Post 9: Esto es bueno','2020-05-08'),
(6,'Post 10: Esto es bueno','2020-06-02'),
(4,'Post 11: Esto es bueno','2020-05-05'),
(9,'Post 12: Esto es malo','2020-07-23'),
(5,'Post 13: Esto es excelente','2020-05-30'),
(8,'Post 14: Esto es excelente','2020-05-01'),
(7,'Post 15: Esto es malo','2020-06-17');

select * from post;
--para revisar que se aplicaron los inserts;

insert into comentario (post_id,usuario_id,texto,fecha)
values
(6,3,'Este es el comentario 1','2020-07-08'),
(2,4,'Este es el comentario 2','2020-06-07'),
(4,6,'Este es el comentario 3','2020-06-16'),
(13,2,'Este es el comentario 4','2020-06-15'),
(6,6,'Este es el comentario 5','2020-05-14'),
(3,3,'Este es el comentario 6','2020-07-08'),
(1,6,'Este es el comentario 7','2020-05-22'),
(7,6,'Este es el comentario 8','2020-07-09'),
(13,8,'Este es el comentario 9','2020-06-30'),
(6,8,'Este es el comentario 10','2020-06-19'),
(1,5,'Este es el comentario 11','2020-05-09'),
(15,8,'Este es el comentario 12','2020-06-17'),
(9,1,'Este es el comentario 13','2020-05-01'),
(5,2,'Este es el comentario 14','2020-05-31'),
(3,4,'Este es el comentario 15','2020-06-28');

select * from comentario;
--para revisar que se aplicaron los inserts;

--4) Seleccionar el correo, id y título de todos los post publicados por el usuario 5.
select u.email, p.id as id_post, p.titulo 
from usuario as u
inner join post as p
on u.id = p.usuario_id
where p.usuario_id = 5;

--5) Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email usuario06@hotmail.com.
select u.email, c.id as id_comentario, c.usuario_id, c.post_id, c.texto, c.fecha 
from usuario as u
inner join comentario as c
on u.id = c.usuario_id
where u.email <> 'usuario06@hotmail.com';

--6) Listar los usuarios que no han publicado ningún post.
select u.id, u.email
from usuario as u
left join post as p
on u.id = p.usuario_id
where p.id is null;

--7) Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios).
select p.id AS id_post, p.usuario_id AS usuario_id_post, p.titulo, p.fecha,
c.id AS id_comentario, c.usuario_id AS usuario_id_comentario, c.texto, c.fecha
from post as p
full outer join comentario as c
on p.id = c.post_id
order by p.id;

--8) Listar todos los usuarios que hayan publicado un post en Junio.
select u.id, u.email, p.fecha as fecha_post
from usuario as u
inner join post as p
on u.id = p.usuario_id
where p.fecha >= '2020-06-01' and p.fecha <= '2020-06-30'
order by p.fecha;







