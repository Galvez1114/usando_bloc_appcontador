import 'package:bloc/bloc.dart';
import 'package:usando_bloc_appcontador/bloc/estado.dart';
import 'package:usando_bloc_appcontador/bloc/evento.dart';
import 'package:usando_bloc_appcontador/constantes.dart';

class MiBloc extends Bloc<Evento, Estado> {
  MiBloc() : super(EstadoTexto(0, TipoDigito.occidentales)) {
    Estado actualizaEstado(n) {
      if (imagenes.containsKey(n)) {
        return EstadoImagen(n, imagenes[n]!, state.tipoDigito);
      }
      return EstadoTexto(n, state.tipoDigito);
    }

    on<Incrementar>((event, emit) {
      int n = state.numero + event.enCuanto;
      emit(actualizaEstado(n));
    });

    on<Decrementar>((event, emit) {
      int n = state.numero - event.enCuanto;
      emit(actualizaEstado(n));
    });
  }
}
