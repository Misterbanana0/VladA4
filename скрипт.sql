USE [18ip47]
GO
/****** Object:  Table [dbo].[Coтрудники]    Script Date: 29.11.2021 15:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coтрудники](
	[id сотрудника] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[ПаспортныеДанные] [nvarchar](50) NULL,
	[Квалификация] [nvarchar](50) NULL,
	[Стаж] [nvarchar](50) NULL,
	[Должность] [int] NULL,
 CONSTRAINT [PK_Coтрудники] PRIMARY KEY CLUSTERED 
(
	[id сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Дoлжности]    Script Date: 29.11.2021 15:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Дoлжности](
	[id должности] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
 CONSTRAINT [PK_Дoлжности] PRIMARY KEY CLUSTERED 
(
	[id должности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 29.11.2021 15:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[id заказа] [int] NOT NULL,
	[Дата исполнения] [nvarchar](50) NULL,
	[№ Договора] [nvarchar](50) NULL,
	[Клиент] [int] NULL,
	[Дата создания] [datetime] NULL,
	[id статус заказа] [int] NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[id заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[исполнители]    Script Date: 29.11.2021 15:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[исполнители](
	[Заказ] [int] NULL,
	[Исполнитель] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиeнты]    Script Date: 29.11.2021 15:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиeнты](
	[id Клиента] [int] NOT NULL,
	[Организация] [int] NULL,
	[адрес] [nvarchar](50) NULL,
	[Номер телефона] [nvarchar](50) NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
 CONSTRAINT [PK_Клиeнты] PRIMARY KEY CLUSTERED 
(
	[id Клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Организация]    Script Date: 29.11.2021 15:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Организация](
	[Код организации] [int] NOT NULL,
	[Полное название] [nvarchar](50) NULL,
	[E-mail] [nvarchar](50) NULL,
	[Телефон] [nvarchar](50) NULL,
	[Адрес] [nvarchar](50) NULL,
 CONSTRAINT [PK_Организация] PRIMARY KEY CLUSTERED 
(
	[Код организации] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статусы заказов]    Script Date: 29.11.2021 15:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статусы заказов](
	[id статуса заказа] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
 CONSTRAINT [PK_Статусы заказов] PRIMARY KEY CLUSTERED 
(
	[id статуса заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги]    Script Date: 29.11.2021 15:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги](
	[ID услуги] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NULL,
	[Цена] [nvarchar](50) NULL,
 CONSTRAINT [PK_Услуги] PRIMARY KEY CLUSTERED 
(
	[ID услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги заказы]    Script Date: 29.11.2021 15:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги заказы](
	[id заказа] [int] NULL,
	[id услуги] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Coтрудники]  WITH CHECK ADD  CONSTRAINT [FK_Coтрудники_Дoлжности] FOREIGN KEY([Должность])
REFERENCES [dbo].[Дoлжности] ([id должности])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Coтрудники] CHECK CONSTRAINT [FK_Coтрудники_Дoлжности]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Клиeнты] FOREIGN KEY([Клиент])
REFERENCES [dbo].[Клиeнты] ([id Клиента])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Клиeнты]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Статусы заказов] FOREIGN KEY([id статус заказа])
REFERENCES [dbo].[Статусы заказов] ([id статуса заказа])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Статусы заказов]
GO
ALTER TABLE [dbo].[исполнители]  WITH CHECK ADD  CONSTRAINT [FK_исполнители_Coтрудники] FOREIGN KEY([Исполнитель])
REFERENCES [dbo].[Coтрудники] ([id сотрудника])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[исполнители] CHECK CONSTRAINT [FK_исполнители_Coтрудники]
GO
ALTER TABLE [dbo].[исполнители]  WITH CHECK ADD  CONSTRAINT [FK_исполнители_Заказы] FOREIGN KEY([Заказ])
REFERENCES [dbo].[Заказы] ([id заказа])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[исполнители] CHECK CONSTRAINT [FK_исполнители_Заказы]
GO
ALTER TABLE [dbo].[Клиeнты]  WITH CHECK ADD  CONSTRAINT [FK_Клиeнты_Организация] FOREIGN KEY([Организация])
REFERENCES [dbo].[Организация] ([Код организации])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Клиeнты] CHECK CONSTRAINT [FK_Клиeнты_Организация]
GO
ALTER TABLE [dbo].[Услуги]  WITH CHECK ADD  CONSTRAINT [FK_Услуги_Группы услуг1] FOREIGN KEY([Цена])
REFERENCES [dbo].[Группы услуг] ([ID группы])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Услуги] CHECK CONSTRAINT [FK_Услуги_Группы услуг1]
GO
ALTER TABLE [dbo].[Услуги заказы]  WITH CHECK ADD  CONSTRAINT [FK_Услуги заказы_Заказы] FOREIGN KEY([id заказа])
REFERENCES [dbo].[Заказы] ([id заказа])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Услуги заказы] CHECK CONSTRAINT [FK_Услуги заказы_Заказы]
GO
ALTER TABLE [dbo].[Услуги заказы]  WITH CHECK ADD  CONSTRAINT [FK_Услуги заказы_Услуги] FOREIGN KEY([id услуги])
REFERENCES [dbo].[Услуги] ([ID услуги])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Услуги заказы] CHECK CONSTRAINT [FK_Услуги заказы_Услуги]
GO
