import 'package:bloc/bloc.dart';
import 'package:usando_bloc_appcontador/bloc/estado.dart';
import 'package:usando_bloc_appcontador/bloc/evento.dart';
import 'package:usando_bloc_appcontador/constantes.dart';

class MiBloc extends Bloc<Evento, Estado> {
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
  }
}
