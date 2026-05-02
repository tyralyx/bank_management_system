CREATE OR REPLACE TRIGGER trg_check_minimum_balance
BEFORE UPDATE OF "balance" ON "account"
FOR EACH ROW
BEGIN
    IF :NEW."balance" < 0 THEN
        RAISE_APPLICATION_ERROR(-20005, 
            'Transaction Denied: Account ' || :OLD."account_number" || 
            ' cannot have a negative balance. Current: ' || :OLD."balance");
    END IF;
END;
/