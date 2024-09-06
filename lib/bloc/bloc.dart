import 'package:bloc/bloc.dart';
import 'package:usando_bloc_appcontador/bloc/estado.dart';
import 'package:usando_bloc_appcontador/bloc/evento.dart';
import 'package:usando_bloc_appcontador/constantes.dart';

class MiBloc extends Bloc<Evento, Estado> {
  MiBloc() : super(EstadoTexto(0)) {
    Estado actualizaEstado(n) {
      if (imagenes.containsKey(n)) {
        return EstadoImagen(n, imagenes[n]!);
      }
      return EstadoTexto(n);
    }

    on<Incrementar>((event, emit) {
      int n = state.numero;
      n = n + event.enCuanto;
      emit(actualizaEstado(n));
    });

    on<Decrementar>((event, emit) {
      int n = state.numero;
      n = n - event.enCuanto;
      emit(actualizaEstado(n));
    });
  }
}
