CREATE OR REPLACE TRIGGER trg_audit_transfer
AFTER UPDATE OF "balance" ON "account"
FOR EACH ROW
BEGIN
    IF :NEW."balance" < :OLD."balance" THEN
        INSERT INTO "transfer_history" (
            "payment_id", "sender_id", "amount", "description", "status"
        ) VALUES (
            DBMS_RANDOM.VALUE(1000, 99999), -- Generating a random ID for testing
            :OLD."account_number",
            :OLD."balance" - :NEW."balance",
            'Withdrawal/Transfer Out',
            'SUCCESS'
        );
    END IF;
END;
/