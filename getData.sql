DECLARE @XML XML
SET @XML = (SELECT * FROM OPENROWSET (BULK 'c:\Users\Sveta\Documents\SQL Server Management Studio\valute.xml', SINGLE_BLOB) AS data1)

DECLARE @XML1 XML
SET @XML1 = (SELECT * FROM OPENROWSET (BULK 'c:\Users\Sveta\Documents\SQL Server Management Studio\vallib.xml', SINGLE_BLOB) AS data2)

DECLARE @handle INT  
DECLARE @PrepareXmlStatus INT  

EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @XML
EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @XML1

INSERT INTO valcurs.dbo.valLib
    SELECT  
          Tbl.Col.value('@ID', 'char(10)') AS idVal,  
          Tbl.Col.value('EngName[1]', 'char(10)') AS EngName
    FROM   @XML1.nodes('//Item') Tbl(Col)

WHILE 0 = 0
BEGIN 

    INSERT INTO valcurs.dbo.valute
    SELECT  
          Tbl1.Col.value('@Date', 'char(10)') AS Date,
          Tbl2.Col.value('@ID', 'char(10)') AS idVal,  
          Tbl2.Col.value('NumCode[1]', 'int') AS NumCode,  
          Tbl2.Col.value('CharCode[1]', 'char(10)') AS CharCode,
          Tbl2.Col.value('Nominal[1]', 'int') AS Nominal,
          Tbl2.Col.value('Name[1]', 'char(100)') AS Name,
          Tbl2.Col.value('Value[1]', 'nvarchar(10)') AS Value
    FROM   @XML.nodes('//ValCurs') Tbl1(Col), @XML.nodes('//Valute') Tbl2(Col) 

	WAITFOR TIME '00:00'
END  

