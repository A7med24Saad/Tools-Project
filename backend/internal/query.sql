
SELECT * FROM users
WHERE id = ? LIMIT 1;

-- name: ListAuthors :many
SELECT * FROM users
ORDER BY name;

-- name: CreateAuthor :execresult
-- INSERT INTO Users (
--   name, bio
-- ) VALUES (
--   ?, ?
-- );
 INSERT INTO users (name, email, phone, password, role)
  VALUES (
    ?, ?, ?, ?, ?
  );

DELETE FROM users
WHERE id = ?;