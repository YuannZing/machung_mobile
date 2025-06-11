import 'package:flutter/material.dart';
import 'package:machung_mobile/eventstyle.dart';

class CalendarScheduleWidget extends StatelessWidget {
  final CalendarView view;
  final List<Map<String, dynamic>> listOfEvent;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<Map<String, dynamic>> listOfHoliday;

  const CalendarScheduleWidget({
    super.key,
    required this.view,
    required this.listOfEvent,
    this.startDate,
    this.endDate,
    required this.listOfHoliday,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "📅 Tampilan Kalender (${view.name})",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // Simulasi kalender (dummy view)
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey[200],
          child: Center(child: Text("Kalender tampil di sini (mockup)")),
        ),
        const SizedBox(height: 20),

        Text(
          "📌 Event yang Ditambahkan",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ...listOfEvent.map(
          (event) => Card(
            color: (event['style'] as EventStyle).color,
            child: ListTile(
              title: Text(
                event['nama_event'],
                style: TextStyle(
                  color: (event['style'] as EventStyle).textColor,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanggal: ${event['_date']} - Jam: ${event['_time']}",
                    style: TextStyle(
                      color: (event['style'] as EventStyle).textColor,
                    ),
                  ),
                  Text(
                    "Lokasi: ${event['location']}",
                    style: TextStyle(
                      color: (event['style'] as EventStyle).textColor,
                    ),
                  ),
                  event['deskripsi_event'], // Ini harus widget
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        Text(
          "🇮🇩 Hari Libur Nasional",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ...listOfHoliday.map(
          (holiday) => ListTile(
            leading: Icon(Icons.flag, color: Colors.red),
            title: Text(holiday['nama_libur']),
            subtitle: Text("Tanggal: ${holiday['tanggal']}"),
          ),
        ),
      ],
    );
  }
}
