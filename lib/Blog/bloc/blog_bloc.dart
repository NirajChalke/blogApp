import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_assig/Blog/bloc/blog_events.dart';
import 'package:subspace_assig/Blog/bloc/blog_state.dart';

class AppBlocs extends Bloc<AppEvents,AppState>{
  AppBlocs():super( AppState()){
    on<TriggerlikeEvent>(_triggerlikeEvent);
    on<TriggertextEvent>(_triggertextEvent);
  }

  void _triggerlikeEvent(TriggerlikeEvent event,Emitter<AppState> emit){
    emit(state.copyWith(isliked: event.isliked));
  }
  void _triggertextEvent(TriggertextEvent event,Emitter<AppState> emit){
    emit(state.copyWith(showMore: event.showMore));
  }
}