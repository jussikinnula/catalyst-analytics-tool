-- 
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Fri Feb 20 12:09:04 2015
-- 
;
--
-- Table: request.
--
CREATE TABLE "request" (
  "id" serial NOT NULL,
  "created" timestamp with time zone NOT NULL,
  "parameters" json NOT NULL,
  PRIMARY KEY ("id")
);

;
