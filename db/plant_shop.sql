DROP TABLE plants;
DROP TABLE species;

CREATE TABLE species(
id SERIAL PRIMARY KEY,
name VARCHAR(255),
common_name VARCHAR(255),
description TEXT
);

CREATE TABLE plants(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  latin_name VARCHAR(255),
  description TEXT,
  stock_quantity INT,
  buying_cost INT,
  selling_price INT,
  species_id INT REFERENCES species(id) ON DELETE CASCADE,
  image VARCHAR(255)
);
