import 'package:flutter/material.dart';
import 'package:machung_mobile/models/calendar_model.dart';

enum CalendarView { day, week, month, schedule }

class CalendarScheduleWidget extends StatefulWidget {
  final CalendarView view;
  final List<HolidayModel> listOfHoliday;
  final List<EventModel> listOfEvent;

  CalendarScheduleWidget({
    Key? key,
    required this.view,
    required this.listOfEvent,
    required this.listOfHoliday,
  }) : super(key: key);

  @override
  State<CalendarScheduleWidget> createState() => CalendarScheduleWidgetState();
}

class CalendarScheduleWidgetState extends State<CalendarScheduleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mei 2025',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),
        Column(
          children: [
            Text('Mei 1 - 7, 2025'),
            Text('Mei 8 - 14, 2025'),
            Text('Mei 15 -21, 2025'),
            Text('Mei 22 -28, 2025'),
          ],
        ),
        SizedBox(height: 12),
        Text("${DateTime.now().month}"),
        const SizedBox(height: 12),
        const Text('🗓️ Events', style: TextStyle(fontSize: 16)),
        if (widget.listOfEvent.isEmpty)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Belum ada event yang ditambahkan."),
          ),
        ...widget.listOfEvent.map(
          (event) => Card(
            color: event.style.color,
            child: ListTile(
              title: Text(
                event.title,
                style: TextStyle(color: event.style.textColor),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    !event.isAllDay
                        ? "Tanggal: ${event.date}"
                        : "Tanggal: ${event.date} - Jam: ${event.time}",
                    style: TextStyle(color: event.style.textColor),
                  ),
                  if (event.location.isNotEmpty)
                    Text(
                      "Lokasi: ${event.location}",
                      style: TextStyle(color: event.style.textColor),
                    ),
                  event.description,
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text('🚫 Hari Libur Nasional', style: TextStyle(fontSize: 16)),
        ...widget.listOfHoliday.map(
          (holiday) => ListTile(
            leading: const Icon(Icons.flag),
            title: Text(holiday.name),
            subtitle: Text("Tanggal: ${holiday.date}"),
          ),
        ),
      ],
    );
  }
}
