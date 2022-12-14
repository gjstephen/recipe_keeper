CREATE DATABASE recipe_keeper_db;
\c recipe_keeper_db

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

INSERT INTO recipes(name, image_url, ingredients, directions, user_id)
VALUES ('Crepes', 'https://images.unsplash.com/photo-1584278860047-22db9ff82bed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', '150 g plain flour\r\n375 ml milk\r\n2 eggs\r\n40 g unsalted butter\r\n1 tsp vanilla extract\r\nPinch of salt', 'Place Batter ingredients in a blender. Pulse 10 times or until smooth and lump free.\r\nPlace Batter in fridge for 1 hour.\r\nHeat a non stick skillet over medium high heat. Add 1/4 tsp butter and melt.\r\nAdd 1/4 cup batter and quickly swirl to spread.\r\nCook the first side for 1 minute or until there are light golden brown patches.\r\nFlip and cook the other side for 30 seconds.\r\nSlide out of the skillet onto a tray / board.\r\nRepeat with remaining crepes overlapping them into the board.', 1);

INSERT INTO recipes(name, image_url, ingredients, directions, user_id)
VALUES ('Burger', 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=999&q=80', 'one ingredient', 'one direction', 1);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    password_digest TEXT
);

ALTER TABLE users
ADD CONSTRAINT unique_users
UNIQUE(email);