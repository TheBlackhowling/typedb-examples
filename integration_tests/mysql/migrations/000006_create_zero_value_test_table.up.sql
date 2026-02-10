-- Table for testing partial update zero-value behavior (string, bool, int, float)
CREATE TABLE IF NOT EXISTS zero_value_test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    str_col VARCHAR(255) NOT NULL DEFAULT '',
    bool_col BOOLEAN NOT NULL DEFAULT TRUE,
    int_col INT NOT NULL DEFAULT 0,
    float_col DOUBLE NOT NULL DEFAULT 0.0
);
