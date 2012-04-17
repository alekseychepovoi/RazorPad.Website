USE [RazorPad]
GO
/****** Object:  StoredProcedure [dbo].[spAddEditSnippet]    Script Date: 4/17/2012 4:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter PROCEDURE [dbo].[spInsertSnippet](
	@View nvarchar(max),
	@Model nvarchar(max),
	@Title nvarchar(500) = null, 
	@Notes nvarchar(1000) = null, 	
	@Key nvarchar(max),
	@IsRevision bit = 0,
	@CreatedBy nvarchar(max),
	@CloneOf nvarchar(max) = null
)
AS
BEGIN

	Declare @Revision int = 0
	If(@IsRevision = 1)
	Begin
		Select top 1 @Revision = (Revision + 1)
		From Snippets
		Where [Key] = @Key 
		order by Revision desc
	End

	Insert into Snippets
	(CreatedBy, [Key], Model, Notes, Title, [View], Revision, Discriminator)
	Values
	(@CreatedBy, @Key, @Model, @Notes, @Title, @View, @Revision, '')

END
