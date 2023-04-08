DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
  id INT AUTO_INCREMENT NOT NULL,
  title VARCHAR(255) NOT NULL,
  author_id INT NOT NULL,
  PRIMARY KEY(`id`)
);

INSERT INTO titles
  (title, author_id)
VALUES
  ('A Hat Full of Sky', 1),
  ('Bartleby, the Scrivener', 3),
  ('Breakfast of Champions', 5),
  ('De Profundis', 4),
  ('Emma', 7),
  ('Flaneuse', 9),
  ('Fragile Things', 2),
  ('Galapagos', 5),
  ('Hogfather', 1),
  ('Jonathan Strange & Mr Norrell', 8),
  ('Lords and Ladies', 1),
  ('Moby-Dick', 3),
  ('Piranesi', 8),
  ('Pride and Prejudice', 7),
  ('Reaper Man', 1),
  ('Sea of Tranquility', 10),
  ('Sense and Sensibility', 7),
  ('Slaughterhouse-Five', 5),
  ('Station Eleven', 10),
  ('The Disposessed', 6),
  ('The Farthest Shore', 6),
  ('The Happy Prince', 4),
  ('The Importance of Being Earnest', 4),
  ('The Lathe of Heaven', 6),
  ('The Left Hand of Darkness', 6),
  ('The Ocean at the End of the Lane', 2),
  ('The Ones Who Walk Away from Omelas', 6),
  ('The Picture of Dorian Gray', 4),
  ('The Sandman', 2),
  ('The Tombs of Atuan', 6);
