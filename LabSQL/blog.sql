CREATE DATABASE blog;

USE blog;

CREATE TABLE authors (
                         author VARCHAR(255) NOT NULL PRIMARY KEY
);

CREATE TABLE articles (
                          author VARCHAR(255) NOT NULL,
                          title VARCHAR(255) NOT NULL,
                          word_count INT NOT NULL,
                          views INT NOT NULL,
                          FOREIGN KEY (author) REFERENCES authors(author)
);

INSERT INTO authors (author)
VALUES
    ('Maria Charlotte'),
    ('Juan Perez'),
    ('Gemma Alcocer');

INSERT INTO articles (author, title, word_count, views)
VALUES
    ('Maria Charlotte', 'Best Paint Colors', 814, 14),
    ('Juan Perez', 'Small Space Decorating Tips', 1146, 221),
    ('Maria Charlotte', 'Hot Accessories', 986, 105),
    ('Maria Charlotte', 'Mixing Textures', 765, 22),
    ('Juan Perez', 'Kitchen Refresh', 1242, 307),
    ('Maria Charlotte', 'Homemade Art Hacks', 1002, 193),
    ('Gemma Alcocer', 'Refinishing Wood Floors', 1571, 7542);;