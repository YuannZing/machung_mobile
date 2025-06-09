import 'package:flutter/material.dart';
import '../models/calendar_entry.dart';
import '../widgets/month_view.dart';
import '../widgets/week_view.dart';
import '../widgets/schedule_view.dart';

enum CalendarView { month, week, threeDays, schedule }

class CalendarHomePage extends StatefulWidget {
  @override
  _CalendarHomePageState createState() => _CalendarHomePageState();
}

class _CalendarHomePageState extends State<CalendarHomePage> {
  CalendarView _currentView = CalendarView.month;
  final DateTime _focusedDate = DateTime.now();
  List<CalendarEntry> _entries = [];

  @override
  void initState() {
    super.initState();
    _entries = [
      CalendarEntry(
        id: '1',
        type: EntryType.note,
        content: 'Belajar Flutter',
        dateTime: DateTime(2025, 5, 7, 10, 0),
      ),
      CalendarEntry(
        id: '2',
        type: EntryType.event,
        content: 'Meeting Proyek',
        startDateTime: DateTime(2025, 5, 7, 14, 0),
        endDateTime: DateTime(2025, 5, 7, 15, 0),
      ),
      CalendarEntry(
        id: '3',
        type: EntryType.fullDay,
        content: 'Hari Libur',
        dateTime: DateTime(2025, 5, 8),
      ),
    ];
  }

  void _addEntry(DateTime selectedDate) async {
    final sameDayEntries =
        _entries
            .where((e) => e.dateTime != null && e.isSameDay(selectedDate))
            .toList();

    String newContent = '';
    EntryType selectedType = EntryType.note;
    TimeOfDay selectedTime = TimeOfDay.now();
    TimeOfDay? startTime;
    TimeOfDay? endTime;

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text(
                'Add New Entry for ${selectedDate.toLocal().toString().split(" ")[0]}',
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Dropdown untuk memilih jenis entri
                  DropdownButtonFormField<EntryType>(
                    value: selectedType,
                    onChanged: (EntryType? newValue) {
                      setStateDialog(() {
                        selectedType = newValue!;
                      });
                    },
                    items:
                        EntryType.values.map((EntryType type) {
                          return DropdownMenuItem<EntryType>(
                            value: type,
                            child: Text(type.toString().split('.').last),
                          );
                        }).toList(),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter content...'),
                    onChanged: (val) => newContent = val,
                  ),
                  if (selectedType == EntryType.note) ...[
                    // Input waktu untuk entri jenis "note"
                    Row(
                      children: [
                        Text('Time: ${selectedTime.format(context)}'),
                        Spacer(),
                        TextButton(
                          onPressed: () async {
                            final picked = await showTimePicker(
                              context: context,
                              initialTime: selectedTime,
                            );
                            if (picked != null) {
                              setStateDialog(() {
                                selectedTime = picked;
                              });
                            }
                          },
                          child: Text('Pick Time'),
                        ),
                      ],
                    ),
                  ] else if (selectedType == EntryType.event) ...[
                    // Input waktu mulai dan selesai untuk entri jenis "event"
                    Row(
                      children: [
                        Text(
                          'Start: ${startTime?.format(context) ?? "Select Start"}',
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () async {
                            final pickedStart = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedStart != null) {
                              setStateDialog(() {
                                startTime = pickedStart;
                              });
                            }
                          },
                          child: Text('Pick Start Time'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'End: ${endTime?.format(context) ?? "Select End"}',
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () async {
                            final pickedEnd = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedEnd != null) {
                              setStateDialog(() {
                                endTime = pickedEnd;
                              });
                            }
                          },
                          child: Text('Pick End Time'),
                        ),
                      ],
                    ),
                  ] else if (selectedType == EntryType.fullDay) ...[
                    // Input untuk entri jenis "fullDay" (hanya tanggal)
                    Text('Full Day Event'),
                  ],
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (newContent.trim().isNotEmpty) {
                      if (selectedType == EntryType.note) {
                        final fullDateTime = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                        setState(() {
                          _entries.add(
                            CalendarEntry(
                              id: DateTime.now().toIso8601String(),
                              type: EntryType.note,
                              content: newContent.trim(),
                              dateTime: fullDateTime,
                            ),
                          );
                        });
                      } else if (selectedType == EntryType.event) {
                        setState(() {
                          _entries.add(
                            CalendarEntry(
                              id: DateTime.now().toIso8601String(),
                              type: EntryType.event,
                              content: newContent.trim(),
                              startDateTime:
                                  startTime != null
                                      ? DateTime(
                                        selectedDate.year,
                                        selectedDate.month,
                                        selectedDate.day,
                                        startTime!.hour,
                                        startTime!.minute,
                                      )
                                      : null,
                              endDateTime:
                                  endTime != null
                                      ? DateTime(
                                        selectedDate.year,
                                        selectedDate.month,
                                        selectedDate.day,
                                        endTime!.hour,
                                        endTime!.minute,
                                      )
                                      : null,
                            ),
                          );
                        });
                      } else if (selectedType == EntryType.fullDay) {
                        setState(() {
                          _entries.add(
                            CalendarEntry(
                              id: DateTime.now().toIso8601String(),
                              type: EntryType.fullDay,
                              content: newContent.trim(),
                              dateTime: selectedDate, // Only the date, no time
                            ),
                          );
                        });
                      }
                    }
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildCalendarView() {
    switch (_currentView) {
      case CalendarView.month:
        return MonthView(
          focusedDate: _focusedDate,
          entries: _entries,
          onAddEntry: _addEntry,
        );
      case CalendarView.week:
        return WeekView(
          focusedDate: _focusedDate,
          entries: _entries,
          daysToShow: 7,
          onAddEntry: _addEntry,
        );
      case CalendarView.threeDays:
        return WeekView(
          focusedDate: _focusedDate,
          entries: _entries,
          daysToShow: 3,
          onAddEntry: _addEntry,
        );
      case CalendarView.schedule:
        return ScheduleView(entries: _entries);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calendar'),
        actions: [
          PopupMenuButton<CalendarView>(
            onSelected: (v) => setState(() => _currentView = v),
            itemBuilder:
                (context) => [
                  PopupMenuItem(
                    value: CalendarView.month,
                    child: Text('Month'),
                  ),
                  PopupMenuItem(value: CalendarView.week, child: Text('Week')),
                  PopupMenuItem(
                    value: CalendarView.threeDays,
                    child: Text('3 Days'),
                  ),
                  PopupMenuItem(
                    value: CalendarView.schedule,
                    child: Text('Schedule'),
                  ),
                ],
          ),
        ],
      ),
      body: _buildCalendarView(),
    );
  }
}
