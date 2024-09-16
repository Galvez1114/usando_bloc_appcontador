import 'package:flutter/material.dart';

enum Tipo { esTexto, esImagen }

Map<int, String> imagenes = {
  7: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb-NGEQDekk2BwsllLjk4tcIM_BPIzXECdsg&s",
  10: "https://cdn.conmebol.com/wp-content/uploads/2023/06/000_334P84K-scaled.jpg"
};

Map<int, String> numerosPeligrosos = {
  8: "Este numero es peligroso, uuuy meyo",
};

int medidaMinimaTexto = 10;
int medidaMaximaTexto = 50;

Color colorAlerta = Colors.red;
Color colorNormal = Colors.black;

enum TipoDigito { occidentales, romanos }

int intervaloAlerta = -5;
