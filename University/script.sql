USE [University]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 4.01.2025 18:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonProgram]    Script Date: 4.01.2025 18:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonProgram](
	[LessonId] [int] NOT NULL,
	[ProgramId] [int] NOT NULL,
 CONSTRAINT [PK_LessonProgram] PRIMARY KEY CLUSTERED 
(
	[LessonId] ASC,
	[ProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Program]    Script Date: 4.01.2025 18:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 4.01.2025 18:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Phone] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[ProgramId] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentProgram]    Script Date: 4.01.2025 18:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentProgram](
	[StudentId] [int] NOT NULL,
	[ProgramId] [int] NOT NULL,
 CONSTRAINT [PK_StudentProgram] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[ProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 4.01.2025 18:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherLesson]    Script Date: 4.01.2025 18:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherLesson](
	[TeacherId] [int] NOT NULL,
	[LessonId] [int] NOT NULL,
 CONSTRAINT [PK_TeacherLesson] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC,
	[LessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LessonProgram]  WITH CHECK ADD  CONSTRAINT [FK_LessonProgram_Lesson1] FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lesson] ([Id])
GO
ALTER TABLE [dbo].[LessonProgram] CHECK CONSTRAINT [FK_LessonProgram_Lesson1]
GO
ALTER TABLE [dbo].[LessonProgram]  WITH NOCHECK ADD  CONSTRAINT [FK_LessonProgram_Program1] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[Program] ([ID])
GO
ALTER TABLE [dbo].[LessonProgram] NOCHECK CONSTRAINT [FK_LessonProgram_Program1]
GO
ALTER TABLE [dbo].[StudentProgram]  WITH CHECK ADD  CONSTRAINT [FK_StudentProgram_Program] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[Program] ([ID])
GO
ALTER TABLE [dbo].[StudentProgram] CHECK CONSTRAINT [FK_StudentProgram_Program]
GO
ALTER TABLE [dbo].[StudentProgram]  WITH CHECK ADD  CONSTRAINT [FK_StudentProgram_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentProgram] CHECK CONSTRAINT [FK_StudentProgram_Student]
GO
ALTER TABLE [dbo].[TeacherLesson]  WITH CHECK ADD  CONSTRAINT [FK_TeacherLesson_Lesson1] FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lesson] ([Id])
GO
ALTER TABLE [dbo].[TeacherLesson] CHECK CONSTRAINT [FK_TeacherLesson_Lesson1]
GO
ALTER TABLE [dbo].[TeacherLesson]  WITH CHECK ADD  CONSTRAINT [FK_TeacherLesson_Teacher1] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[TeacherLesson] CHECK CONSTRAINT [FK_TeacherLesson_Teacher1]
GO
