import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/note.dart';

class ApiService {
  static const String baseUrl = 'http://10.10.20.32:3000';

  static Future<List<Note>> fetchNotes() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/notes'));
      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.body);
        return jsonData.map((e) => Note.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load notes');
      }
    } catch (e) {
      throw Exception('Error fetching notes: $e');
    }
  }

  static Future<Note> createNote(Note note) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/notes'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(note.toJson()),
      );
      if (response.statusCode == 201) {
        return Note.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create note');
      }
    } catch (e) {
      throw Exception('Error creating note: $e');
    }
  }

  static Future<void> deleteNote(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/notes/$id'));
      if (response.statusCode != 200) {
        throw Exception('Failed to delete note');
      }
    } catch (e) {
      throw Exception('Error deleting note: $e');
    }
  }
}