CREATE OR REPLACE TRIGGER trg_auto_disburse_loan
AFTER INSERT ON "customer_loan"
FOR EACH ROW
DECLARE
    v_loan_amt NUMBER;
    v_acc_num  NUMBER;
BEGIN
    SELECT "amount" INTO v_loan_amt FROM "loan" WHERE "loan_id" = :NEW."loan_id";

    SELECT "account_number" INTO v_acc_num 
    FROM "customer_account" 
    WHERE "cust_id" = :NEW."cust_id"
    FETCH FIRST 1 ROW ONLY;

    UPDATE "account" 
    SET "balance" = "balance" + v_loan_amt 
    WHERE "account_number" = v_acc_num;
    
    INSERT INTO "loan_history" ("cust_id", "loan_id", "amount")
    VALUES (:NEW."cust_id", :NEW."loan_id", v_loan_amt);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20006, 'Loan disbursement failed: No account found for this customer.');
END;
/