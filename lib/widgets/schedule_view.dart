import 'package:flutter/material.dart';
import '../models/calendar_entry.dart';

class ScheduleView extends StatelessWidget {
  final List<CalendarEntry> entries;

  const ScheduleView({super.key, required this.entries});

  String fixDateFormat(String date) {
    final parts = date.split('-');
    final year = parts[0];
    final month = parts[1].padLeft(2, '0');
    final day = parts[2].padLeft(2, '0');
    return '$year-$month-$day';
  }

  String getDayName(DateTime dateTime) {
    const weekdays = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu',
    ];
    return weekdays[dateTime.weekday - 1];
  }

  String getMonthYear(DateTime dateTime) {
    const months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
    ];
    return '${months[dateTime.month - 1]} ${dateTime.year}';
  }

  DateTime getEntryDate(CalendarEntry entry) {
    switch (entry.type) {
      case EntryType.note:
      case EntryType.fullDay:
        return entry.dateTime!;
      case EntryType.event:
        return entry.startDateTime!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sortedEntries = [...entries]
      ..sort((a, b) => getEntryDate(a).compareTo(getEntryDate(b)));

    final grouped = <String, Map<String, List<CalendarEntry>>>{};

    for (var entry in sortedEntries) {
      final date = getEntryDate(entry);
      final monthYearKey = getMonthYear(date);
      final dateKey = '${date.year}-${date.month}-${date.day}';

      grouped.putIfAbsent(monthYearKey, () => {});
      grouped[monthYearKey]!.putIfAbsent(dateKey, () => []);
      grouped[monthYearKey]![dateKey]!.add(entry);
    }

    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: grouped.entries.map((monthEntry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18),
              child: Text(
                monthEntry.key,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...monthEntry.value.entries.map((dayEntry) {
              final date = DateTime.parse(fixDateFormat(dayEntry.key));
              final now = DateTime.now();
              final isToday = now.year == date.year && now.month == date.month && now.day == date.day;

              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Text(
                              getDayName(date),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: isToday ? Colors.blue : Colors.grey[300],
                              child: Text('${date.day}'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: dayEntry.value.map((entry) {
                            String? timeText;
                            if (entry.type == EntryType.note && entry.dateTime != null) {
                              timeText = '${entry.dateTime!.hour.toString().padLeft(2, '0')}:${entry.dateTime!.minute.toString().padLeft(2, '0')}';
                            } else if (entry.type == EntryType.event && entry.startDateTime != null && entry.endDateTime != null) {
                              timeText =
                                  '${entry.startDateTime!.hour.toString().padLeft(2, '0')}:${entry.startDateTime!.minute.toString().padLeft(2, '0')} - '
                                  '${entry.endDateTime!.hour.toString().padLeft(2, '0')}:${entry.endDateTime!.minute.toString().padLeft(2, '0')}';
                            }

                            return Card(
                              color: const Color.fromRGBO(1, 126, 216, 0.8),
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  debugPrint('Card tapped.');
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        entry.content,
                                        style: const TextStyle(
                                          color: Color.fromRGBO(246, 246, 246, 1.0),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      if (timeText != null)
                                        Text(
                                          timeText,
                                          style: const TextStyle(
                                            color: Color.fromRGBO(246, 246, 246, 1.0),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  if (isToday) ...[
                    const SizedBox(height: 16),
                    const Divider(height: 1, color: Colors.black),
                  ],
                  const SizedBox(height: 16),
                ],
              );
            }),
          ],
        );
      }).toList(),
    );
  }
}
