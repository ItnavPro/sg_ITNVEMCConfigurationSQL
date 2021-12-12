USE ACS
GO

DECLARE @SourceAppName VARCHAR(50) = $(source)
DECLARE @AppName VARCHAR(50) = $(target)
SELECT 'Copy template from ' + @SourceAppName + ' to ' + @AppName

DECLARE @AppDesc VARCHAR(500) = 'DESCRIPTION ' + @AppName
DECLARE @Editor VARCHAR(50) = CURRENT_USER
DECLARE @cnt INT
DECLARE @SourceAppId INT
DECLARE @AppId INT

SELECT @cnt=COUNT(*) FROM tblApplication WHERE AppName = @AppName
IF @cnt <=0
	INSERT INTO tblApplication
           (AppName
           ,Description
		   ,Editor
		   ,EditTime
		   )
     VALUES
           (@AppName
           ,@AppDesc
           ,@Editor
           ,GETDATE())
ELSE
	SELECT 'Application ' + @AppName + ' exists in ACS DB'  Message

SELECT @AppId=AppId FROM tblApplication WHERE AppName = @AppName
SELECT @AppId AppId 

SELECT @SourceAppId=AppId FROM tblApplication WHERE AppName = @SourceAppName
SELECT @SourceAppId SourceAppId 
SELECT @cnt=COUNT(*) FROM tblTemplatePrimary WHERE AppId = @AppId
IF @cnt <=0
BEGIN
	INSERT INTO tblTemplatePrimary
           (AppID
           ,ConfigName
           ,DefaultValue
           ,Description
           ,TypeID
           ,SortOrder
           ,SectionID
           ,ListGroupID
           ,AllowEdit
           ,Editor
           ,EditTime)

	SELECT 
		  @AppID
		  ,ConfigName
		  ,DefaultValue
		  ,Description
		  ,TypeID
		  ,SortOrder
		  ,SectionID
		  ,ListGroupID
		  ,AllowEdit
		  ,@Editor
		  ,GETDATE()
	FROM tblTemplatePrimary
	WHERE AppId=@SourceAppId

	-- create records in the tblTemplateSub table for new applicatio
	DECLARE @tbl TABLE (TemplateID_S INT, TemplateId_T INT)
	INSERT INTO @tbl
	 (TemplateID_S,TemplateID_T)
	 SELECT A.TemplateID, B.TemplateID FROM tblTemplatePrimary A
	 INNER JOIN tblTemplatePrimary B ON A.ConfigName=B.ConfigName
	 WHERE A.TypeID=3 AND A.AppId=@SourceAppId AND B.AppId=@AppId AND B.TypeID = 3

	DECLARE @s INT
	DECLARE @t INT

	DECLARE cr CURSOR FOR
	SELECT TemplateID_S,TemplateID_T FROM @tbl 
	OPEN cr
	FETCH NEXT FROM cr INTO @s, @t
	WHILE @@FETCH_STATUS=0
	BEGIN
		INSERT INTO tblTemplateSub
			   (TemplateID
			   ,ConfigName
			   ,DefaultValue
			   ,Description
			   ,TypeID
			   ,DisplayName
			   ,DelimitChar
			   ,ListGroupID
			   ,Editor
			   ,EditTime)
		 SELECT 
				@t
			   ,ConfigName
			   ,DefaultValue
			   ,Description
			   ,TypeID
			   ,DisplayName
			   ,DelimitChar
			   ,ListGroupID
			   ,@Editor
			   ,GETDATE()
		 FROM tblTemplateSub WHERE TemplateID= @s

		 FETCH NEXT FROM cr INTO @s, @t
	 END
	 CLOSE cr 
	 DEALLOCATE cr
END
ELSE
	SELECT 'Application ' + @AppName + ' exists in tblTemplatePrimary (AppId:' + CAST(@AppId AS VARCHAR(20)) + ') in ACS DB'  Message
GO	