CREATE TRIGGER prevent_admin_deletion
ON admin
INSTEAD OF DELETE
AS
BEGIN
    -- Print a message indicating deletion is not allowed
    PRINT 'Deletion from admin table is not allowed.';
    -- Rollback the transaction to prevent deletion
    ROLLBACK TRANSACTION;
END;

