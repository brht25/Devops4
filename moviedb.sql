-- Movie Management Database
-- moviedb schema, tables and sample data

CREATE DATABASE IF NOT EXISTS moviedb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE moviedb;

-- Create user (run as root if needed)
-- CREATE USER IF NOT EXISTS 'movieuser'@'localhost' IDENTIFIED BY 'Movie123';
-- GRANT ALL PRIVILEGES ON moviedb.* TO 'movieuser'@'localhost';
-- FLUSH PRIVILEGES;

-- ------------------------------------------------
-- TABLES
-- ------------------------------------------------

DROP TABLE IF EXISTS classifications;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
    id   BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(16),
    PRIMARY KEY (id)
);

CREATE TABLE movies (
    id       BIGINT       NOT NULL AUTO_INCREMENT,
    title    VARCHAR(32)  NOT NULL,
    director VARCHAR(16),
    year     INT,
    PRIMARY KEY (id)
);

CREATE TABLE classifications (
    id          BIGINT NOT NULL AUTO_INCREMENT,
    movie_id    BIGINT,
    category_id BIGINT,
    date        DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (movie_id)    REFERENCES movies(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- ------------------------------------------------
-- SAMPLE DATA
-- ------------------------------------------------

INSERT INTO categories (name) VALUES
    ('Action'),
    ('Drama'),
    ('Comedy');

INSERT INTO movies (title, director, year) VALUES
    ('The Dark Knight',  'C. Nolan',     2008),
    ('Inception',        'C. Nolan',     2010),
    ('Interstellar',     'C. Nolan',     2014),
    ('The Matrix',       'L. Wachowski', 1999),
    ('Forrest Gump',     'R. Zemeckis',  1994),
    ('The Godfather',    'F.F. Coppola', 1972),
    ('Pulp Fiction',     'Q. Tarantino', 1994),
    ('Fight Club',       'D. Fincher',   1999);

INSERT INTO classifications (movie_id, category_id, date) VALUES
    (1, 1, '2023-01-15'),
    (2, 1, '2023-02-20'),
    (3, 1, '2023-03-10'),
    (4, 1, '2023-04-05'),
    (5, 2, '2023-05-12'),
    (6, 2, '2023-06-18'),
    (7, 2, '2023-07-22'),
    (8, 3, '2023-08-30');
