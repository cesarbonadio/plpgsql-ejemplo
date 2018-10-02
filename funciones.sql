-- funciones basicas
create or replace function sumar(x integer, y integer)
  returns integer as $respuesta$
    begin
    return x+y;
    end;
$respuesta$ language plpgsql;

create or replace function restar(x integer, y integer)
  returns integer as $respuesta$
  begin
  return $1+$2;
  end;
$respuesta$ language plpgsql;


-- transaccion basica
create or replace function actualizar_descripcion_tipo_caramelo(codigo_tipo integer, descripcion varchar)
  returns varchar as $nombre_caramelo$
  declare
  nombre varchar;
  begin
  update tipo_caramelo set c_descripcion = descripcion  where c_cod = codigo_tipo;
  select c_nombre into nombre from tipo_caramelo where c_cod = codigo_tipo;
  return nombre;
  end;
$nombre_caramelo$ language plpgsql;
