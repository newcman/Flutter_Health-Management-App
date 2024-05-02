/* BlockProvider，用于动态刷新列表 */
import 'package:bp_notepad/events/reminderEvent.dart';
import 'package:bp_notepad/models/alarmModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderBloc extends Bloc<ReminderEvent, List<AlarmDB>> {
  ReminderBloc(List<AlarmDB> initialState) : super(initialState) {
    on<SetAlarms>((event, emit) =>
      emit(event.alarmList)
    );
    on<AddAlarm>((event, emit) {
      List<AlarmDB> newState = List.from(state);
      newState.add(event.newAlarm);
      emit(newState);
    });

    on<DeleteAlarm>((event, emit) {
      List<AlarmDB> newState = List.from(state);
      newState.removeAt(event.alarmIndex);
      emit(newState);
    });
  }
}
