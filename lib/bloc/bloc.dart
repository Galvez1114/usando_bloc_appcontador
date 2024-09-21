import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usando_bloc_appcontador/bloc/estado.dart';
import 'package:usando_bloc_appcontador/bloc/evento.dart';
import 'package:usando_bloc_appcontador/constantes.dart';

class MiBloc extends Bloc<Evento, Estado> {
  late final SharedPreferencesAsync prefs;
  Estado actualizaEstado(n, {TipoDigito? tipoDigito}) {
    final TipoDigito tipo = tipoDigito ?? state.tipoDigito;
    if (imagenes.containsKey(n)) {
      return EstadoImagen(n, imagenes[n]!, tipo);
    }
    return EstadoTexto(n, tipo);
  }

  MiBloc() : super(EstadoTexto(0, TipoDigito.occidentales)) {
    on<Incrementar>((event, emit) {
      int n = state.numero + event.enCuanto;
      emit(actualizaEstado(n));
    });

    on<Decrementar>((event, emit) {
      int n = state.numero - event.enCuanto;
      emit(actualizaEstado(n));
    });

    on<CambioTipoDigitoA>((event, emit) {
      emit(actualizaEstado(state.numero, tipoDigito: event.tipoDigito));
    });

    on<YaInicializado>((event, emit) async {
      prefs = SharedPreferencesAsync();
      int n = await prefs.getInt(numeroInicial) ?? 0;

      //Obtener colores iniciales...
      Color saveNormalValue =
          (await prefs.getString(saveColorNormal) ?? '').toColor() ??
              Colors.blue;
      Color saveAlertaValue =
          (await prefs.getString(saveColorAlerta) ?? '').toColor() ??
              Colors.blue;

      colorNormal = saveNormalValue;
      colorAlerta = saveAlertaValue;

      emit(actualizaEstado(n));
    });
  }
}
