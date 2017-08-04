
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/04/2017 18:53:16
-- Generated from EDMX file: C:\Users\Jairo\Desktop\SF\SF\Models\Modelo.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SistemaFacturacion];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Facturaci__Id_Ar__36B12243]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Facturacion] DROP CONSTRAINT [FK__Facturaci__Id_Ar__36B12243];
GO
IF OBJECT_ID(N'[dbo].[FK__AsientosC__Id_Cl__34C8D9D1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AsientosContables] DROP CONSTRAINT [FK__AsientosC__Id_Cl__34C8D9D1];
GO
IF OBJECT_ID(N'[dbo].[FK__AsientosC__Id_Cu__276EDEB3]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AsientosContables] DROP CONSTRAINT [FK__AsientosC__Id_Cu__276EDEB3];
GO
IF OBJECT_ID(N'[dbo].[FK__Clientes__Id_Cue__2A4B4B5E]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Clientes] DROP CONSTRAINT [FK__Clientes__Id_Cue__2A4B4B5E];
GO
IF OBJECT_ID(N'[dbo].[FK__Facturaci__Id_Cl__37A5467C]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Facturacion] DROP CONSTRAINT [FK__Facturaci__Id_Cl__37A5467C];
GO
IF OBJECT_ID(N'[dbo].[FK__CuentasCo__Id_Cu__35BCFE0A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CuentasContables] DROP CONSTRAINT [FK__CuentasCo__Id_Cu__35BCFE0A];
GO
IF OBJECT_ID(N'[dbo].[FK__Facturaci__Id_Ve__38996AB5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Facturacion] DROP CONSTRAINT [FK__Facturaci__Id_Ve__38996AB5];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FormaPago]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FormaPago];
GO
IF OBJECT_ID(N'[dbo].[Monedas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Monedas];
GO
IF OBJECT_ID(N'[dbo].[TiposCuenta]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TiposCuenta];
GO
IF OBJECT_ID(N'[dbo].[Articulos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Articulos];
GO
IF OBJECT_ID(N'[dbo].[AsientosContables]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AsientosContables];
GO
IF OBJECT_ID(N'[dbo].[Clientes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clientes];
GO
IF OBJECT_ID(N'[dbo].[CuentasContables]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CuentasContables];
GO
IF OBJECT_ID(N'[dbo].[Facturacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Facturacion];
GO
IF OBJECT_ID(N'[dbo].[Vendedores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Vendedores];
GO
IF OBJECT_ID(N'[dbo].[v_AsientosContables]', 'U') IS NOT NULL
    DROP TABLE [dbo].[v_AsientosContables];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'FormaPago'
CREATE TABLE [dbo].[FormaPago] (
    [Id_FormPago] int  NOT NULL,
    [Tipo] varchar(40)  NOT NULL,
    [Detalle] varchar(50)  NOT NULL
);
GO

-- Creating table 'Monedas'
CREATE TABLE [dbo].[Monedas] (
    [Id_Moneda] int  NOT NULL,
    [Descripcion] varchar(32)  NULL,
    [TasaCambio] decimal(19,4)  NULL
);
GO

-- Creating table 'TiposCuenta'
CREATE TABLE [dbo].[TiposCuenta] (
    [Id_TipoCuenta] int  NOT NULL,
    [Descripcion] varchar(32)  NULL
);
GO

-- Creating table 'Articulos'
CREATE TABLE [dbo].[Articulos] (
    [Id_Articulo] int IDENTITY(1,1) NOT NULL,
    [Descripcion] varchar(50)  NOT NULL,
    [PrecioUnitario] decimal(19,4)  NOT NULL,
    [Estado] bit  NULL
);
GO

-- Creating table 'AsientosContables'
CREATE TABLE [dbo].[AsientosContables] (
    [Id_AsientoContable] int IDENTITY(1,1) NOT NULL,
    [Id_Cliente] int  NULL,
    [Descripcion] varchar(50)  NOT NULL,
    [Id_CuentaContable] int  NOT NULL,
    [TipoMovimiento] varchar(20)  NOT NULL,
    [FechaAsiento] datetime  NOT NULL,
    [MontoAsiento] decimal(19,4)  NOT NULL,
    [Estado] bit  NULL
);
GO

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [Id_Cliente] int IDENTITY(1,1) NOT NULL,
    [nombreComercial] varchar(50)  NULL,
    [RNC] varchar(25)  NOT NULL,
    [Id_CuentaContable] int  NOT NULL,
    [Estado] bit  NULL
);
GO

-- Creating table 'CuentasContables'
CREATE TABLE [dbo].[CuentasContables] (
    [ID_CuentaContable] int  NOT NULL,
    [Descripcion] varchar(50)  NULL,
    [PermiteMov] bit  NULL,
    [Tipo] tinyint  NULL,
    [Nivel] tinyint  NULL,
    [Balance] decimal(18,0)  NULL,
    [Id_CuentaMayor] int  NULL
);
GO

-- Creating table 'Facturacion'
CREATE TABLE [dbo].[Facturacion] (
    [Id_Factura] int IDENTITY(1,1) NOT NULL,
    [Id_Vendedor] int  NULL,
    [Id_Cliente] int  NULL,
    [Id_Articulo] int  NULL,
    [Fecha] datetime  NOT NULL,
    [Comentario] varchar(200)  NULL,
    [Cantidad] int  NOT NULL,
    [PrecioUnitario] decimal(19,4)  NOT NULL
);
GO

-- Creating table 'Vendedores'
CREATE TABLE [dbo].[Vendedores] (
    [Id_Vendedor] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(40)  NOT NULL,
    [PrecioComision] decimal(19,4)  NOT NULL,
    [Estado] bit  NULL
);
GO

-- Creating table 'v_AsientosContables'
CREATE TABLE [dbo].[v_AsientosContables] (
    [Id_Articulo] int  NULL,
    [Comentario] varchar(200)  NULL,
    [Id_Cliente] int  NOT NULL,
    [ID_CuentaContable] int  NOT NULL,
    [tipo_movimiento] varchar(2)  NOT NULL,
    [Fecha] datetime  NOT NULL,
    [PrecioUnitario] decimal(19,4)  NOT NULL,
    [Estado] varchar(6)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id_FormPago] in table 'FormaPago'
ALTER TABLE [dbo].[FormaPago]
ADD CONSTRAINT [PK_FormaPago]
    PRIMARY KEY CLUSTERED ([Id_FormPago] ASC);
GO

-- Creating primary key on [Id_Moneda] in table 'Monedas'
ALTER TABLE [dbo].[Monedas]
ADD CONSTRAINT [PK_Monedas]
    PRIMARY KEY CLUSTERED ([Id_Moneda] ASC);
GO

-- Creating primary key on [Id_TipoCuenta] in table 'TiposCuenta'
ALTER TABLE [dbo].[TiposCuenta]
ADD CONSTRAINT [PK_TiposCuenta]
    PRIMARY KEY CLUSTERED ([Id_TipoCuenta] ASC);
GO

-- Creating primary key on [Id_Articulo] in table 'Articulos'
ALTER TABLE [dbo].[Articulos]
ADD CONSTRAINT [PK_Articulos]
    PRIMARY KEY CLUSTERED ([Id_Articulo] ASC);
GO

-- Creating primary key on [Id_AsientoContable] in table 'AsientosContables'
ALTER TABLE [dbo].[AsientosContables]
ADD CONSTRAINT [PK_AsientosContables]
    PRIMARY KEY CLUSTERED ([Id_AsientoContable] ASC);
GO

-- Creating primary key on [Id_Cliente] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([Id_Cliente] ASC);
GO

-- Creating primary key on [ID_CuentaContable] in table 'CuentasContables'
ALTER TABLE [dbo].[CuentasContables]
ADD CONSTRAINT [PK_CuentasContables]
    PRIMARY KEY CLUSTERED ([ID_CuentaContable] ASC);
GO

-- Creating primary key on [Id_Factura] in table 'Facturacion'
ALTER TABLE [dbo].[Facturacion]
ADD CONSTRAINT [PK_Facturacion]
    PRIMARY KEY CLUSTERED ([Id_Factura] ASC);
GO

-- Creating primary key on [Id_Vendedor] in table 'Vendedores'
ALTER TABLE [dbo].[Vendedores]
ADD CONSTRAINT [PK_Vendedores]
    PRIMARY KEY CLUSTERED ([Id_Vendedor] ASC);
GO

-- Creating primary key on [Id_Cliente], [ID_CuentaContable], [tipo_movimiento], [Fecha], [PrecioUnitario], [Estado] in table 'v_AsientosContables'
ALTER TABLE [dbo].[v_AsientosContables]
ADD CONSTRAINT [PK_v_AsientosContables]
    PRIMARY KEY CLUSTERED ([Id_Cliente], [ID_CuentaContable], [tipo_movimiento], [Fecha], [PrecioUnitario], [Estado] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Id_Articulo] in table 'Facturacion'
ALTER TABLE [dbo].[Facturacion]
ADD CONSTRAINT [FK__Facturaci__Id_Ar__36B12243]
    FOREIGN KEY ([Id_Articulo])
    REFERENCES [dbo].[Articulos]
        ([Id_Articulo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Facturaci__Id_Ar__36B12243'
CREATE INDEX [IX_FK__Facturaci__Id_Ar__36B12243]
ON [dbo].[Facturacion]
    ([Id_Articulo]);
GO

-- Creating foreign key on [Id_Cliente] in table 'AsientosContables'
ALTER TABLE [dbo].[AsientosContables]
ADD CONSTRAINT [FK__AsientosC__Id_Cl__34C8D9D1]
    FOREIGN KEY ([Id_Cliente])
    REFERENCES [dbo].[Clientes]
        ([Id_Cliente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__AsientosC__Id_Cl__34C8D9D1'
CREATE INDEX [IX_FK__AsientosC__Id_Cl__34C8D9D1]
ON [dbo].[AsientosContables]
    ([Id_Cliente]);
GO

-- Creating foreign key on [Id_CuentaContable] in table 'AsientosContables'
ALTER TABLE [dbo].[AsientosContables]
ADD CONSTRAINT [FK__AsientosC__Id_Cu__276EDEB3]
    FOREIGN KEY ([Id_CuentaContable])
    REFERENCES [dbo].[CuentasContables]
        ([ID_CuentaContable])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__AsientosC__Id_Cu__276EDEB3'
CREATE INDEX [IX_FK__AsientosC__Id_Cu__276EDEB3]
ON [dbo].[AsientosContables]
    ([Id_CuentaContable]);
GO

-- Creating foreign key on [Id_CuentaContable] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [FK__Clientes__Id_Cue__2A4B4B5E]
    FOREIGN KEY ([Id_CuentaContable])
    REFERENCES [dbo].[CuentasContables]
        ([ID_CuentaContable])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Clientes__Id_Cue__2A4B4B5E'
CREATE INDEX [IX_FK__Clientes__Id_Cue__2A4B4B5E]
ON [dbo].[Clientes]
    ([Id_CuentaContable]);
GO

-- Creating foreign key on [Id_Cliente] in table 'Facturacion'
ALTER TABLE [dbo].[Facturacion]
ADD CONSTRAINT [FK__Facturaci__Id_Cl__37A5467C]
    FOREIGN KEY ([Id_Cliente])
    REFERENCES [dbo].[Clientes]
        ([Id_Cliente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Facturaci__Id_Cl__37A5467C'
CREATE INDEX [IX_FK__Facturaci__Id_Cl__37A5467C]
ON [dbo].[Facturacion]
    ([Id_Cliente]);
GO

-- Creating foreign key on [Id_CuentaMayor] in table 'CuentasContables'
ALTER TABLE [dbo].[CuentasContables]
ADD CONSTRAINT [FK__CuentasCo__Id_Cu__35BCFE0A]
    FOREIGN KEY ([Id_CuentaMayor])
    REFERENCES [dbo].[CuentasContables]
        ([ID_CuentaContable])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__CuentasCo__Id_Cu__35BCFE0A'
CREATE INDEX [IX_FK__CuentasCo__Id_Cu__35BCFE0A]
ON [dbo].[CuentasContables]
    ([Id_CuentaMayor]);
GO

-- Creating foreign key on [Id_Vendedor] in table 'Facturacion'
ALTER TABLE [dbo].[Facturacion]
ADD CONSTRAINT [FK__Facturaci__Id_Ve__38996AB5]
    FOREIGN KEY ([Id_Vendedor])
    REFERENCES [dbo].[Vendedores]
        ([Id_Vendedor])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Facturaci__Id_Ve__38996AB5'
CREATE INDEX [IX_FK__Facturaci__Id_Ve__38996AB5]
ON [dbo].[Facturacion]
    ([Id_Vendedor]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------