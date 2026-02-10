-- Table for testing partial update zero-value behavior (string, bool, int, float)
CREATE TABLE IF NOT EXISTS zero_value_test (
    id SERIAL PRIMARY KEY,
    str_col TEXT NOT NULL DEFAULT '',
    bool_col BOOLEAN NOT NULL DEFAULT TRUE,
    int_col INTEGER NOT NULL DEFAULT 0,
    float_col DOUBLE PRECISION NOT NULL DEFAULT 0.0
);
