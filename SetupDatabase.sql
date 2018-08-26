DROP DATABASE mqtt;
CREATE DATABASE mqtt;
USE mqtt;

CREATE TABLE mqtt (
	id SERIAL PRIMARY KEY,
	createdAt TIMESTAMP NOT NULL,
	topic TEXT NOT NULL,
	message TEXT,
	qos NUMERIC(1) NOT NULL
);

CREATE FUNCTION InsertIntoMQTTTable(topic TEXT, message TEXT, qos NUMERIC(1)) RETURNS void AS $$
	BEGIN
		INSERT INTO mqtt (createdAt, topic, message, qos)
		VALUES (CURRENT_TIMESTAMP, topic, message, qos);
	END;
$$ LANGUAGE plpgsql;