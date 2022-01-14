drop table if exists comments;
drop table if exists posts;
drop table if exists users;


create table users(
	user_id int not null auto_increment,
	username char not null,
	first_name varchar(40) not null,
	last_name varchar(40) not null,
	email varchar(60),
	password char (40) not null,
	primary key (user_id)
);

create table posts(
	post_id int not null auto_increment,
	user_id int not null, 
	post_content text,
	publish_timestamp timestamp not null default current_timestamp,
	primary key (post_id),
	foreign key (user_id) references users (user_id)
);

create table comments(
	comment_id int not null auto_increment,
	user_id int not null,
	post_id int not null, 
	comment_content text,
	publish_timestamp timestamp not null default current_timestamp,
	primary key (comment_id),
	foreign key (user_id) references users (user_id),
	foreign key (post_id) references posts (post_id)
);