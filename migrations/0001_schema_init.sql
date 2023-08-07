-- +goose Up

-- create extension for UUID ---------------------------------------------------
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- create update function ------------------------------------------------------
-- +goose StatementBegin
CREATE OR REPLACE FUNCTION update_updated_at_column()
	RETURNS TRIGGER AS
$$
BEGIN
	NEW.updated_at = now();
	RETURN NEW;
END;
$$ language 'plpgsql';
-- +goose StatementEnd

-- create tables ----------------------------------------------------------------
CREATE TABLE IF NOT EXISTS collection (
    id UUID PRIMARY KEY DEFAULT UUID_GENERATE_V4(),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    name TEXT DEFAULT '',
    description TEXT DEFAULT ''
);

CREATE TABLE IF NOT EXISTS product (
    id UUID PRIMARY KEY DEFAULT UUID_GENERATE_V4(),
    created_at TIMESTAMP WITH TIME ZONE  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    name TEXT DEFAULT '',
    description TEXT DEFAULT '',
    inventory INT NOT NULL DEFAULT 0,
    price NUMERIC(10,2) NOT NULL,
    collection_id UUID REFERENCES collection(id) ON DELETE CASCADE
);

CREATE OR REPLACE TRIGGER update_product_updated_at 
    BEFORE UPDATE 
    ON product
    FOR EACH ROW 
    EXECUTE PROCEDURE update_updated_at_column();

-- +goose Down
DROP TABLE IF EXISTS product;

DROP FUNCTION IF EXISTS update_updated_at_column;

DROP EXTENSION IF EXISTS "uuid-ossp";