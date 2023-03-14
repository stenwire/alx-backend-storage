-- Write code in SQL is a nice level up!
-- mysql procedures
DELIMITER $$ ;

CREATE PROCEDURE AddBonus (
		IN user_id INT,
		IN project_name VARCHAR(255),
		IN score INT)
BEGIN
	DECLARE check_prid INT;
	SELECT id INTO check_prid FROM projects
		WHERE name=project_name;
	IF check_prid <=> NULL
	THEN
		INSERT INTO projects (name) 
			VALUES (project_name);
	END IF;
	SELECT id INTO check_prid FROM projects 
		WHERE name = project_name;
	INSERT INTO corrections (user_id, project_id, score)
		VALUES (user_id, check_prid, score);
END ;

DELIMITER ; $$
