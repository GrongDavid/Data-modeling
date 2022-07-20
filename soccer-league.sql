-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "teams" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "goals" (
    "id" int   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    CONSTRAINT "pk_goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "players" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "referees" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "matches" (
    "id" int   NOT NULL,
    "location" text   NOT NULL,
    "team1_id" int   NOT NULL,
    "team2_id" int   NOT NULL,
    "referee_id" int   NOT NULL,
    "start_date" text   NOT NULL,
    "end_date" text   NOT NULL,
    CONSTRAINT "pk_matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "dates" (
    "id" int   NOT NULL,
    "start_date" text   NOT NULL,
    "end_date" text   NOT NULL,
    CONSTRAINT "pk_dates" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");

ALTER TABLE "players" ADD CONSTRAINT "fk_players_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_team1_id" FOREIGN KEY("team1_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_team2_id" FOREIGN KEY("team2_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_referee_id" FOREIGN KEY("referee_id")
REFERENCES "referees" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_start_date_end_date" FOREIGN KEY("start_date", "end_date")
REFERENCES "dates" ("start_date", "end_date");

