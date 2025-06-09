import 'package:flutter/material.dart';
import '../models/calendar_entry.dart';

class MonthView extends StatelessWidget {
  final DateTime focusedDate;
  final List<CalendarEntry> entries;
  final Function(DateTime) onAddEntry;

  const MonthView({
    super.key,
    required this.focusedDate,
    required this.entries,
    required this.onAddEntry,
  });

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(focusedDate.year, focusedDate.month, 1);
    final totalDays = DateUtils.getDaysInMonth(
      focusedDate.year,
      focusedDate.month,
    );
    final days = List.generate(
      totalDays,
      (i) => firstDay.add(Duration(days: i)),
    );

    return GridView.count(
      crossAxisCount: 7,
      children:
          days.map((date) {
            final dayEntries =
                entries.where((entry) => entry.isSameDay(date)).toList();

            return GestureDetector(
              onTap: () => onAddEntry(date),
              child: Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: dayEntries.isNotEmpty ? Colors.teal[50] : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${date.day}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...dayEntries.map((entry) {
                      IconData icon;
                      switch (entry.type) {
                        case EntryType.note:
                          icon = Icons.note;
                          break;
                        case EntryType.event:
                          icon = Icons.event;
                          break;
                        case EntryType.fullDay:
                          icon = Icons.calendar_today;
                          break;
                      }

                      return Row(
                        children: [
                          Icon(icon, size: 10),
                          const SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              entry.content,
                              style: const TextStyle(fontSize: 10),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            );
          }).toList(),
    );
    // return Table(
    //   border: TableBorder.all(color: Colors.grey),
    //   columnWidths: <int, TableColumnWidth>{
    //     for (int i = 0; i < 6; i++) i: FixedColumnWidth(60),
    //   },
    //   defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    //   children: <TableRow>[
    //     // Header Table
    //     TableRow(
    //       children: <Widget>[
    //         Container(
    //           alignment: Alignment.center,
    //           height: 20,
    //           decoration: BoxDecoration(
    //             border: Border(
    //               top: BorderSide(color: Colors.blue, width: 2), // hanya atas
    //             ),
    //           ),
    //           child: Text("M"),
    //         ),
    //         Container(
    //           alignment: Alignment.center,
    //           color: Colors.grey[200],
    //           height: 20,
    //           child: Text("S"),
    //         ),
    //         Container(
    //           alignment: Alignment.center,
    //           color: Colors.grey[200],
    //           height: 20,
    //           child: Text("S"),
    //         ),
    //         Container(
    //           alignment: Alignment.center,
    //           color: Colors.grey[200],
    //           height: 20,
    //           child: Text("R"),
    //         ),
    //         Container(
    //           alignment: Alignment.center,
    //           color: Colors.grey[200],
    //           height: 20,
    //           child: Text("K"),
    //         ),
    //         Container(
    //           alignment: Alignment.center,
    //           color: Colors.grey[200],
    //           height: 20,
    //           child: Text("J"),
    //         ),
    //         Container(
    //           alignment: Alignment.center,
    //           color: Colors.grey[200],
    //           height: 20,
    //           child: Text("S"),
    //         ),
    //       ],
    //     ),
    //     TableRow(
    //       children: <Widget>[
    //         Container(height: 32, color: Colors.green),
    //         TableCell(
    //           verticalAlignment: TableCellVerticalAlignment.top,
    //           child: Container(height: 32, width: 32, color: Colors.red),
    //         ),
    //         Container(height: 64, color: Colors.blue),
    //         Container(height: 64, color: Colors.blue),
    //         Container(height: 64, color: Colors.blue),
    //         Container(height: 64, color: Colors.blue),
    //         Container(height: 64, color: Colors.blue),
    //       ],
    //     ),
    //     TableRow(
    //       children: <Widget>[
    //         Container(height: 64, width: 128, color: Colors.purple),
    //         Container(height: 32, color: Colors.yellow),
    //         Container(height: 32, color: Colors.yellow),
    //         Container(height: 32, color: Colors.yellow),
    //         Container(height: 32, color: Colors.yellow),
    //         Container(height: 32, color: Colors.yellow),
    //         Center(
    //           child: Container(height: 32, width: 32, color: Colors.orange),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
