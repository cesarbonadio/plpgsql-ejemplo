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
  -- se pueden referir a las variables como estan en el parametro
  -- o como $n donde n es la posicion del parametro
  return $1-$2;
  end;
$respuesta$ language plpgsql;



-- transaccion basica
-- cambia la descripcion de un tipo de producto a partir del codigo y te devuelve el nombre
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



-- Esto lo hice para hacer un drop de las funciones de un conazo
-- y para ver como se hace el drop de una funcion
create or replace function drop()
  returns void as $$
  begin
  drop function sumar;
  drop function restar;
  drop function actualizar_descripcion_tipo_caramelo;
  end;
$$ language plpgsql;



--- Si se quiere llamar a una funcion, ejecutar por ejemplo
--- Select funcion(colocar parametros si lleva);
