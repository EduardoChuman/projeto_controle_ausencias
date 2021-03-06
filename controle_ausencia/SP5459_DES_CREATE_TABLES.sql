

-- CLASSE EMPREGADO CEOPC
CREATE TABLE dbo.[tbl_CEOPC_AUS_EMPREGADO]
	(
		[MATRICULA] VARCHAR(7) NOT NULL PRIMARY KEY,
		[DV] CHAR NOT NULL,
		[NOME_CELULA] VARCHAR(20) NOT NULL,
		[NIVEL_ACESSO] VARCHAR(20) NOT NULL,
		[PERIODO_AQUISITIVO_VIGENTE] DATE NOT NULL,
		[SALDO_FERIAS] INT NOT NULL,
		[AGENTE_RH] BIT NOT NULL
	)
	ON [PRIMARY];


-- Classe Ausência e Férias
CREATE TABLE dbo.[tbl_CEOPC_AUS_DEMANDAS_TIPO]
	(
		[COD_TIPO] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[NOME_TIPO] VARCHAR(20) NOT NULL
	)
	ON [PRIMARY]; 
	
-- Classe histórico
CREATE TABLE dbo.[tbl_CEOPC_AUS_HISTORICO]
	(
		[ID_HISTORICO] INT IDENTITY(1,1) NOT NULL,
		[ID_AUSENCIA] INT NOT NULL,
		[TIPO_HISTORICO] VARCHAR(50) NOT NULL,
		[MATRICULA] VARCHAR(7) NOT NULL,
		[DATA_HISTORICO] DATETIME NOT NULL,
		[OBSERVACAO] TEXT
	) 
	ON [PRIMARY];


-- Classe Ausência e Férias
CREATE TABLE dbo.[tbl_CEOPC_AUS_DEMANDAS]
	(
		[ID_AUSENCIA] INT IDENTITY(1,1) NOT NULL,
		[MATRICULA] VARCHAR(7) NOT NULL,
		[COD_AUSENCIA]INT NOT NULL FOREIGN KEY REFERENCES dbo.[tbl_CEOPC_AUS_DEMANDAS_TIPO]([COD_TIPO]),
		[STATUS] VARCHAR(20) NOT NULL,
		[DATA_INICIO] DATE NOT NULL,
		[DATA_RETORNO] DATE NOT NULL,
		[QTDE_DIAS] INT NULL,
		[ABONO_PECUNIARIO] BIT,
		[QTDE_DIAS_ABONO] INT NULL,
		[QTDE_PARCELAS] INT NULL,
		[ID_PERIODO] INT NOT NULL		
	)
	ON [PRIMARY]; 

-- Classe Periodo Aquisitivo
CREATE TABLE dbo.[tbl_CEOPC_AUS_PERIODOS_AQUISITIVOS]
	(
		[ID_PERIODO] INT IDENTITY(1,1) NOT NULL,
		[DATA_INICIO_PERIODO_AQUISITIVO] DATE NOT NULL,
		[MATRICULA] VARCHAR(7) NOT NULL,
		[SALDO_DIAS] INT NOT NULL,
		[DIAS_UTILIZADOS] INT NOT NULL,
		[DIAS_VENDIDOS] INT NOT NULL,
		[PERIODO_ZERADO] BIT
	)
	ON [PRIMARY]; 


-- Classe Grupo de Celula
CREATE TABLE dbo.[tbl_CEOPC_AUS_GRUPOS_CELULAS]
	(
		[ID_GRUPO] INT IDENTITY(1,1) NOT NULL,
		[NOME_CELULA] VARCHAR(20) NOT NULL,
		[MATRICULA_GESTOR] VARCHAR(7) NOT NULL,
		[NOME_GESTOR] VARCHAR (30) NOT NULL

	)
	ON [PRIMARY];

/*

Esta última serve para INSERT de dados já lançados no SISRH em consulta feita 29/08 as 13 horas;

*/

CREATE TABLE dbo.[tbl_CEOPC_AUS_FERIAS_MARCADAS]
	(
		[MATRICULA] VARCHAR(7) NOT NULL,
		[DATA_AQUISITIVO] DATE,
		[DATA_INICIO] DATE,
		[DIAS_UTILIZADOS] INT NOT NULL,
		[DIAS_VENDIDOS] INT NOT NULL
	)
	ON [PRIMARY]; 


