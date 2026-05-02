CREATE OR REPLACE FUNCTION get_account_activity_status(p_acc_num IN NUMBER) 
RETURN VARCHAR2 
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM "transfer_history"
    WHERE ("sender_id" = p_acc_num OR "recepient_id" = p_acc_num)
    AND "transfer_date" >= SYSDATE - 30;

    IF v_count = 0 THEN
        RETURN 'INACTIVE (30 DAYS)';
    ELSIF v_count > 10 THEN
        RETURN 'HIGHLY ACTIVE';
    ELSE
        RETURN 'ACTIVE';
    END IF;
END;
/