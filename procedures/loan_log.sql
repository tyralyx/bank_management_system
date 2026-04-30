CREATE OR REPLACE PROCEDURE log_loan (
    p_cust_id IN NUMBER,
    p_loan_id IN NUMBER,
    p_amount  IN NUMBER
) AS
BEGIN
    INSERT INTO "loan_history" (
        "cust_id",
        "loan_id",
        "amount"
    ) VALUES (
        p_cust_id,
        p_loan_id,
        p_amount
    );
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END log_loan;
/