-- A SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes
-- and store the average weighted score for a student
DELIMITER $$ ;
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
	DECLARE b INT DEFAULT 0;
	DECLARE p_id INT;
	DECLARE p_score INT;
	DECLARE wgt INT;
	DECLARE t_wgt INT DEFAULT 0;
	DECLARE t_score INT DEFAULT 0;

	DECLARE cur_1 CURSOR FOR
		SELECT project_id, score FROM corrections
			WHERE  corrections.user_id = user_id;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1;	
	OPEN cur_1;

	REPEAT
		FETCH NEXT FROM cur_1 INTO p_id, p_score;
		IF NOT b THEN
			SELECT weight INTO wgt FROM projects
				WHERE id = p_id;
			SET t_score = t_score + (p_score * wgt);
			SET t_wgt = t_wgt + wgt;
		END IF;
	UNTIL b END REPEAT;
	UPDATE users SET average_score = t_score / t_wgt
		WHERE users.id = user_id;
	CLOSE cur_1;
END;

DELIMITER ; $$
