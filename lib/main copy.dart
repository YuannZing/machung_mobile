// import 'dart:async'; // ← tambahkan ini
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'mock_location_checker.dart'; // Pastikan file ini ada

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'Fake GPS Checker', home: const HomePage());
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String status = "⏳ Mengecek lokasi...";
//   Timer? _timer; // ← simpan timer agar bisa dibatalkan di dispose()

//   @override
//   void initState() {
//     super.initState();
//     _initApp();
//   }

//   Future<void> _initApp() async {
//     await mintaIzinLokasi(); // ✅ Minta izin dulu
//     await _cekMockLocation(); // ✅ Cek awal

//     // ✅ Cek ulang tiap 5 detik
//     _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
//       _cekMockLocation();
//     });
//   }

//   Future<void> mintaIzinLokasi() async {
//     var status = await Permission.location.status;

//     if (!status.isGranted) {
//       status = await Permission.location.request();
//     }

//     if (status.isGranted) {
//       print("✅ Izin lokasi diberikan");
//     } else if (status.isDenied) {
//       print("❌ Izin lokasi ditolak");
//     } else if (status.isPermanentlyDenied) {
//       print("⚠️ Izin ditolak permanen, arahkan ke pengaturan");
//       await openAppSettings();
//     }
//   }

//   Future<void> _cekMockLocation() async {
//     bool isFake = await MockLocationChecker.isMockLocation();
//     setState(() {
//       status = isFake ? "❌ Fake GPS terdeteksi!" : "✅ Lokasi asli";
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel(); // ← hentikan timer saat widget dibuang
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Deteksi Fake GPS')),
//       body: Center(
//         child: Text(
//           status,
//           style: const TextStyle(fontSize: 24),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
