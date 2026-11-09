import 'dart:io';

void main() {
  const produk = {'P01': 'Kopi Sidikalang 250g', 'P02': 'Bolu Meranti'};

  const harga = {'P01': 90000, 'P02': 80000};

  print('=== KASIR CONSOLE DART ===');
  print('P01 - Kopi Sidikalang 250g : Rp90000');
  print('P02 - Bolu Meranti         : Rp80000');

  stdout.write('\nMasukkan pembelian (contoh P01x2, P02x1): ');
  final input = stdin.readLineSync() ?? '';

  int total = 0;
  final diabaikan = <String>[];

  final daftar = input.split(',');

  for (final item in daftar) {
    final cocok = RegExp(r'^([A-Za-z0-9]+)\s*x\s*(\d+)$')
        .firstMatch(item.trim());

    if (cocok == null) {
      diabaikan.add(item.trim());
      continue;
    }

    final kode = cocok.group(1)!.toUpperCase();
    final jumlah = int.parse(cocok.group(2)!);

    if (!produk.containsKey(kode) || jumlah <= 0) {
      diabaikan.add(item.trim());
      continue;
    }

    final subtotal = harga[kode]! * jumlah;
    total += subtotal;

    print('${produk[kode]} ($jumlah x ${harga[kode]} = $subtotal)');
  }

  final diskon = total >= 100000 ? (total * 0.10).round() : 0;
  final bayar = total - diskon;

  print('\nTotal: Rp$total');

  if (diskon > 0) {
    print('Diskon 10%: Rp$diskon');
  }

  print('Bayar: Rp$bayar');

  if (diabaikan.isNotEmpty) {
    print('Diabaikan: ${diabaikan.join(', ')}');
  }
}
