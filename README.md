# 3D Tiles Alpha Mode

## Introduction

Samples of 3D Tiles and alpha modes (OPAQUE/BLEND/MASK with alpha_cutoff)

## Database

See [create_cubes.sql](create_cubes.sql) for database script to create 6 cubes in Utrecht, with shader column.

## Results

1] OPAQUE

```
pg2b3dm -c geom -t public.cubes --shaderscolumn shader --add_outlines true --default_alpha_mode OPAQUE
```

<img width="1053" height="760" alt="image" src="https://github.com/user-attachments/assets/da8f26fe-eeac-480f-b12f-00504dc9cecf" />

Demo: https://bertt.github.io/3dtiles_alphamode/opaque

2] BLEND

```
pg2b3dm -c geom -t public.cubes --shaderscolumn shader --add_outlines true --default_alpha_mode BLEND
```

<img width="1109" height="785" alt="image" src="https://github.com/user-attachments/assets/dc70d9d5-688c-4bd3-8064-8dc749a7d4db" />

Demo: https://bertt.github.io/3dtiles_alphamode/blend

3] MASK

- Mask 0.25

```
pg2b3dm -c geom -t public.cubes --shaderscolumn shader --add_outlines true --default_alpha_mode MASK --alpha_cutoff 0.25
```

<img width="1069" height="731" alt="image" src="https://github.com/user-attachments/assets/dbcbe9f3-bcb4-4797-b111-93dd068750b5" />

Demo: https://bertt.github.io/3dtiles_alphamode/mask25

- Mask 0.50

```
pg2b3dm -c geom -t public.cubes --shaderscolumn shader --add_outlines true --default_alpha_mode MASK --alpha_cutoff 0.50
```

<img width="1168" height="713" alt="image" src="https://github.com/user-attachments/assets/94f94bec-46e0-4a30-974f-48ab05b95c72" />

Demo: https://bertt.github.io/3dtiles_alphamode/mask50

- Mask 0.75

```
pg2b3dm -c geom -t public.cubes --shaderscolumn shader --add_outlines true --default_alpha_mode MASK --alpha_cutoff 0.75
```

<img width="1167" height="741" alt="image" src="https://github.com/user-attachments/assets/f14dd94d-f9c4-4638-bc42-d463b063a65a" />

Demo: https://bertt.github.io/3dtiles_alphamode/mask75
