CREATE OR REPLACE PROCEDURE disburse_loan(
    pLoanId IN NUMBER,
    pAccNumber IN NUMBER
) AS
    vLoanAmt NUMBER;

BEGIN
    SELECT "amount" INTO vLoanAmt
    FROM "loan"
    WHERE "loan_id" = pLoanId;
--account update
    UPDATE "account"
    SET "balance" = "balance" + vLoanAmt
    WHERE "account_number" = pAccNumber;
--disp
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Loan disbursed into account.' || pAccNumber);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20004, 'Loan ID or Account number not found.');
END;
/