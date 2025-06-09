import 'package:flutter/material.dart';
import 'package:flutter_application_3/dragmodal.dart';
import 'package:flutter_application_3/models/calendar_model.dart';
import 'package:flutter_application_3/widgets/calendar_schedule_widget.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final GlobalKey<CalendarScheduleWidgetState> _calendarKey = GlobalKey();

  final List<HolidayModel> holidays = [
    HolidayModel(name: "Hari Buruh", date: "2025-05-01"),
    HolidayModel(name: "Hari Kebangkitan Nasional", date: "2025-05-20"),
  ];

  final List<EventModel> events = [];

  void _showEventModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true, // ubah ke true dulu untuk testing
      enableDrag: true, // ubah ke true dulu untuk testing
      backgroundColor: Colors.transparent,
      builder:
          (context) => EventModal(
            onSave: (event) {
              setState(() {
                events.add(event);
              });
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalender Jadwal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: CalendarScheduleWidget(
            key: _calendarKey,
            view: CalendarView.schedule,
            listOfHoliday: holidays,
            listOfEvent: events, // Kirim list event terbaru
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showEventModal(context),
        child: const Icon(Icons.add),
        tooltip: 'Tambah Event',
      ),
    );
  }
}
