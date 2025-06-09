// lib/colors.dart

import 'dart:ui';

import 'package:flutter/material.dart';

// Definisikan warna-warna sesuai kebutuhan Anda
const Color umcColorprimary = Color.fromRGBO(
  1,
  126,
  216,
  1,
); // Warna biru (Primary)
const Color umcColorsecondary = Color.fromRGBO(
  129,
  193,
  71,
  1,
); // Warna hijau (Success)
const Color umcColordanger = Color.fromRGBO(
  249,
  88,
  140,
  1,
); // Warna merah (Danger)
const Color umcColorwarning = Color.fromRGBO(
  254,
  184,
  62,
  1,
); // Warna kuning (Warning)
const Color umcColordisable = Color.fromRGBO(
  193,
  211,
  219,
  1,
); // Warna kuning (Disable)
const Color umcColorinfo = Color(0xFF17A2B8); // Warna biru muda (Info)
const Color umcColorlight = Color(0xFFF8F9FA); // Warna abu-abu muda (Light)
const Color umcColordark = Color(0xFF343A40); // Warna abu-abu tua (Dark)

abstract class umcColors {
  static final primary = _PrimaryColors();
  static final secondary = _SecondaryColors();
  static final danger = _DangerColors();
  static final warning = _WarningColors();
  static final disable = _DisabledColors();
}

class _PrimaryColors {
  // Definisi warna utama (tanpa [])
  final _ColorShades toryBlue = _ColorShades(
    base: const Color.fromRGBO(13, 97, 156, 1),
    shades: {
      50: const Color.fromRGBO(222, 240, 252, 1),
      100: const Color.fromRGBO(194, 227, 250, 1),
      200: const Color.fromRGBO(128, 196, 244, 1),
      300: const Color.fromRGBO(67, 167, 239, 1),
      400: const Color.fromRGBO(18, 134, 217, 1),
      500: const Color.fromRGBO(13, 97, 156, 1),
      600: const Color.fromRGBO(10, 76, 122, 1),
      700: const Color.fromRGBO(8, 58, 94, 1),
      800: const Color.fromRGBO(5, 38, 61, 1),
      900: const Color.fromRGBO(3, 20, 33, 1),
    },
  );

  final _ColorShades endeavour = _ColorShades(
    base: const Color(0xFF1E428A),
    shades: {
      50: const Color.fromRGBO(30, 66, 138, 0.1),
      100: const Color.fromRGBO(30, 66, 138, 0.2),
      200: const Color.fromRGBO(30, 66, 138, 0.3),
      300: const Color.fromRGBO(30, 66, 138, 0.4),
      400: const Color.fromRGBO(30, 66, 138, 0.5),
      500: const Color.fromRGBO(30, 66, 138, 0.6),
      600: const Color.fromRGBO(30, 66, 138, 0.7),
      700: const Color.fromRGBO(30, 66, 138, 0.8),
      800: const Color.fromRGBO(30, 66, 138, 0.9),
      900: const Color.fromRGBO(30, 66, 138, 1.0),
    },
  );

  final _ColorShades lochmara = _ColorShades(
    base: const Color(0xFF007EC7),
    shades: {
      50: const Color.fromRGBO(225, 242, 255, 1),
      100: const Color.fromRGBO(199, 232, 255, 1),
      200: const Color.fromRGBO(138, 206, 254, 1),
      300: const Color.fromRGBO(82, 183, 254, 1),
      400: const Color.fromRGBO(21, 157, 254, 1),
      500: const Color.fromRGBO(1, 126, 216, 1),
      600: const Color.fromRGBO(1, 101, 173, 1),
      700: const Color.fromRGBO(1, 77, 132, 1),
      800: const Color.fromRGBO(0, 51, 86, 1),
      900: const Color.fromRGBO(0, 27, 46, 1),
    },
  );

  final _ColorShades cerulean = _ColorShades(
    base: const Color(0xFF2A52BE),
    shades: {
      50: const Color.fromRGBO(42, 82, 190, 0.1),
      100: const Color.fromRGBO(42, 82, 190, 0.2),
      200: const Color.fromRGBO(42, 82, 190, 0.3),
      300: const Color.fromRGBO(42, 82, 190, 0.4),
      400: const Color.fromRGBO(42, 82, 190, 0.5),
      500: const Color.fromRGBO(42, 82, 190, 0.6),
      600: const Color.fromRGBO(42, 82, 190, 0.7),
      700: const Color.fromRGBO(42, 82, 190, 0.8),
      800: const Color.fromRGBO(42, 82, 190, 0.9),
      900: const Color.fromRGBO(42, 82, 190, 1.0),
    },
  );
}

class _SecondaryColors {
  // Definisi warna utama (tanpa [])
  final _ColorShades turtleGreen = _ColorShades(
    base: const Color.fromRGBO(33, 57, 13, 1),
    shades: {
      50: const Color.fromRGBO(231, 246, 218, 1),
      100: const Color.fromRGBO(209, 239, 184, 1),
      200: const Color.fromRGBO(160, 222, 110, 1),
      300: const Color.fromRGBO(115, 199, 45, 1),
      400: const Color.fromRGBO(74, 129, 29, 1),
      500: const Color.fromRGBO(33, 57, 13, 1),
      600: const Color.fromRGBO(26, 46, 10, 1),
      700: const Color.fromRGBO(19, 33, 8, 1),
      800: const Color.fromRGBO(12, 21, 5, 1),
      900: const Color.fromRGBO(7, 12, 3, 1),
      950: const Color.fromRGBO(2, 4, 1, 1),
    },
  );
  final _ColorShades oliveDrab = _ColorShades(
    base: const Color.fromRGBO(94, 150, 44, 1),
    shades: {
      50: const Color.fromRGBO(239, 248, 231, 1),
      100: const Color.fromRGBO(223, 241, 208, 1),
      200: const Color.fromRGBO(189, 226, 156, 1),
      300: const Color.fromRGBO(157, 212, 109, 1),
      400: const Color.fromRGBO(125, 199, 61, 1),
      500: const Color.fromRGBO(94, 150, 44, 1),
      600: const Color.fromRGBO(76, 122, 36, 1),
      700: const Color.fromRGBO(57, 91, 26, 1),
      800: const Color.fromRGBO(37, 59, 17, 1),
      900: const Color.fromRGBO(20, 32, 9, 1),
      950: const Color.fromRGBO(10, 16, 5, 1),
    },
  );
  final _ColorShades christi = _ColorShades(
    base: const Color.fromRGBO(64, 167, 8, 1),
    shades: {
      50: const Color.fromRGBO(232, 253, 221, 1),
      100: const Color.fromRGBO(213, 252, 192, 1),
      200: const Color.fromRGBO(171, 249, 128, 1),
      300: const Color.fromRGBO(128, 246, 65, 1),
      400: const Color.fromRGBO(87, 229, 11, 1),
      500: const Color.fromRGBO(64, 167, 8, 1),
      600: const Color.fromRGBO(50, 131, 6, 1),
      700: const Color.fromRGBO(39, 102, 5, 1),
      800: const Color.fromRGBO(26, 68, 3, 1),
      900: const Color.fromRGBO(13, 34, 2, 1),
      950: const Color.fromRGBO(6, 15, 1, 1),
    },
  );
  final _ColorShades sushi = _ColorShades(
    base: const Color.fromRGBO(118, 179, 62, 1),
    shades: {
      50: const Color.fromRGBO(242, 248, 236, 1),
      100: const Color.fromRGBO(226, 241, 213, 1),
      200: const Color.fromRGBO(201, 227, 175, 1),
      300: const Color.fromRGBO(172, 213, 134, 1),
      400: const Color.fromRGBO(146, 200, 96, 1),
      500: const Color.fromRGBO(118, 179, 62, 1),
      600: const Color.fromRGBO(95, 144, 50, 1),
      700: const Color.fromRGBO(70, 106, 37, 1),
      800: const Color.fromRGBO(48, 72, 25, 1),
      900: const Color.fromRGBO(23, 34, 12, 1),
      950: const Color.fromRGBO(13, 19, 7, 1),
    },
  );
  final _ColorShades mantis = _ColorShades(
    base: const Color.fromRGBO(129, 193, 71, 1),
    shades: {
      50: const Color.fromRGBO(242, 249, 236, 1),
      100: const Color.fromRGBO(229, 242, 217, 1),
      200: const Color.fromRGBO(201, 227, 175, 1),
      300: const Color.fromRGBO(206, 231, 183, 1),
      400: const Color.fromRGBO(154, 205, 106, 1),
      500: const Color.fromRGBO(129, 193, 71, 1),
      600: const Color.fromRGBO(103, 156, 53, 1),
      700: const Color.fromRGBO(78, 118, 40, 1),
      800: const Color.fromRGBO(53, 80, 27, 1),
      900: const Color.fromRGBO(25, 38, 13, 1),
      950: const Color.fromRGBO(13, 19, 6, 1),
    },
  );
  final _ColorShades pistachio = _ColorShades(
    base: const Color.fromRGBO(149, 201, 98, 1),
    shades: {
      50: const Color.fromRGBO(245, 250, 240, 1),
      100: const Color.fromRGBO(235, 245, 225, 1),
      200: const Color.fromRGBO(212, 233, 190, 1),
      300: const Color.fromRGBO(191, 222, 160, 1),
      400: const Color.fromRGBO(171, 212, 130, 1),
      500: const Color.fromRGBO(149, 201, 98, 1),
      600: const Color.fromRGBO(120, 178, 61, 1),
      700: const Color.fromRGBO(89, 133, 46, 1),
      800: const Color.fromRGBO(59, 87, 30, 1),
      900: const Color.fromRGBO(31, 46, 16, 1),
      950: const Color.fromRGBO(15, 23, 8, 1),
    },
  );
  final _ColorShades pixieGreen = _ColorShades(
    base: const Color.fromRGBO(202, 225, 191, 1),
    shades: {
      50: const Color.fromRGBO(249, 252, 248, 1),
      100: const Color.fromRGBO(243, 248, 241, 1),
      200: const Color.fromRGBO(235, 244, 231, 1),
      300: const Color.fromRGBO(223, 237, 217, 1),
      400: const Color.fromRGBO(212, 231, 203, 1),
      500: const Color.fromRGBO(202, 225, 191, 1),
      600: const Color.fromRGBO(154, 198, 133, 1),
      700: const Color.fromRGBO(108, 170, 80, 1),
      800: const Color.fromRGBO(73, 115, 54, 1),
      900: const Color.fromRGBO(35, 56, 26, 1),
      950: const Color.fromRGBO(18, 28, 13, 1),
    },
  );
}

class _DisabledColors {
  // Definisi warna utama (tanpa [])
  final _ColorShades richBlack = _ColorShades(
    base: const Color.fromRGBO(12, 26, 39, 1),
    shades: {
      50: const Color.fromRGBO(220, 232, 244, 1),
      100: const Color.fromRGBO(185, 210, 233, 1),
      200: const Color.fromRGBO(115, 165, 212, 1),
      300: const Color.fromRGBO(55, 119, 179, 1),
      400: const Color.fromRGBO(34, 73, 109, 1),
      500: const Color.fromRGBO(12, 26, 39, 1),
      600: const Color.fromRGBO(10, 21, 31, 1),
      700: const Color.fromRGBO(7, 16, 23, 1),
      800: const Color.fromRGBO(5, 10, 16, 1),
      900: const Color.fromRGBO(2, 5, 8, 1),
      950: const Color.fromRGBO(1, 3, 4, 1),
    },
  );
  final _ColorShades Charcoal = _ColorShades(
    base: const Color.fromRGBO(38, 59, 70, 1),
    shades: {
      50: const Color.fromRGBO(229, 236, 241, 1),
      100: const Color.fromRGBO(202, 218, 226, 1),
      200: const Color.fromRGBO(149, 181, 198, 1),
      300: const Color.fromRGBO(100, 146, 171, 1),
      400: const Color.fromRGBO(64, 101, 119, 1),
      500: const Color.fromRGBO(38, 59, 70, 1),
      600: const Color.fromRGBO(31, 47, 56, 1),
      700: const Color.fromRGBO(23, 36, 43, 1),
      800: const Color.fromRGBO(14, 22, 26, 1),
      900: const Color.fromRGBO(7, 11, 13, 1),
    },
  );
  final _ColorShades prussianBlue = _ColorShades(
    base: const Color.fromRGBO(13, 42, 64, 1),
    shades: {
      50: const Color.fromRGBO(221, 236, 248, 1),
      100: const Color.fromRGBO(183, 215, 240, 1),
      200: const Color.fromRGBO(111, 176, 226, 1),
      300: const Color.fromRGBO(42, 136, 208, 1),
      400: const Color.fromRGBO(28, 89, 136, 1),
      500: const Color.fromRGBO(13, 42, 64, 1),
      600: const Color.fromRGBO(10, 33, 51, 1),
      700: const Color.fromRGBO(8, 25, 38, 1),
      800: const Color.fromRGBO(5, 17, 25, 1),
      900: const Color.fromRGBO(2, 6, 8, 1),
      950: const Color.fromRGBO(1, 3, 4, 1),
    },
  );
  final _ColorShades jungleMist = _ColorShades(
    base: const Color.fromRGBO(193, 211, 219, 1),
    shades: {
      50: const Color.fromRGBO(249, 250, 251, 1),
      100: const Color.fromRGBO(242, 246, 248, 1),
      200: const Color.fromRGBO(229, 237, 240, 1),
      300: const Color.fromRGBO(216, 228, 233, 1),
      400: const Color.fromRGBO(207, 221, 227, 1),
      500: const Color.fromRGBO(193, 211, 219, 1),
      600: const Color.fromRGBO(142, 175, 189, 1),
      700: const Color.fromRGBO(90, 135, 155, 1),
      800: const Color.fromRGBO(60, 90, 103, 1),
      900: const Color.fromRGBO(30, 45, 52, 1),
      950: const Color.fromRGBO(15, 23, 26, 1),
    },
  );
}

class _DangerColors {
  final _ColorShades softAmber = _ColorShades(
    base: const Color.fromRGBO(206, 187, 175, 1),
    shades: {
      50: const Color.fromRGBO(249, 247, 246, 1),
      100: const Color.fromRGBO(245, 242, 239, 1),
      200: const Color.fromRGBO(236, 228, 223, 1),
      300: const Color.fromRGBO(226, 215, 208, 1),
      400: const Color.fromRGBO(216, 201, 192, 1),
      500: const Color.fromRGBO(206, 187, 175, 1),
      600: const Color.fromRGBO(177, 147, 129, 1),
      700: const Color.fromRGBO(142, 108, 87, 1),
      800: const Color.fromRGBO(95, 72, 58, 1),
      900: const Color.fromRGBO(47, 36, 29, 1),
      950: const Color.fromRGBO(22, 17, 14, 1),
    },
  );
  final _ColorShades frenchRose = _ColorShades(
    base: const Color.fromRGBO(238, 60, 118, 1),
    shades: {
      50: const Color.fromRGBO(253, 236, 242, 1),
      100: const Color.fromRGBO(252, 217, 229, 1),
      200: const Color.fromRGBO(248, 175, 200, 1),
      300: const Color.fromRGBO(245, 138, 173, 1),
      400: const Color.fromRGBO(242, 100, 147, 1),
      500: const Color.fromRGBO(238, 60, 118, 1),
      600: const Color.fromRGBO(221, 19, 86, 1),
      700: const Color.fromRGBO(164, 14, 64, 1),
      800: const Color.fromRGBO(108, 9, 42, 1),
      900: const Color.fromRGBO(56, 5, 22, 1),
      950: const Color.fromRGBO(28, 2, 11, 1),
    },
  );
  final _ColorShades brinkPink = _ColorShades(
    base: const Color.fromRGBO(249, 88, 140, 1),
    shades: {
      50: const Color.fromRGBO(254, 240, 245, 1),
      100: const Color.fromRGBO(254, 221, 231, 1),
      200: const Color.fromRGBO(253, 186, 207, 1),
      300: const Color.fromRGBO(251, 157, 187, 1),
      400: const Color.fromRGBO(250, 122, 163, 1),
      500: const Color.fromRGBO(249, 88, 140, 1),
      600: const Color.fromRGBO(247, 24, 94, 1),
      700: const Color.fromRGBO(197, 7, 67, 1),
      800: const Color.fromRGBO(128, 5, 44, 1),
      900: const Color.fromRGBO(64, 2, 22, 1),
      950: const Color.fromRGBO(108, 9, 42, 1),
    },
  );
}

class _WarningColors{
  final _ColorShades Ochre = _ColorShades(
    base: const Color.fromRGBO(209, 126, 34, 1),
    shades: {
      50: const Color.fromRGBO(251, 243, 233, 1),
      100: const Color.fromRGBO(248, 231, 211, 1),
      200: const Color.fromRGBO(240, 204, 163, 1),
      300: const Color.fromRGBO(233, 180, 119, 1),
      400: const Color.fromRGBO(225, 153, 71, 1),
      500: const Color.fromRGBO(209, 126, 34, 1),
      600: const Color.fromRGBO(167, 102, 27, 1),
      700: const Color.fromRGBO(127, 77, 21, 1),
      800: const Color.fromRGBO(83, 51, 14, 1),
      900: const Color.fromRGBO(44, 27, 7, 1),
      950: const Color.fromRGBO(22, 13, 4, 1),
    },
  );
  final _ColorShades carrotOrange = _ColorShades(
    base: const Color.fromRGBO(236, 141, 35, 1),
    shades: {
      50: const Color.fromRGBO(253, 243, 232, 1),
      100: const Color.fromRGBO(251, 233, 213, 1),
      200: const Color.fromRGBO(247, 209, 166, 1),
      300: const Color.fromRGBO(244, 188, 124, 1),
      400: const Color.fromRGBO(240, 164, 77, 1),
      500: const Color.fromRGBO(236, 141, 35, 1),
      600: const Color.fromRGBO(197, 113, 17, 1),
      700: const Color.fromRGBO(150, 86, 13, 1),
      800: const Color.fromRGBO(99, 57, 9, 1),
      900: const Color.fromRGBO(52, 30, 4, 1),
      950: const Color.fromRGBO(23, 13, 2, 1),
    },
  );
  final _ColorShades neonCarrot = _ColorShades(
    base: const Color.fromRGBO(252, 159, 56, 1),
    shades: {
      50: const Color.fromRGBO(255, 245, 235, 1),
      100: const Color.fromRGBO(254, 236, 215, 1),
      200: const Color.fromRGBO(254, 217, 175, 1),
      300: const Color.fromRGBO(253, 198, 134, 1),
      400: const Color.fromRGBO(253, 179, 94, 1),
      500: const Color.fromRGBO(252, 159, 56, 1),
      600: const Color.fromRGBO(241, 130, 4, 1),
      700: const Color.fromRGBO(181, 98, 3, 1),
      800: const Color.fromRGBO(121, 65, 2, 1),
      900: const Color.fromRGBO(60, 33, 1, 1),
      950: const Color.fromRGBO(30, 16, 0, 1),
    },
  );
  final _ColorShades yellowOrange = _ColorShades(
    base: const Color.fromRGBO(254, 184, 62, 1),
    shades: {
      50: const Color.fromRGBO(255, 247, 235, 1),
      100: const Color.fromRGBO(255, 240, 214, 1),
      200: const Color.fromRGBO(255, 227, 179, 1),
      300: const Color.fromRGBO(254, 212, 138, 1),
      400: const Color.fromRGBO(254, 199, 103, 1),
      500: const Color.fromRGBO(254, 184, 62, 1),
      600: const Color.fromRGBO(254, 161, 1, 1),
      700: const Color.fromRGBO(188, 119, 1, 1),
      800: const Color.fromRGBO(127, 81, 1, 1),
      900: const Color.fromRGBO(61, 39, 0, 1),
      950: const Color.fromRGBO(30, 19, 0, 1),
    },
  );
}

// Kelas untuk mendukung akses dengan dan tanpa []
class _ColorShades {
  final Color base;
  final Map<int, Color> shades;

  _ColorShades({required this.base, required this.shades});

  // Getter untuk akses langsung tanpa []
  Color get color => base;

  // Operator [] untuk akses dengan shades
  Color operator [](int shade) => shades[shade] ?? base;
}
