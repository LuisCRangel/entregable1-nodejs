create table "users" (
  "id" uuid primary key,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int,
  "role_id" serial
);

create table "courses" (
  "id" uuid primary key,
  "title" varchar,
  "description" text,
  "level" varchar,
  "teacher_id" serial,
  "category_id" int,
  "course_video_url" uuid
);

create table "user_courses" (
  "id" serial,
  "user_id" uuid,
  "course_id" uuid
);

create table "teachers" (
  "id" serial primary key,
  "name" varchar,
  "role_id" serial
);

create table "course_videos" (
  "id" uuid primary key,
  "title" varchar,
  "url_video" varchar
);

create table "category" (
  "id" serial primary key,
  "name" varchar
);

create table "roles" (
  "id" serial primary key,
  "name" varchar
);

alter table "user_courses" add foreign key ("user_id") references "users" ("id");

alter table "users" add foreign key ("role_id") references "roles" ("id");

alter table "teachers" add foreign key ("role_id") references "roles" ("id");

alter table "user_courses" add foreign key ("course_id") references "courses" ("id");

alter table "courses" add foreign key ("teacher_id") references "teachers" ("id");

alter table "courses" add foreign key ("category_id") references "category" ("id");

alter table "courses" add foreign key ("course_video_url") references "course_videos" ("id");

insert
	into
	roles (name)
values ('admin'),
('Teacher'),
('Student');

insert
	into
	users (
id,
	name,
	email,
	password,
	age,
	role_id
)
values (
'1bc2c227-fc34-4729-b67c-4b7b0df1b3be', 
'Luis Carlos Rangel', 
'luiscrangel19@gmail.com',
'12345lc',
31,
3
),
(
'6482bc53-4d34-432b-be0c-e42300d98d00',
'Margarita Galindo',
'mgalindo@gmail.com',
'mgal892',
31,
3
);

insert
	into
	courses (id,
	title,
	description,
	level,
	teacher_id,
	category_id,
	course_video_url)
values ('2919f5e9-5bb7-48ac-b7fc-30896295b581',
'Node.js',
'Node.js® is an open-source, cross-platform JavaScript runtime environment.',
'middle',
1,
1,
'10bdb368-01ec-470b-b787-040c856de8c6' );

insert
	into
	courses (id,
	title,
	description,
	level,
	teacher_id,
	category_id,
	course_video_url)
values ('75aaab90-3bd1-4b70-b9d4-3caf8a35d264',
'English',
'English lessons for advanced English learners. Lessons include hundreds of English grammar and vocabulary exercises.',
'advanced',
2,
2,
'b069137e-311d-442b-bd40-4b987da16b25' );

insert
	into
	teachers (name,
	role_id)
values ('Sahid Kick',
2);

insert
	into
	teachers (name,
	role_id)
values ('Erika Garcia',
2);

insert
	into
	category (name)
values('technology'),
('languages');

insert
	into
	course_videos (id,
	title,
	url_video)
values ('10bdb368-01ec-470b-b787-040c856de8c6',
'Fundamentos de Node.js',
'https://www.youtube.com/watch?v=APbb-z8A3Zc&list=PLvRPaExkZHFn_EGzNOXsWqtAAGl8ZCbUo&ab_channel=VidaMRR-Programacionweb' );

insert
	into
	course_videos (id,
	title,
	url_video)
values ('b069137e-311d-442b-bd40-4b987da16b25',
'English Advanced',
'https://www.youtube.com/watch?v=8UUsGGwrNCY&list=PL8Tdjf2jwFRcTXQEKpg5C7w1fguOfhcQd&ab_channel=Vaughan-CursosdeIngl%C3%A9s' );

insert
	into
	user_courses (user_id,
	course_id )
values ('1bc2c227-fc34-4729-b67c-4b7b0df1b3be',
'2919f5e9-5bb7-48ac-b7fc-30896295b581'),
('6482bc53-4d34-432b-be0c-e42300d98d00',
'75aaab90-3bd1-4b70-b9d4-3caf8a35d264');