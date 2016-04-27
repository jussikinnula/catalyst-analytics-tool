-- 
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Wed Apr 27 10:21:57 2016
-- 
;
--
-- Table: request
--
CREATE TABLE "request" (
  "id" serial NOT NULL,
  "created" timestamp with time zone NOT NULL,
  "parameters" jsonb NOT NULL,
  PRIMARY KEY ("id")
);

;
