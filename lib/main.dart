import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fake GPS Checker',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String status = "⏳ Mengecek lokasi...";
  final Location _location = Location();
  StreamSubscription<LocationData>? _locationSubscription;
  Timer? _serviceCheckTimer;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    await _mintaIzinLokasi();

    bool izin = await Permission.location.isGranted;
    if (!izin) {
      setState(() {
        status = "❌ Izin lokasi tidak diberikan";
      });
      return;
    }

    // Pastikan layanan lokasi aktif
    // bool serviceEnabled = await _location.serviceEnabled();
    // if (!serviceEnabled) {
    //   serviceEnabled = await _location.requestService();
    //   if (!serviceEnabled) {
    //     setState(() {
    //       status = "❌ Layanan lokasi tidak aktif";
    //     });
    //     return;
    //   }
    // }

    // Cek status layanan lokasi setiap 3 detik
    _serviceCheckTimer = Timer.periodic(const Duration(seconds: 3), (_) async {
      bool aktif = await _location.serviceEnabled();
      if (!aktif) {
        aktif = await _location.requestService();
        setState(() {
          status = "⚠️ Harap aktifkan layanan lokasi (GPS)";
        });
      }
    });

    // Mulai mendengarkan perubahan lokasi
    _locationSubscription = _location.onLocationChanged.listen((locationData) {
      final bool isMock = locationData.isMock ?? false;

      setState(() {
        status =
            isMock
                ? "🚨 Fake GPS Terdeteksi!"
                : "✅ Lokasi Asli (Bukan Fake GPS)";
      });

      print("📍 Lokasi: ${locationData.latitude}, ${locationData.longitude}");
      print("🕵️‍♂️ isMock: ${locationData.isMock}");
    });
  }

  Future<void> _mintaIzinLokasi() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    _serviceCheckTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Deteksi Fake GPS")),
      body: Center(
        child: Text(
          status,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
