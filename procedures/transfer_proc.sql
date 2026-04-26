CREATE OR REPLACE PROCEDURE transfer_funds(
    pSenderAccount IN NUMBER,
    pRecieverAccount IN NUMBER,
    pAmount IN NUMBER
)
AS vSenderBal NUMBER;

BEGIN
    SELECT "balance" INTO vSenderBal
    FROM "account"
    WHERE "account_number" = pSenderAccount
    FOR UPDATE;
--SENDER BROKE
    IF vSenderBal < pAmount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in the sender account.');
    END IF;
--SENDER UPDATE
    UPDATE "account"
    SET "balance" = "balance" - pAmount
    WHERE "account_number" = pSenderAccount;
--RECIEVER UPDATE
    UPDATE "account"
    SET "balance" = "balance" + pAmount
    WHERE "account_number" = pRecieverAccount;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Transfer successful.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'One of the account numbers in invalid.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20003, 'Transaction failed.' || SQLERRM);
END;
/

