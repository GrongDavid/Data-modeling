-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "users" (
    "id" int   NOT NULL,
    "username" text   NOT NULL,
    "password" text   NOT NULL,
    "preferred_region_id" int   NOT NULL,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "regions" (
    "id" int   NOT NULL,
    "region_name" text   NOT NULL,
    CONSTRAINT "pk_regions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "categories" (
    "id" int   NOT NULL,
    "category_name" text   NOT NULL,
    CONSTRAINT "pk_categories" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "posts" (
    "id" int   NOT NULL,
    "title" text   NOT NULL,
    "location" text   NOT NULL,
    "contents" text   NULL,
    "user_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    "region_id" int   NOT NULL,
    CONSTRAINT "pk_posts" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "users" ADD CONSTRAINT "fk_users_preferred_region_id" FOREIGN KEY("preferred_region_id")
REFERENCES "regions" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_category_id" FOREIGN KEY("category_id")
REFERENCES "categories" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_region_id" FOREIGN KEY("region_id")
REFERENCES "regions" ("id");

