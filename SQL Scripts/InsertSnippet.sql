IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertSnippet]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[InsertSnippet]
GO

CREATE PROCEDURE [dbo].[InsertSnippet](
	@View 				NVARCHAR(MAX),
	@Model 				NVARCHAR(MAX) = NULL,
	@Title 				NVARCHAR(500) = NULL, 
	@Notes 				NVARCHAR(1000) = NULL, 	
	@Key 				NVARCHAR(MAX),
	@CreatedBy 			NVARCHAR(MAX),
	@CloneOf			NVARCHAR(MAX) = NULL,
	@Discriminator		NVARCHAR(128)
)
AS
BEGIN

	INSERT INTO SNIPPETS
		([CloneOf]
		,[CreatedBy]
		,[DateCreated]
		,[Key]
		,[Model]
		,[Notes]
		,[Title]
		,[View]
		,[Revision]
		,[Discriminator])
	OUTPUT Inserted.Revision
	SELECT 
		@cloneOf,
		@CreatedBy, 
		CURRENT_TIMESTAMP,
		@Key, 
		@Model, 
		@Notes, 
		@Title, 
		@View, 
		ISNULL ((SELECT TOP 1 Revision + 1
				   FROM [dbo].[Snippets]
				  WHERE [Key] = @Key 				
			   ORDER BY Revision DESC), 0),
		@Discriminator
END