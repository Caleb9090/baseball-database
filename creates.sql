create database baseball;

use baseball;

CREATE Table teams (
    id int auto_increment,
    location VARCHAR(255),
    mascot VARCHAR(255),
    abbreviation VARCHAR(3),
    league ENUM ('AL', 'NL'),
    division ENUM('East', 'West','Central')
    Primary key(id)
);

Create TABLE players(
    id INT auto_increment,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    position ENUM('SP', 'RP','C','1B','2B','3B','SS','CF','LF','RF','DH'),
    throws ENUM('L','R','B'),
    hits ENUM('L','R','B'),
    teamID INT,
    PRIMARY KEY (id),
    FOREIGN KEY (teamID) REFERENCES teams(id)
);

Create Table games(
    id INT auto_increment,
    startTime DATETIME,
    homeTeamId INT,
    awayTeamId INT,
    homeScore INT,
    awayScore INT,
    PRIMARY KEY(id),
    FOREIGN KEY(homeTeamId) REFERENCES teams(id)
    FOREIGN KEY (awayTeamId) REFERENCES teams(id)
);

CREATE Table hitterStats(
    playerId INT,
    gameId INT,
    atBats INT,
    runs INT,
    hits INT,
    doubles INT,
    triples INT,
    homeRuns INT,
    runsBattedIns INT,
    walks INT,
    strikeOuts INT,
    steals INT,
    PRIMARY KEY (playerId, gameId),
    FOREIGN KEY(playerId) REFERENCES players(id),
    FOREIGN KEY(gameId) REFERENCES games(id)
);

CREATE TABLE pitcherStats (
    playerId INT,
    gameId INT,
    wins INT,
    innings DECIMAL(3,1),
    hits INT,
    runs INT,
    earnedRuns INT,
    walks INT,
    strikeOuts INT,
    PRIMARY KEY (playerId, gameId),
    FOREIGN KEY(playerId) REFERENCES players(id),
    FOREIGN KEY(gameId) REFERENCES games(id)
)

