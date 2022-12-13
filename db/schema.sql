CREATE DATABASE recipe_keeper_db;
\c recipe_keeper_db

CREATE TYPE rating AS ENUM ('1', '2', '3', '4', '5');

CREATE TABLE test_table(
    id SERIAL PRIMARY KEY,
    name TEXT,
    rating rating,
    servings INTEGER,
    time TIME,
    ingredients TEXT[],
    directions TEXT[]
);

INSERT INTO test_table(name, rating, servings, time, ingredients, directions)
VALUES('Pasta With Italian Sausage', '4', 4, '01:30', '{"Crumble sausage into a large skillet.", "Add sausage, pasta sauce, and wine. Bring to a boil."}', '{"1/2 cup Parmesean Cheese, grated", "1/4 teaspoon Fennel Seed, crushed", "1/4 cup Fresh Basil, chopped"}');

INSERT INTO test_table(name, rating, servings, time, ingredients, directions)
VALUES('Tacos', '4', 4, '01:30', '{"Crumble sausage into a large skillet.", "Add sausage, pasta sauce, and wine. Bring to a boil."}', '{"1/2 cup Parmesean Cheese, grated", "1/4 teaspoon Fennel Seed, crushed", "1/4 cup Fresh Basil, chopped"}');

INSERT INTO test_table(name, rating, servings, time, ingredients, directions)
VALUES('Pizza', '4', 4, '01:30', ARRAY['Crumble sausage into a large skillet.', 'Add sausage, pasta sauce, and wine. Bring to a boil.'], ARRAY['1/2 cup Parmesean Cheese, grated', '1/4 teaspoon Fennel Seed, crushed', '1/4 cup Fresh Basil, chopped']);

CREATE TABLE recipes(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    name TEXT,
    image_url TEXT,
    rating INTEGER,
    category TEXT,
    servings INTEGER,
    time TEXT,
    source TEXT,
    ingredients TEXT,
    directions TEXT
);

INSERT INTO recipes(name, image_url)
VALUES ('Crepes', 'https://images.unsplash.com/photo-1584278860047-22db9ff82bed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'), ('Burger', 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=999&q=80');

INSERT INTO recipes(name, image_url)
VALUES ('Burger', 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=999&q=80');