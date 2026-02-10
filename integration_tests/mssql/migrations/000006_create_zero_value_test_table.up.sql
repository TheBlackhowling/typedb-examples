-- Table for testing partial update zero-value behavior (string, bool, int, float)
CREATE TABLE zero_value_test (
    id INT IDENTITY(1,1) PRIMARY KEY,
    str_col NVARCHAR(255) NOT NULL DEFAULT '',
    bool_col BIT NOT NULL DEFAULT 1,
    int_col INT NOT NULL DEFAULT 0,
    float_col FLOAT NOT NULL DEFAULT 0.0
);
