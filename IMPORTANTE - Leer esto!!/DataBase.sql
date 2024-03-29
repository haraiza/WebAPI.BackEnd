﻿USE [EmployeeDB]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 8/3/2021 12:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/3/2021 10:45:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](500) NULL,
	[Department] [varchar](500) NULL,
	[DateOfJoining] [date] NULL,
	[PhotoFileName] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteDepartment]    Script Date: 8/3/2021 12:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteDepartment]
	(@DepartmentId int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Department where DepartmentId = @DepartmentId;
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteEmployee]    Script Date: 8/3/2021 12:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteEmployee]
	(@EmployeeId int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Employee where EmployeeId = @EmployeeId;
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllDepartmentNames]    Script Date: 8/3/2021 12:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllDepartmentNames]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select DepartmentName from dbo.Department
END
GO
/****** Object:  StoredProcedure [dbo].[spGetDepartment]    Script Date: 8/3/2021 12:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetDepartment]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Department
END
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployee]    Script Date: 8/3/2021 12:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetEmployee]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Employee
END
GO
/****** Object:  StoredProcedure [dbo].[spPostDepartment]    Script Date: 8/3/2021 12:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spPostDepartment]
	(
		@DepartmentName varchar(50)
	)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert Department (DepartmentName) values (@DepartmentName)
END
GO
/****** Object:  StoredProcedure [dbo].[spPostEmployee]    Script Date: 8/3/2021 12:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spPostEmployee]
	(
		@EmployeeName varchar(50),
		@Department varchar(50),
		@DateOfJoining date,
		@PhotoFileName varchar(50)
	)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert Employee (EmployeeName, Department, DateOfJoining, PhotoFileName) values
	(@EmployeeName,@Department,@DateOfJoining,@PhotoFileName)
END
GO
/****** Object:  StoredProcedure [dbo].[spPostImages]    Script Date: 8/3/2021 12:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spPostImages]
	(
		@ImageName varchar(50),
		@Image int
	)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert Images (ImageName, Image) values (@ImageName,@Image)
END
GO
/****** Object:  StoredProcedure [dbo].[spPutDepartment]    Script Date: 8/3/2021 12:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spPutDepartment]
	(@DepartmentId int,
	@DepartmentName varchar(50)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Department set DepartmentName = @DepartmentName
					where DepartmentId = @DepartmentId;
END
GO
/****** Object:  StoredProcedure [dbo].[spPutEmployee]    Script Date: 8/3/2021 12:30:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spPutEmployee]
	(@EmployeeId int,
	@EmployeeName varchar(50),
	@Department varchar(50),
	@DateOfJoining date,
	@PhotoFileName varchar(50)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Employee set EmployeeName = @EmployeeName,
						Department = @Department,
						DateOfJoining = @DateOfJoining,
						PhotoFileName = @PhotoFileName
					where EmployeeId = @EmployeeId;
END
GO
