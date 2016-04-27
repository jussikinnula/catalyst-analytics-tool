-- Convert schema '/Users/spot/dev/catalyst-analytics-tool/share/migrations/_source/deploy/1/001-auto.yml' to '/Users/spot/dev/catalyst-analytics-tool/share/migrations/_source/deploy/2/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE request ALTER COLUMN parameters TYPE jsonb;

;

COMMIT;

