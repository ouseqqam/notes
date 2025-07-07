import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import 'note_event.dart';
import 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<LoadNotes>(_onLoadNotes);
    on<AddNote>(_onAddNote);
    on<DeleteNote>(_onDeleteNote);
  }

  Future<void> _onLoadNotes(LoadNotes event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      final notes = await ApiService.fetchNotes();
      emit(NoteLoaded(notes));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  Future<void> _onAddNote(AddNote event, Emitter<NoteState> emit) async {
    if (state is NoteLoaded) {
      final currentNotes = (state as NoteLoaded).notes;
      emit(NoteLoading());
      try {
        final newNote = await ApiService.createNote(event.note);
        emit(NoteLoaded([...currentNotes, newNote]));
      } catch (e) {
        emit(NoteLoaded(currentNotes)); // Restore previous state on error
        emit(NoteError(e.toString()));
      }
    }
  }

  Future<void> _onDeleteNote(DeleteNote event, Emitter<NoteState> emit) async {
    if (state is NoteLoaded) {
      final currentNotes = (state as NoteLoaded).notes;
      emit(NoteLoading());
      try {
        await ApiService.deleteNote(event.id);
        final updatedNotes = currentNotes.where((note) => note.id != event.id).toList();
        emit(NoteLoaded(updatedNotes));
      } catch (e) {
        emit(NoteLoaded(currentNotes)); // Restore previous state on error
        emit(NoteError(e.toString()));
      }
    }
  }
}