DROP TABLE IF EXISTS authors;
CREATE TABLE authors (
  id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY(`id`, `name`)
);

INSERT INTO authors
  (name)
VALUES
  ('Terry Pratchett'),
  ('Neil Gaiman'),
  ('Herman Melville'),
  ('Oscar Wilde'),
  ('Kurt Vonnegut'),
  ('Ursula K. Le Guin'),
  ('Jane Austen'),
  ('Susanna Clarke'),
  ('Lauren Elkin'),
  ('Emily St. John Mandel');
