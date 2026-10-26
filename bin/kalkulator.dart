import 'dart:io';

void main() {
  print('=== APLIKASI KALKULATOR ===');
  stdout.write('Masukkan angka pertama: ');
  final num1 = double.tryParse(stdin.readLineSync() ?? '');

  stdout.write('Masukkan operator (+, -, *, /): ');
  final op = stdin.readLineSync() ?? '';

  stdout.write('Masukkan angka kedua: ');
  final num2 = double.tryParse(stdin.readLineSync() ?? '');

  if (num1 == null || num2 == null) {
    print('Error: Input harus berupa angka valid!');
    return;
  }

  final hasil = switch (op) {
    '+' => num1 + num2,
    '-' => num1 - num2,
    '*' => num1 * num2,
    '/' => num2 != 0 ? num1 / num2 : 'Error: Pembagian dengan nol!',
    _ => 'Operator tidak valid!',
  };

  print('Hasil: $hasil');
}
