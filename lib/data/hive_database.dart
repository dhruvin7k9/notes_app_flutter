import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/note.dart';

class HiveDatabase {
  // reference our hive box
  final _myBox = Hive.box("note_database");

  // load notes
  List<Note> loadNotes() {
    List<Note> savedNotesFormatted = [];

    // if there exists notes, return that otherwise return empty list
    if (_myBox.get("ALL_NOTES") != null) {
      List<dynamic> savedNotes = _myBox.get("ALL_NOTES");
      for  (int i = 0; i < savedNotes.length; i++) {
        Note individualNotes = Note(id: savedNotes[i][0], title: savedNotes[i][1], content: savedNotes[i][2], modifiedTime: savedNotes[i][3]);
        // add to formatted
        savedNotesFormatted.add(individualNotes);
      }
    }

    return savedNotesFormatted;
  }

  // save notes
  // in hive we can't store objects , so cutting it dow to string
  void saveNotes(List<Note> allNotes) {
    List<List<dynamic>> allNotesFormatted = [];

    // each has an id and content
    for (var note in allNotes) {
      dynamic id = note.id;
      String title = note.title;
      String content = note.content;
      DateTime modifiedTime = note.modifiedTime;
      allNotesFormatted.add([id, title, content, modifiedTime]);
    }

    // then store into hive
    _myBox.put("ALL_NOTES", allNotesFormatted);
  }
}