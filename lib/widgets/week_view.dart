import 'package:flutter/material.dart';
import '../models/calendar_entry.dart';

class WeekView extends StatelessWidget {
  final DateTime focusedDate;
  final List<CalendarEntry> entries;
  final int daysToShow;
  final Function(DateTime) onAddEntry;

  const WeekView({
    super.key,
    required this.focusedDate,
    required this.entries,
    required this.daysToShow,
    required this.onAddEntry,
  });

  @override
  Widget build(BuildContext context) {
    final startOfWeek = focusedDate.subtract(
      Duration(days: focusedDate.weekday - 1),
    );

    final dates = List.generate(
      daysToShow,
      (i) => startOfWeek.add(Duration(days: i)),
    );

    return Row(
      children: dates.map((date) {
        final dayEntries = entries
            .where((entry) => entry.isSameDay(date))
            .toList();

        return Expanded(
          child: GestureDetector(
            onTap: () => onAddEntry(date),
            child: Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: dayEntries.isNotEmpty ? Colors.green[50] : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    '${date.day}/${date.month}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  ...dayEntries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        _entryDisplay(entry),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  String _entryDisplay(CalendarEntry entry) {
    switch (entry.type) {
      case EntryType.note:
        return '📝 ${entry.content}';
      case EntryType.event:
        final start = entry.startDateTime;
        final end = entry.endDateTime;
        final timeRange = (start != null && end != null)
            ? '${_formatTime(start)} - ${_formatTime(end)}'
            : 'Event';
        return '📅 $timeRange\n${entry.content}';
      case EntryType.fullDay:
        return '📌 ${entry.content}';
    }
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
