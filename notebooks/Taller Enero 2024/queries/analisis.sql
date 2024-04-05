create database taller;

use taller;

select * from ventas;

select * from operador;


select
A.Factura as factura,
A.Fecha as fecha,
A.CodigoOperador as codigo_operador,
B.RazonSocialOperador as operador,
A.VentaTotal as venta_total
from 
ventas A
left join
operador B
on A.CodigoOperador = B.CodigoOperador
;

describe ventas;


