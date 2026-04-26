CREATE OR REPLACE PROCEDURE new_account_add(
    p_id IN NUMBER,
    p_name IN VARCHAR2,
    p_phone IN NUMBER,
    p_address IN VARCHAR2,
    p_acc_type IN VARCHAR2,
    p_init_dep IN NUMBER,
    p_branch_id IN NUMBER
) AS
BEGIN
    INSERT INTO "customer" ("cust_id", "name", "phone", "address")
    VALUES (p_id, p_name, p_phone, p_address);

    INSERT INTO "account" ("account_number", "account_type", "balance", "branch_id")
    VALUES (p_id * 1000, p_acc_type, p_init_dep, p_branch_id);

    INSERT INTO "customer_account" ("account_number", "cust_id")
    VALUES (p_id * 1000, p_id);

    COMMIT;
END;
/