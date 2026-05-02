CREATE OR REPLACE FUNCTION get_branch_liquidity(p_branch_id IN NUMBER) 
RETURN NUMBER 
IS
    v_liquidity NUMBER(20,2);
BEGIN
    SELECT SUM("balance")
    INTO v_liquidity
    FROM "account"
    WHERE "branch_id" = p_branch_id;

    RETURN NVL(v_liquidity, 0);
END;
/