CREATE OR REPLACE FUNCTION check_loan_eligibility(p_cust_id IN NUMBER) 
RETURN NUMBER 
IS
    v_total_deposits NUMBER(20,2);
    v_total_loans NUMBER(20,2);
BEGIN
    -- Get total balance using the function above
    v_total_deposits := get_total_customer_balance(p_cust_id);
    
    -- Get total existing loans
    SELECT SUM(l."amount")
    INTO v_total_loans
    FROM "loan" l
    JOIN "customer_loan" cl ON l."loan_id" = cl."loan_id"
    WHERE cl."cust_id" = p_cust_id;

    -- Return ratio (Existing Loans / Deposits)
    IF v_total_deposits = 0 THEN
        RETURN 999; -- High risk/No deposits
    ELSE
        RETURN NVL(v_total_loans, 0) / v_total_deposits;
    END IF;
END;
/