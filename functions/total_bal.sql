CREATE OR REPLACE FUNCTION get_total_customer_balance(p_cust_id IN NUMBER) 
RETURN NUMBER 
IS
    v_total_balance NUMBER(20,2);
BEGIN
    SELECT SUM(a."balance")
    INTO v_total_balance
    FROM "account" a
    JOIN "customer_account" ca ON a."account_number" = ca."account_number"
    WHERE ca."cust_id" = p_cust_id;

    RETURN NVL(v_total_balance, 0);
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END;
/