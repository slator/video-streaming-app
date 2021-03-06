USE [VideoStreamingApplication]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 14.11.2017 21:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExerciseMuscleGroups]    Script Date: 14.11.2017 21:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExerciseMuscleGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExcerciseId] [int] NOT NULL,
	[MuscleGroupId] [int] NOT NULL,
 CONSTRAINT [PK_ExerciseMuscleGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exercises]    Script Date: 14.11.2017 21:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exercises](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [ntext] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Exercises] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExerciseVideos]    Script Date: 14.11.2017 21:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExerciseVideos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExerciseId] [int] NOT NULL,
	[GenderId] [int] NOT NULL,
	[VideoId] [int] NOT NULL,
 CONSTRAINT [PK_ExerciseVideos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 14.11.2017 21:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuscleGroups]    Script Date: 14.11.2017 21:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuscleGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ParentMuscleGroup] [int] NOT NULL,
 CONSTRAINT [PK_MuscleGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 14.11.2017 21:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Path] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExerciseMuscleGroups]  WITH CHECK ADD  CONSTRAINT [FK_ExerciseMuscleGroups_Exercises] FOREIGN KEY([ExcerciseId])
REFERENCES [dbo].[Exercises] ([Id])
GO
ALTER TABLE [dbo].[ExerciseMuscleGroups] CHECK CONSTRAINT [FK_ExerciseMuscleGroups_Exercises]
GO
ALTER TABLE [dbo].[ExerciseMuscleGroups]  WITH CHECK ADD  CONSTRAINT [FK_ExerciseMuscleGroups_MuscleGroups] FOREIGN KEY([MuscleGroupId])
REFERENCES [dbo].[MuscleGroups] ([Id])
GO
ALTER TABLE [dbo].[ExerciseMuscleGroups] CHECK CONSTRAINT [FK_ExerciseMuscleGroups_MuscleGroups]
GO
ALTER TABLE [dbo].[Exercises]  WITH CHECK ADD  CONSTRAINT [FK_Exercises_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Exercises] CHECK CONSTRAINT [FK_Exercises_Categories]
GO
ALTER TABLE [dbo].[ExerciseVideos]  WITH CHECK ADD  CONSTRAINT [FK_ExerciseVideos_Exercises] FOREIGN KEY([ExerciseId])
REFERENCES [dbo].[Exercises] ([Id])
GO
ALTER TABLE [dbo].[ExerciseVideos] CHECK CONSTRAINT [FK_ExerciseVideos_Exercises]
GO
ALTER TABLE [dbo].[ExerciseVideos]  WITH CHECK ADD  CONSTRAINT [FK_ExerciseVideos_Genders] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[ExerciseVideos] CHECK CONSTRAINT [FK_ExerciseVideos_Genders]
GO
ALTER TABLE [dbo].[ExerciseVideos]  WITH CHECK ADD  CONSTRAINT [FK_ExerciseVideos_Videos] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([Id])
GO
ALTER TABLE [dbo].[ExerciseVideos] CHECK CONSTRAINT [FK_ExerciseVideos_Videos]
GO
ALTER TABLE [dbo].[MuscleGroups]  WITH CHECK ADD  CONSTRAINT [FK_MuscleGroups_MuscleGroups1] FOREIGN KEY([ParentMuscleGroup])
REFERENCES [dbo].[MuscleGroups] ([Id])
GO
ALTER TABLE [dbo].[MuscleGroups] CHECK CONSTRAINT [FK_MuscleGroups_MuscleGroups1]
GO
