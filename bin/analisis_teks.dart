import 'dart:io';

void main() {
  print('=== APLIKASI ANALISIS TEKS ===');
  stdout.write('Masukkan kalimat: ');
  final input = stdin.readLineSync() ?? '';

  if (input.trim().isEmpty) {
    print('Kalimat tidak boleh kosong.');
    return;
  }

  // 1. Cek Palindrom
  final bersihkan = input.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
  final kebalikan = bersihkan.split('').reversed.join();
  final isPalindrom = bersihkan == kebalikan && bersihkan.isNotEmpty;

  // 2. Olah Kata
  final daftarKata = input
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '')
      .split(RegExp(r'\s+'))
      .where((k) => k.isNotEmpty)
      .toList();

  final kataUnik = Set<String>.from(daftarKata);

  // 3. Hitung Frekuensi Kata
  final Map<String, int> frekuensi = {};
  for (var kata in daftarKata) {
    frekuensi[kata] = (frekuensi[kata] ?? 0) + 1;
  }

  print('\n--- Hasil Analisis ---');
  print('Is Palindrom : $isPalindrom');
  print('Jumlah Kata  : ${daftarKata.length}');
  print('Kata Unik    : $kataUnik (${kataUnik.length} unik)');
  print('Frekuensi    : $frekuensi');
}
