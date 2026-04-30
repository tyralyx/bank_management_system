CREATE OR REPLACE PROCEDURE log_transfer (
    p_sender    IN NUMBER,
    p_receiver  IN NUMBER,
    p_amount    IN NUMBER,
    p_desc      IN VARCHAR2,
    p_status    IN VARCHAR2
) AS
BEGIN
    INSERT INTO "transfer_history" (
        "payment_id", "sender_id", "recepient_id", "amount", "description", "status", "time"
    ) VALUES (
        SYS_GUID(),
        p_sender, p_receiver, p_amount, p_desc, p_status, 
    );
COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END log_transfer;
/