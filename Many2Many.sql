/* Movie, Actor, MovieActor */
/* Game, Player, Score */

/* Team, Players, Games */


CREATE TABLE IF NOT EXISTS players (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  jersey INT NOT NULL
)DEFAULT CHARSET UTF8 COMMENT 'Canadian SportsBall Players';

CREATE TABLE IF NOT EXISTS teams (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
) DEFAULT CHARSET UTF8 COMMENT 'Canadian SportsBall Teams';

/* SIMPLE MANY TO MANY */
/* Data Transfer Object (DTO) */
CREATE TABLE IF NOT EXISTS teamplayer (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  playerId INT NOT NULL,
  teamId INT NOT NULL,

  FOREIGN KEY (playerId)
    REFERENCES players(id)
    ON DELETE CASCADE,

  FOREIGN KEY (teamId)
    REFERENCES teams(id)
    ON DELETE CASCADE
);

/* Get All Players on a team */
SELECT
  p.*,
  tp.id AS TeamPlayerId
FROM teamplayer tp
JOIN players p ON p.id = tp.playerId
WHERE tp.teamId = 1;

/* 
  _db.Query<TeamPlayerPlayerViewModel>(sql, new {id})
 */