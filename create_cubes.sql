CREATE TABLE public.cubes (name text, geom geometry(PolyhedralSurfaceZ,28992), shader json);

CREATE OR REPLACE FUNCTION make_cube(center_x double precision, center_y double precision)
RETURNS geometry AS $$
DECLARE
    x1 double precision := center_x - 50;
    x2 double precision := center_x + 50;
    y1 double precision := center_y - 50;
    y2 double precision := center_y + 50;
BEGIN
    RETURN ST_GeomFromText(format(
        'POLYHEDRALSURFACE Z (
            ((%1$s %3$s 0, %2$s %3$s 0, %2$s %4$s 0, %1$s %4$s 0, %1$s %3$s 0)),
            ((%1$s %3$s 100, %2$s %3$s 100, %2$s %4$s 100, %1$s %4$s 100, %1$s %3$s 100)),
            ((%1$s %3$s 0, %2$s %3$s 0, %2$s %3$s 100, %1$s %3$s 100, %1$s %3$s 0)),
            ((%1$s %4$s 0, %2$s %4$s 0, %2$s %4$s 100, %1$s %4$s 100, %1$s %4$s 0)),
            ((%1$s %3$s 0, %1$s %4$s 0, %1$s %4$s 100, %1$s %3$s 100, %1$s %3$s 0)),
            ((%2$s %3$s 0, %2$s %4$s 0, %2$s %4$s 100, %2$s %3$s 100, %2$s %3$s 0))
        )',
        x1, x2, y1, y2
    ), 28992);
END;
$$ LANGUAGE plpgsql IMMUTABLE;


CREATE OR REPLACE FUNCTION make_shader(color text)
RETURNS json AS $$
BEGIN
    RETURN json_build_object(
        'PbrMetallicRoughness',
        json_build_object(
            'BaseColors',
            json_build_array(color)
        )
    );
END;
$$ LANGUAGE plpgsql IMMUTABLE;


INSERT INTO cubes (name, geom, shader) VALUES
('box_0',   make_cube(136400,455400), make_shader('#00FF0000')),
('box_20',  make_cube(136400,455500), make_shader('#00FF0033')),
('box_40',  make_cube(136400,455600), make_shader('#00FF0066')),
('box_60',  make_cube(136400,455700), make_shader('#00FF0099')),
('box_80',  make_cube(136400,455800), make_shader('#00FF00CC')),
('box_100', make_cube(136400,455900), make_shader('#00FF00FF'));
