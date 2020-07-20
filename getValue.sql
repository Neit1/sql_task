USE valcurs
GO

CREATE FUNCTION dbo.getValue (@idVal char(10), @Date char(10))  
RETURNS nvarchar(10)  
AS  
BEGIN   
   DECLARE @ret nvarchar(10);  
    SELECT @ret = Value   
    FROM valcurs.dbo.valute v    
    WHERE v.idVal = @idVal 
	    AND v.Date = @Date;  
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;    
END; 
