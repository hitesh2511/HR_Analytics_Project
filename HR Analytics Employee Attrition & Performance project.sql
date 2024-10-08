USE [HR Analytics Employee Attrition & Performance]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 07-09-2024 10:06:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Age] [tinyint] NOT NULL,
	[BusinessTravel] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[DistanceFromHome_KM] [tinyint] NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Ethnicity] [nvarchar](50) NOT NULL,
	[Education] [tinyint] NOT NULL,
	[EducationField] [nvarchar](50) NOT NULL,
	[JobRole] [nvarchar](50) NOT NULL,
	[MaritalStatus] [nvarchar](50) NOT NULL,
	[Salary] [int] NOT NULL,
	[StockOptionLevel] [tinyint] NOT NULL,
	[OverTime] [int] NOT NULL,
	[HireDate] [date] NOT NULL,
	[Attrition] [int] NOT NULL,
	[YearsAtCompany] [tinyint] NOT NULL,
	[YearsInMostRecentRole] [tinyint] NOT NULL,
	[YearsSinceLastPromotion] [tinyint] NOT NULL,
	[YearsWithCurrManager] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerformanceRating]    Script Date: 07-09-2024 10:06:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerformanceRating](
	[PerformanceID] [nvarchar](50) NOT NULL,
	[EmployeeID] [nvarchar](50) NOT NULL,
	[ReviewDate] [date] NOT NULL,
	[EnvironmentSatisfaction] [tinyint] NOT NULL,
	[JobSatisfaction] [tinyint] NOT NULL,
	[RelationshipSatisfaction] [tinyint] NOT NULL,
	[TrainingOpportunitiesWithinYear] [tinyint] NOT NULL,
	[TrainingOpportunitiesTaken] [tinyint] NOT NULL,
	[WorkLifeBalance] [tinyint] NOT NULL,
	[SelfRating] [tinyint] NOT NULL,
	[ManagerRating] [tinyint] NOT NULL
) ON [PRIMARY]
GO
