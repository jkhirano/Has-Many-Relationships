DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(90) NOT NULL,
    first_name VARCHAR (90) DEFAULT NULL,
    last_name VARCHAR (90)DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now
    ()
);

DROP TABLE IF EXISTS posts;

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(180) DEFAULT NULL,
    url VARCHAR(510) DEFAULT NULL,
    content text DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT now
    (),
    updated_at timestamp NOT NULL DEFAULT now
    (),
    user_id INT REFERENCES users(id) NOT NULL
);

DROP TABLE IF EXISTS comments;

CREATE TABLE comments
(
    id SERIAL PRIMARY KEY NOT NULL,
    body VARCHAR(510) DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now(),
    user_id INT REFERENCES users(id) NOT NULL,
    post_id INT REFERENCES posts(id) NOT NULL
);