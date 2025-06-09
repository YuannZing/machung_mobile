import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/calendar_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showEventModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => EventModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contoh Modal Seperti Google Calendar")),
      body: Center(
        child: ElevatedButton(
          child: Text("Tambah Event"),
          onPressed: () => _showEventModal(context),
        ),
      ),
    );
  }
}

class EventModal extends StatefulWidget {
  final Function(EventModel event)? onSave;

  EventModal({this.onSave});

  @override
  _EventModalState createState() => _EventModalState();
}

class _EventModalState extends State<EventModal> {
  Color? selectedColor;

  final List<Color> _colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.grey,
  ];
  void _showColorPickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pilih Warna'),
          content: SingleChildScrollView(
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children:
                  _colors.map((color) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = color;
                        });
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 22,
                        child:
                            selectedColor == color
                                ? const Icon(Icons.check, color: Colors.white)
                                : null,
                      ),
                    );
                  }).toList(),
            ),
          ),
        );
      },
    );
  }

  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _locationController = TextEditingController();

  final List<String> categories = ['Event', 'Task', 'Libur Nasional'];
  String selectedCategory = 'Event';

  bool Allday = false;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      // expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 80,
                          height: 5,
                          decoration: BoxDecoration(color: Colors.grey[300]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: SizedBox(width: 24, height: 24),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Add title',
                              hintStyle: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                            minLines: 1, // Mulai dari 1 baris
                            maxLines:
                                null, // Tidak dibatasi, akan terus bertambah ke bawah
                          ),
                          Wrap(
                            spacing: 8,
                            children:
                                categories.map((category) {
                                  return ChoiceChip(
                                    label: Text(category),
                                    selected: selectedCategory == category,
                                    selectedColor:
                                        Colors.blue.shade100, // opsional
                                    backgroundColor: Colors.transparent,
                                    showCheckmark:
                                        false, // INI yang penting untuk hilangkan centang
                                    onSelected: (bool selected) {
                                      setState(() {
                                        if (selectedCategory != category) {
                                          // hanya ganti kalau beda, jadi tidak bisa unselect
                                          setState(() {
                                            selectedCategory = category;
                                          });
                                        }

                                        // selectedCategory =
                                        //     selected ? category : '';
                                      });
                                    },
                                  );
                                }).toList(),
                          ),
                        ],
                      ),
                    ),
                    Divider(thickness: 1),
                    ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [SizedBox(height: 16), Icon(Icons.sort)],
                      ),
                      title: TextFormField(
                        controller: _descController,
                        decoration: InputDecoration(
                          hintText: 'Add Description',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.multiline,
                        minLines: 1, // Mulai dari 1 baris
                        maxLines:
                            null, // Tidak dibatasi, akan terus bertambah ke bawah
                      ),
                    ),

                    Divider(thickness: 1),
                    const SizedBox(height: 12),
                    SwitchListTile(
                      title: const Text('All Day'),
                      value: Allday,
                      onChanged: (bool value) {
                        setState(() {
                          Allday = value;
                        });
                      },
                      secondary: const Icon(Icons.access_time_outlined),
                    ),
                    ListTile(
                      leading: SizedBox(
                        width: 24, // lebar default ikon
                        height: 24,
                      ),
                      title: Row(
                        children: [
                          // Expanded untuk input tanggal
                          Expanded(
                            flex: 4,
                            child: TextFormField(
                              controller: _dateController,
                              decoration: const InputDecoration(
                                hintText: 'Inputkan Tanggal',
                                border: InputBorder.none,
                              ),
                              readOnly: true,
                              onTap: () async {
                                final pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(DateTime.now().year + 10),
                                );

                                if (pickedDate != null) {
                                  // Format manual tanpa intl
                                  final days = [
                                    'Senin',
                                    'Selasa',
                                    'Rabu',
                                    'Kamis',
                                    'Jumat',
                                    'Sabtu',
                                    'Minggu',
                                  ];
                                  final months = [
                                    'Januari',
                                    'Februari',
                                    'Maret',
                                    'April',
                                    'Mei',
                                    'Juni',
                                    'Juli',
                                    'Agustus',
                                    'September',
                                    'Oktober',
                                    'November',
                                    'Desember',
                                  ];

                                  final weekday = days[pickedDate.weekday - 1];
                                  final day = pickedDate.day;
                                  final month = months[pickedDate.month - 1];
                                  final year = pickedDate.year;

                                  setState(() {
                                    _dateController.text =
                                        '$weekday, $day $month $year';
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Expanded untuk input waktu jika aktif
                          if (Allday)
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: _timeController,
                                decoration: const InputDecoration(
                                  hintText: 'Jam (HH:mm)',
                                  border: InputBorder.none,
                                ),
                                readOnly: true,
                                onTap: () async {
                                  final pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  if (pickedTime != null) {
                                    setState(() {
                                      _timeController.text = pickedTime.format(
                                        context,
                                      );
                                    });
                                  }
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.refresh),
                      title: Text('Does not repeat'),
                    ),
                    Divider(thickness: 1),
                    ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: TextFormField(
                        controller: _locationController,
                        decoration: InputDecoration(
                          hintText: 'Location',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Divider(thickness: 1),
                    ListTile(
                      leading: Icon(Icons.color_lens),
                      title: const Text('Pilih Warna Event'),
                      trailing: CircleAvatar(
                        backgroundColor: selectedColor ?? null,
                        radius: 12,
                      ),
                      onTap: () => _showColorPickerDialog(context),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 8,
                top: 8,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                right: 8,
                top: 12,
                child: ElevatedButton(
                  onPressed: () {
                    final String id = UniqueKey().toString();
                    final String title = _titleController.text;
                    final String desc = _descController.text;
                    final String date = _dateController.text;
                    final String time = _timeController.text;
                    final bool isAllDay = Allday;
                    final String location = _locationController.text;

                    final event = EventModel(
                      id: id,
                      title: title,
                      description: Text(desc), // Sesuai model kamu
                      date: date,
                      time: time,
                      isAllDay: isAllDay,
                      location: location,
                      style: EventStyle(
                        color: selectedColor ?? Colors.blue,
                        textColor: Colors.white, // bisa custom juga jika perlu
                      ),
                    );

                    widget.onSave?.call(event); // kirim balik ke parent
                    Navigator.pop(context); // tutup modal
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    minimumSize: Size(40, 36),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text("Simpan"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
