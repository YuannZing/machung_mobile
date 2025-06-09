// class Note {
//   final DateTime dateTime;
//   String content;

//   Note({required this.dateTime, required this.content});
// }
enum EntryType {
  note, // Catatan biasa, hanya 1 tanggal+jam
  event, // Ada start & end datetime
  fullDay, // Hanya tanggal (tanpa jam)
}

class CalendarEntry {
  final String id;
  final EntryType type;
  String content;

  // Digunakan oleh type: note, fullDay
  final DateTime? dateTime;

  // Digunakan oleh type: event
  final DateTime? startDateTime;
  final DateTime? endDateTime;

  CalendarEntry({
    required this.id,
    required this.type,
    required this.content,
    this.dateTime,
    this.startDateTime,
    this.endDateTime,
  });

  bool isSameDay(DateTime date) {
    final target = type == EntryType.event ? startDateTime : dateTime;
    return target?.year == date.year &&
        target?.month == date.month &&
        target?.day == date.day;
  }
}
