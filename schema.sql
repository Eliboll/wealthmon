CREATE TABLE zones (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    zone_id INTEGER REFERENCES zones(id),
    name TEXT NOT NULL,
    type TEXT CHECK (type IN ('cash', 'investment')),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE account_snapshots (
    account_id INTEGER REFERENCES accounts(id),
    date DATE NOT NULL,
    cash_balance DECIMAL NOT NULL,
    total_investment_value DECIMAL NOT NULL,
    PRIMARY KEY (account_id, date),
    UNIQUE(account_id, date)
);


CREATE TABLE holding_snapshots (
    account_id INTEGER REFERENCES accounts(id),
    date DATE NOT NULL,
    holding_name TEXT NOT NULL,
    quantity DECIMAL NOT NULL,
    price_per_unit DECIMAL NOT NULL,
    cost_basis DECIMAL NOT NULL,
    PRIMARY KEY (account_id, date, holding_name)  -- Composite Primary Key
    UNIQUE(account_id,date,holding_name)
);
