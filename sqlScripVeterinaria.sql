USE [Veterinari_Pampita]
GO
/****** Object:  Table [dbo].[Animales]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Fecha_Alta] [datetime] NULL,
	[Fecha_Baja] [datetime] NULL,
 CONSTRAINT [PK_Animales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaAnimales]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaAnimales]
AS
SELECT        Nombre, Fecha_Alta, Fecha_Baja, ID
FROM            dbo.Animales
GO
/****** Object:  Table [dbo].[Razas]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Razas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ID_Animal] [int] NULL,
	[Fecha_Alta] [datetime] NULL,
	[Fecha_Baja] [datetime] NULL,
 CONSTRAINT [PK_Razas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaRazas]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaRazas]
AS
SELECT        dbo.Razas.nombre, dbo.Razas.ID_Animal, dbo.Razas.Fecha_Alta, dbo.Animales.ID, dbo.Razas.Fecha_Baja
FROM            dbo.Animales INNER JOIN
                         dbo.Razas ON dbo.Animales.ID = dbo.Razas.ID_Animal
GO
/****** Object:  Table [dbo].[Dueños]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dueños](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Fecha_Alta] [datetime] NULL,
	[Fecha_Baja] [datetime] NULL,
 CONSTRAINT [PK_Dueños] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mascotas]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mascotas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apodo] [varchar](50) NULL,
	[ID_Raza] [int] NULL,
	[ID_Dueño] [int] NULL,
	[Fecha_Baja] [datetime] NULL,
	[Fecha_Alta] [datetime] NULL,
 CONSTRAINT [PK_Mascotas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaMascotas]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaMascotas]
AS
SELECT        dbo.Mascotas.Nombre, dbo.Mascotas.Apodo, dbo.Mascotas.ID_Raza, dbo.Mascotas.ID_Dueño, dbo.Mascotas.Fecha_Alta, dbo.Mascotas.Fecha_Baja, dbo.Dueños.ID, dbo.Razas.ID AS Expr1
FROM            dbo.Mascotas INNER JOIN
                         dbo.Dueños ON dbo.Mascotas.ID_Dueño = dbo.Dueños.ID INNER JOIN
                         dbo.Razas ON dbo.Mascotas.ID_Raza = dbo.Razas.ID
GO
/****** Object:  View [dbo].[VistaDueños]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaDueños]
AS
SELECT        Nombre, Fecha_Alta, Fecha_Baja
FROM            dbo.Dueños
GO
SET IDENTITY_INSERT [dbo].[Animales] ON 
GO
INSERT [dbo].[Animales] ([ID], [Nombre], [Fecha_Alta], [Fecha_Baja]) VALUES (1, N'Gato', CAST(N'2023-11-12T01:27:49.167' AS DateTime), NULL)
GO
INSERT [dbo].[Animales] ([ID], [Nombre], [Fecha_Alta], [Fecha_Baja]) VALUES (2, N'Perro', CAST(N'2023-11-12T02:38:09.160' AS DateTime), NULL)
GO
INSERT [dbo].[Animales] ([ID], [Nombre], [Fecha_Alta], [Fecha_Baja]) VALUES (3, N'Pajaro', CAST(N'2023-11-12T02:39:05.527' AS DateTime), NULL)
GO
INSERT [dbo].[Animales] ([ID], [Nombre], [Fecha_Alta], [Fecha_Baja]) VALUES (4, N'patitos', CAST(N'2023-11-13T21:31:48.080' AS DateTime), NULL)
GO
INSERT [dbo].[Animales] ([ID], [Nombre], [Fecha_Alta], [Fecha_Baja]) VALUES (1004, N'pesesito', CAST(N'2023-11-16T20:11:59.360' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Animales] OFF
GO
ALTER TABLE [dbo].[Mascotas]  WITH CHECK ADD  CONSTRAINT [FK_Mascotas_Dueños] FOREIGN KEY([ID_Dueño])
REFERENCES [dbo].[Dueños] ([ID])
GO
ALTER TABLE [dbo].[Mascotas] CHECK CONSTRAINT [FK_Mascotas_Dueños]
GO
ALTER TABLE [dbo].[Mascotas]  WITH CHECK ADD  CONSTRAINT [FK_Mascotas_Razas] FOREIGN KEY([ID_Raza])
REFERENCES [dbo].[Razas] ([ID])
GO
ALTER TABLE [dbo].[Mascotas] CHECK CONSTRAINT [FK_Mascotas_Razas]
GO
ALTER TABLE [dbo].[Razas]  WITH CHECK ADD  CONSTRAINT [FK_Razas_Animales] FOREIGN KEY([ID])
REFERENCES [dbo].[Animales] ([ID])
GO
ALTER TABLE [dbo].[Razas] CHECK CONSTRAINT [FK_Razas_Animales]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarAnimal]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarAnimal]
    @ID INT,            
    @Nombre varchar(50)  
	
AS
BEGIN
    
    UPDATE Animales
    SET Nombre = @Nombre
    WHERE ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizarDueño]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarDueño]
    @ID INT,            
    @NuevoNombre varchar(50)  
	
AS
BEGIN
    
    UPDATE Dueños
    SET Nombre = @NuevoNombre
    WHERE ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizarMascota]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarMascota]
    @ID INT,
    @NuevoNombre VARCHAR(50),
    @NuevoApodo VARCHAR(50),
    @NuevoID_Raza INT,
    @NuevoID_Dueño INT
AS
BEGIN
    UPDATE Mascotas
    SET
        Nombre = @NuevoNombre,
        Apodo = @NuevoApodo,
        ID_Raza = @NuevoID_Raza,
        ID_Dueño = @NuevoID_Dueño
    WHERE
        ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizarRaza]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarRaza]
    @ID INT,
    @NuevoNombre VARCHAR(50),
    @NuevoID_Animal INT
AS
BEGIN
    UPDATE Razas
    SET
        Nombre = @NuevoNombre,
        ID_Animal = @NuevoID_Animal
    WHERE
        ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[BajaLogicaAnimales]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BajaLogicaAnimales]
    @ID INT  
AS
BEGIN
    
    UPDATE Animales
    SET Fecha_Baja = GETDATE()
    WHERE ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[BajaLogicaDueño]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BajaLogicaDueño]
    @ID INT  
AS
BEGIN
    
    UPDATE Dueños
    SET Fecha_Baja = GETDATE()
    WHERE ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[BajaLogicaMascota]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BajaLogicaMascota]
    @ID INT  
AS
BEGIN
    
    UPDATE Mascotas
    SET Fecha_Baja = GETDATE()
    WHERE ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[BajaLogicaRazas]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BajaLogicaRazas]
    @ID INT  
AS
BEGIN
    
    UPDATE Razas
    SET Fecha_Baja = GETDATE()
    WHERE ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[BuscarAnimal]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[BuscarAnimal]
	@Nombre varchar

as
begin

	select * from VistaAnimales
	where Nombre LIKE '%' + @Nombre + '%'
end;
GO
/****** Object:  StoredProcedure [dbo].[BuscarDueño]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[BuscarDueño]
	@Nombre varchar

as
begin

	select * from VistaDueños
	where Nombre LIKE '%' + @Nombre + '%'
end;
GO
/****** Object:  StoredProcedure [dbo].[BuscarMascota]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BuscarMascota]
	@Nombre varchar (50),
	@Apodo Varchar (50)

as
begin

	select * from VistaMascotas
	WHERE Nombre LIKE '%' + @Nombre + '%' OR Apodo LIKE '%' + @Apodo + '%';
end;
GO
/****** Object:  StoredProcedure [dbo].[BuscarRaza]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[BuscarRaza]
	@Nombre varchar

as
begin

	select * from VistaRazas
	where Nombre LIKE '%' + @Nombre + '%'
end;
GO
/****** Object:  StoredProcedure [dbo].[InsertarNuevaDueño]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarNuevaDueño]
    @Nombre VARCHAR(50)
AS
BEGIN
    
    INSERT INTO Dueños(Nombre, Fecha_Alta)
    VALUES (@Nombre, GETDATE());
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarNuevaMascota]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarNuevaMascota]
    @Nombre VARCHAR(50),
    @Apodo VARCHAR(50),
    @ID_Raza INT,
    @ID_Dueño INT
AS
BEGIN
    INSERT INTO Mascotas(Nombre, Apodo, ID_Raza, ID_Dueño, Fecha_Alta)
    VALUES (@Nombre, @Apodo, @ID_Raza, @ID_Dueño, GETDATE());
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarNuevaRaza]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarNuevaRaza]
    @Nombre VARCHAR(50),
	@ID_Animal int
AS
BEGIN
    
    INSERT INTO Razas(Nombre, ID_Animal, Fecha_Alta)
    VALUES (@Nombre, @ID_Animal, GETDATE());
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarNuevoAnimal]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarNuevoAnimal]
    @Nombre varchar(50)
AS
BEGIN
    
    INSERT INTO Animales (Nombre, Fecha_Alta)
    VALUES (@Nombre, GETDATE());
END;
GO
/****** Object:  StoredProcedure [dbo].[RecuperarAnimal]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecuperarAnimal]
    @ID INT  
AS
BEGIN
    
    UPDATE Animales
    SET Fecha_Baja = null
    WHERE ID = @ID;
END;
---------------------
GO
/****** Object:  StoredProcedure [dbo].[RecuperarDueño]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecuperarDueño]
    @ID INT  
AS
BEGIN
    
    UPDATE Dueños
    SET Fecha_Baja = null
    WHERE ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[RecuperarMascota]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecuperarMascota]
    @ID INT  
AS
BEGIN
    
    UPDATE Mascotas
    SET Fecha_Baja = null
    WHERE ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[RecuperarRaza]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecuperarRaza]
    @ID INT  
AS
BEGIN
    
    UPDATE Razas
    SET Fecha_Baja = null
    WHERE ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[TraerAnimales]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TraerAnimales]

as
begin
select * from VistaAnimales
where Fecha_Baja is Null;
end
GO
/****** Object:  StoredProcedure [dbo].[TraerAnimalesBaja]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TraerAnimalesBaja]
   
AS
BEGIN

    SELECT * FROM VistaAnimales
    WHERE fecha_baja IS NOT NULL
      
END;
GO
/****** Object:  StoredProcedure [dbo].[TraerDueños]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TraerDueños]

as
begin
select * from VistaDueños
where Fecha_Baja is Null;
end
GO
/****** Object:  StoredProcedure [dbo].[TraerDueñosBaja]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TraerDueñosBaja]

AS
BEGIN

    SELECT * FROM VistaDueños
    WHERE fecha_baja IS NOT NULL
      
END;
GO
/****** Object:  StoredProcedure [dbo].[TraerMascotas]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TraerMascotas]

as
begin
select * from VistaMascotas
where Fecha_Baja is Null;
end
GO
/****** Object:  StoredProcedure [dbo].[TraerMascotasBaja]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TraerMascotasBaja]

AS
BEGIN

    SELECT * FROM VistaMascotas
    WHERE fecha_baja IS NOT NULL
      
END;
GO
/****** Object:  StoredProcedure [dbo].[TraerRazas]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TraerRazas]

as
begin
select * from VistaRazas
where Fecha_Baja is Null;
end
GO
/****** Object:  StoredProcedure [dbo].[TraerRazasBaja]    Script Date: 17/11/2023 3:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TraerRazasBaja]

AS
BEGIN

    SELECT * FROM VistaRazas
    WHERE fecha_baja IS NOT NULL
      
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Animales"
            Begin Extent = 
               Top = 80
               Left = 103
               Bottom = 210
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaAnimales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaAnimales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Dueños"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaDueños'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaDueños'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Mascotas"
            Begin Extent = 
               Top = 22
               Left = 391
               Bottom = 152
               Right = 561
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Dueños"
            Begin Extent = 
               Top = 23
               Left = 165
               Bottom = 153
               Right = 335
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Razas"
            Begin Extent = 
               Top = 13
               Left = 631
               Bottom = 143
               Right = 801
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaMascotas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaMascotas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Animales"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Razas"
            Begin Extent = 
               Top = 0
               Left = 260
               Bottom = 130
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaRazas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaRazas'
GO
