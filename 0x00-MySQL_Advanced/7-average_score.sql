-- A SQL script that creates a stored procedure ComputeAverageScoreForUser that 
-- computes and store the average score for a student.
DROP PROCEDURE IF EXISTS computeAverageScoreForUser;
DELIMITER $$ ;
CREATE PROCEDURE computeAverageScoreForUser (
		IN user_id INT)
BEGIN
	SELECT AVG(score) INTO @average from corrections where corrections.user_id = user_id;
	UPDATE users SET average_score = @average WHERE id = user_id;
END;
DELIMITER ; $$
