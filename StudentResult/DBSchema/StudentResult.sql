USE [master]
GO
/****** Object:  Database [StudentResult]    Script Date: 04-04-2023 15:10:52 ******/
CREATE DATABASE [StudentResult]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentResult', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentResult.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentResult_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentResult_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentResult].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentResult] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentResult] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentResult] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentResult] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentResult] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentResult] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StudentResult] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentResult] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentResult] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentResult] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentResult] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentResult] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentResult] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentResult] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentResult] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudentResult] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentResult] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentResult] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentResult] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentResult] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentResult] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentResult] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentResult] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentResult] SET  MULTI_USER 
GO
ALTER DATABASE [StudentResult] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentResult] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentResult] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentResult] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [StudentResult]
GO
/****** Object:  Table [dbo].[tbl_Result]    Script Date: 04-04-2023 15:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Result](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[StudentName] [varchar](75) NULL,
	[Sub_Code] [nvarchar](75) NULL,
	[InternMarks] [int] NULL,
	[UniversityMarks] [int] NULL,
	[Total] [int] NULL,
	[Percentage] [int] NULL,
	[OutComeStatus] [nvarchar](75) NULL,
	[UploadMarksheet] [nvarchar](max) NULL,
	[flag] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[Createdby] [nvarchar](75) NULL,
	[UpdatedOn] [datetime] NULL,
	[Updatedby] [nvarchar](75) NULL,
 CONSTRAINT [PK__tbl_Resu__3214EC071683F4FA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Staff]    Script Date: 04-04-2023 15:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Staff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](75) NULL,
	[Password] [nvarchar](75) NULL,
	[EmailID] [nvarchar](75) NULL,
	[Role] [nvarchar](75) NULL,
	[Status] [varchar](75) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_StudentProfile]    Script Date: 04-04-2023 15:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StudentProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[RegNo] [nvarchar](75) NULL,
	[DOB] [date] NULL,
	[Batch] [nvarchar](75) NULL,
	[Class] [nvarchar](75) NULL,
	[Section] [nvarchar](75) NULL,
	[EmailID] [nvarchar](75) NULL,
	[Password] [nvarchar](75) NULL,
	[UploadFile] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[Createdby] [varchar](75) NULL,
	[Updatedby] [varchar](75) NULL,
	[Updatedon] [datetime] NULL,
	[Status] [nvarchar](75) NULL,
 CONSTRAINT [PK__tbl_Stud__3214EC0732CFBEDC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Result] ON 

INSERT [dbo].[tbl_Result] ([Id], [StudentId], [StudentName], [Sub_Code], [InternMarks], [UniversityMarks], [Total], [Percentage], [OutComeStatus], [UploadMarksheet], [flag], [CreatedOn], [Createdby], [UpdatedOn], [Updatedby]) VALUES (1, 1, N'Simi - 922316104023', N'12312', 12, 46, 58, 58, N'Pass', N'LIS Logo.pdf', NULL, CAST(N'2023-04-01T19:40:25.013' AS DateTime), N'simi@123', CAST(N'2023-04-03T14:11:10.580' AS DateTime), N'simi@123')
SET IDENTITY_INSERT [dbo].[tbl_Result] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Staff] ON 

INSERT [dbo].[tbl_Staff] ([Id], [Username], [Password], [EmailID], [Role], [Status]) VALUES (1, N'vswc', N'vswc', N'simi@gmail.com', N'Staff', N'Active')
SET IDENTITY_INSERT [dbo].[tbl_Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_StudentProfile] ON 

INSERT [dbo].[tbl_StudentProfile] ([Id], [Name], [RegNo], [DOB], [Batch], [Class], [Section], [EmailID], [Password], [UploadFile], [CreatedOn], [Createdby], [Updatedby], [Updatedon], [Status]) VALUES (1, N'Simi', N'922316104023', CAST(N'2000-02-05' AS Date), N'Batch2', N'class1', N'sectionA', N'simigracia21@gmail.com', N'12345678', N'download.jpg', CAST(N'2023-04-01T17:05:55.537' AS DateTime), N'simi@123', NULL, NULL, N'Active')
SET IDENTITY_INSERT [dbo].[tbl_StudentProfile] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_b_login]    Script Date: 04-04-2023 15:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_b_login]
(
@Id integer=null,
@Username varchar(75)=null,
@Password varchar(75)=null,
@EmailID varchar(75)=null,
@Role varchar(75)=null,
@Status varchar(75)=null,
@qtype varchar(75)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	if(@qtype='stafflogin')
	Begin
	select * from tbl_STaff where Username=@Username and Password=@Password and Status='Active'
	End

	else if(@qtype='studentlogin')
	Begin
	select * from tbl_StudentProfile where EmailID=@Username and Password=@Password and Status='Active'
	End

    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_b_Result]    Script Date: 04-04-2023 15:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_b_Result]
(
	@Id integer= NULL,
	@StudentId integer= NULL,
	@StudentName varchar(75)= NULL,
	@Sub_Code nvarchar(75)= NULL,
	@InternMarks integer= NULL,
	@UniversityMarks integer= NULL,
	@Total integer= NULL,
	@Percentage integer= NULL,
	@OutComeStatus nvarchar(75)= NULL,
	@UploadMarksheet nvarchar(max) =NULL,
	@flag bit= NULL,
	@CreatedOn datetime =NULL,
	@Createdby nvarchar(75)= NULL,
	@UpdatedOn datetime= NULL,
	@Updatedby nvarchar(75)= NULL,
	@qtype nvarchar(75),
	@MSG varchar(100) = null OUTPUT,
	@PageIndex int = null,
	@PageSize int = null,
	@role varchar(50)=null,
	@RecordCount int = null output
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if(@qtype='insertdealer')
	Begin
	insert into tbl_Result(StudentId,StudentName,Sub_Code,InternMarks,UniversityMarks,Total,Percentage,OutComeStatus,flag,CreatedOn,Createdby)Values
	(@StudentId,@StudentName,@Sub_Code,@InternMarks,@UniversityMarks,@Total,@Percentage,@OutComeStatus,0,getdate(),@Createdby)
	End

	else if(@qtype='selectlist')
	Begin
	SELECT ROW_NUMBER() OVER
				 (
				   order by Id desc
				   ) AS slNo,
				   Id,
				   StudentId,
				   StudentName,
				   Sub_Code,
				   InternMarks,
				   UniversityMarks,
				   Total,
				   Percentage,
				   OutComeStatus,
				   flag,
				   CreatedOn,
				   Createdby,
				   UploadMarksheet
                   
				INTO #Results FROM tbl_Result  

				where 
					(@StudentName is null or StudentName like '%'+ @StudentName +'%') and 
					(@OutComeStatus is null or OutComeStatus like '%'+ @OutComeStatus +'%') and 
					(@Sub_Code is null or Sub_Code like '%'+ @Sub_Code +'%') and OutComeStatus='Pass'

				SELECT @RecordCount = COUNT(*) FROM #Results 
				             
				SELECT * FROM #Results WHERE slNo BETWEEN(@PageIndex -1) * @PageSize + 1   
				AND (((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1  
       
				DROP TABLE #Results  
			  set @MSG = 'Select Success'


	End
	else if(@qtype='UpdateDealer')
	Begin
	Update tbl_Result SET 
	StudentId=@StudentId,StudentName=@StudentName,Sub_Code=@Sub_Code,InternMarks=@InternMarks,UniversityMarks=@UniversityMarks,Total=@Total,Percentage=@Percentage,OutComeStatus=@OutComeStatus,flag=@flag,
	UpdatedBy=@UpdatedBy,
	UpdatedOn=getdate() where Id=@Id
	End

	else if(@qtype='ViewDealer')
	Begin
	select Id,StudentId,StudentName,Sub_Code,InternMarks,UniversityMarks,Total,Percentage,OutComeStatus,flag,CreatedOn,Createdby from tbl_Result where Id=@Id
	End

	else if(@qtype='DeleteDealer')
	begin
	delete from tbl_Result where Id=@Id
	SET @MSG ='Deleted Successfully'
	end
	else if(@qtype='Studentlist')
	Begin
	select Distinct ConCAt(Name,' - ',RegNo) AS SName,Id from tbl_StudentProfile where Status='Active' and RegNo !=''
	End

	else if(@qtype='updatemarksheet')
	Begin
	Update tbl_Result SET UploadMarksheet=@UploadMarksheet,UpdatedBy=@UpdatedBy,UpdatedOn=getdate() where Id=@Id
	End

	else if(@qtype='faillistdata')
	Begin
	SELECT ROW_NUMBER() OVER
				 (
				   order by Id desc
				   ) AS slNo,
				   Id,
				   StudentId,
				   StudentName,
				   Sub_Code,
				   InternMarks,
				   UniversityMarks,
				   Total,
				   Percentage,
				   OutComeStatus,
				   flag,
				   CreatedOn,
				   Createdby,
				   UploadMarksheet
                   
				INTO #Results1 FROM tbl_Result  

				where 
					(@StudentName is null or StudentName like '%'+ @StudentName +'%') and 
					(@OutComeStatus is null or OutComeStatus like '%'+ @OutComeStatus +'%') and 
					(@Sub_Code is null or Sub_Code like '%'+ @Sub_Code +'%') and OutComeStatus='Fail'

				SELECT @RecordCount = COUNT(*) FROM #Results1 
				             
				SELECT * FROM #Results1 WHERE slNo BETWEEN(@PageIndex -1) * @PageSize + 1   
				AND (((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1  
       
				DROP TABLE #Results1  
			  set @MSG = 'Select Success'


	End

	else if(@qtype='studentresultlist')
	Begin
	SELECT ROW_NUMBER() OVER
				 (
				   order by Id desc
				   ) AS slNo,
				   Id,
				   StudentId,
				   StudentName,
				   Sub_Code,
				   InternMarks,
				   UniversityMarks,
				   Total,
				   Percentage,
				   OutComeStatus,
				   flag,
				   CreatedOn,
				   Createdby,
				   UploadMarksheet
                   
				INTO #Results2 FROM tbl_Result  

				where 
					(@StudentName is null or StudentName like '%'+ @StudentName +'%') and 
					(@OutComeStatus is null or OutComeStatus like '%'+ @OutComeStatus +'%') and 
					(@Sub_Code is null or Sub_Code like '%'+ @Sub_Code +'%') and Id=@Id

				SELECT @RecordCount = COUNT(*) FROM #Results2 
				             
				SELECT * FROM #Results2 WHERE slNo BETWEEN(@PageIndex -1) * @PageSize + 1   
				AND (((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1  
       
				DROP TABLE #Results2  
			  set @MSG = 'Select Success'


	End
	else if(@qtype='Passcount')
	Begin
	select Count(*) as Total from tbl_StudentProfile
	select Count(*) as Total from tbl_Result where OutComeStatus ='Pass'
    select Count(*) as Total from tbl_Result where OutComeStatus ='Fail'
	End
	
	else if(@qtype='StatusCount')
	Begin
	select Distinct OutComeStatus,Count(*) as Total from tbl_Result group by OutComeStatus 
	End

	else if(@qtype='SubjectPassWise')
	begin
	select Distinct Sub_Code,Count(*) as Total from tbl_Result where OutComeStatus='Pass' group by Sub_Code
	End

	else if(@qtype='SubjectFailWise')
	begin
	select Distinct Sub_Code,Count(*) as Total from tbl_Result where OutComeStatus='Fail' group by Sub_Code
	End

	else if(@qtype='ClassToppper')
	Begin
	select Top 3 Sub_Code, Max(Total) as Total,StudentName from tbl_Result group by Sub_Code,StudentName order by Max(Total) ASC
	End
    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_b_Student]    Script Date: 04-04-2023 15:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_b_Student]
(
@Id integer=NULL,
	@Name nvarchar(100)= NULL,
	@RegNo nvarchar(75) =NULL,
	@DOB date =NULL,
	@Batch nvarchar(75)= NULL,
	@Class nvarchar(75) =NULL,
	@Section nvarchar(75)= NULL,
	@EmailID nvarchar(75)= NULL,
	@Password nvarchar(75)= NULL,
	@UploadFile nvarchar(max) =NULL,
	@CreatedOn datetime= NULL,
	@Createdby varchar(75)= NULL,
	@Updatedby varchar(75)= NULL,
	@Updatedon datetime= NULL,
	@Status nvarchar(75)=null,
	@qtype nvarchar(75),
	@MSG varchar(100) = null OUTPUT,
	@PageIndex int = null,
	@PageSize int = null,
	@role varchar(50)=null,
	@RecordCount int = null output
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if(@qtype='insertdealer')
	Begin
	insert into tbl_StudentProfile(Name,RegNo,DOB,Batch,Class,Section,EmailID,Password,UploadFile,CreatedOn,Createdby,Status)Values
	(@Name,@RegNo,@DOB,@Batch,@Class,@Section,@EmailID,@Password,@UploadFile,getdate(),@Createdby,'Active')
	End

	else if(@qtype='selectlist')
	Begin
	SELECT ROW_NUMBER() OVER
				 (
				   order by Id desc
				   ) AS slNo,
				   Id,
				   Name,
				   RegNo,
				   DOB,
				   Batch,
				   Class,
				   Section,
				   EmailID,
				   Password,
				   UploadFile,
				   CreatedOn,
				   Createdby,
				   Status
                   
				INTO #Results FROM tbl_StudentProfile  

				where 
					(@RegNo is null or RegNo like '%'+ @RegNo +'%') and 
					(@EmailID is null or EmailID like '%'+ @EmailID +'%') and
					(@Batch is null or Batch like '%'+ @Batch +'%') and (@Name is null or Name like '%'+ @Name +'%')
					

				SELECT @RecordCount = COUNT(*) FROM #Results 
				             
				SELECT * FROM #Results WHERE slNo BETWEEN(@PageIndex -1) * @PageSize + 1   
				AND (((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1  
       
				DROP TABLE #Results  
			  set @MSG = 'Select Success'


	End
	else if(@qtype='UpdateDealer')
	Begin
	Update tbl_StudentProfile SET 
	Name=@Name,RegNo=@RegNo,DOB=@DOB,Batch=@Batch,Class=@Class,
	Section=@Section,EmailID=@EmailID,
	Password=@Password,
	UploadFile=@UploadFile,Status=@Status,
	UpdatedBy=@UpdatedBy,
	UpdatedOn=getdate() where Id=@Id
	End

	else if(@qtype='ViewDealer')
	Begin
	select Id,Name,RegNo,DOB,Batch,Class,Section,EmailID,Password,UploadFile,CreatedOn,Createdby,Status,Updatedby,Updatedon from tbl_StudentProfile where Id=@Id
	End

	else if(@qtype='DeleteDealer')
	begin
	delete from tbl_StudentProfile where Id=@Id
	SET @MSG='Deleted Successfully'
	end
   
END
GO
USE [master]
GO
ALTER DATABASE [StudentResult] SET  READ_WRITE 
GO
