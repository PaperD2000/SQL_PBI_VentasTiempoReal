declare @id int = 0;
declare @fecha datetime = getdate();
declare @prodcto int = 0;
declare @vendedor int = 0;
declare @tipo_orden int = 0;
declare @peso int = 0;

declare @i int = 1;

while(@i <=10)
	begin
		waitfor delay '00:00:01'
		set @id = abs(CHECKSUM(NEWID()) % 999999);
		set @fecha = GETDATE();
		set @prodcto = ABS(CHECKSUM(NEWID()) % 10) + 10;
		set @vendedor = (ABS(CHECKSUM(NEWID()) % 5) + 1) + 10;
		set @tipo_orden = ABS(CHECKSUM(NEWID()) % 3) + 1;
		set @peso = ABS(CHECKSUM(NEWID()) % 10) + 1;
		insert into dbo.Ordenes values (@id,@fecha,@prodcto,@vendedor,@tipo_orden,@peso);
		set @i = @i + 1;
	end