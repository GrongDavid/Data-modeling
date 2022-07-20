-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "diseases" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "primary_treatment" text   NULL,
    CONSTRAINT "pk_diseases" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "patients" (
    "id" int   NOT NULL,
    "disease_id" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    CONSTRAINT "pk_patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "doctors" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "specialization" text   NULL,
    "patient_id" int   NOT NULL,
    CONSTRAINT "pk_doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "diagnoses" (
    "id" int   NOT NULL,
    "visit_id" int   NOT NULL,
    "disease_id" int   NOT NULL,
    CONSTRAINT "pk_diagnoses" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "visits" (
    "id" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    CONSTRAINT "pk_visits" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "patients" ADD CONSTRAINT "fk_patients_disease_id" FOREIGN KEY("disease_id")
REFERENCES "diseases" ("id");

ALTER TABLE "patients" ADD CONSTRAINT "fk_patients_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "doctors" ("id");

ALTER TABLE "doctors" ADD CONSTRAINT "fk_doctors_patient_id" FOREIGN KEY("patient_id")
REFERENCES "patients" ("id");

ALTER TABLE "diagnoses" ADD CONSTRAINT "fk_diagnoses_visit_id" FOREIGN KEY("visit_id")
REFERENCES "visits" ("id");

ALTER TABLE "diagnoses" ADD CONSTRAINT "fk_diagnoses_disease_id" FOREIGN KEY("disease_id")
REFERENCES "diseases" ("id");

