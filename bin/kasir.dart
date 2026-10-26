import 'dart:io';

void main() {
  // Katalog: Map kode -> record (Nama, Harga, Kategori)
  final Map<String, ({String nama, int harga, String kategori})> katalog = {
    'P01': (nama: 'Kopi Sidikalang 250g', harga: 90000, kategori: 'Minuman'),
    'P02': (nama: 'Bolu Meranti', harga: 80000, kategori: 'Makanan'),
    'P03': (nama: 'Teh Karo', harga: 25000, kategori: 'Minuman'),
    'P04': (nama: 'Keripik Sambal', harga: 35000, kategori: 'Camilan'),
    'P05': (nama: 'Kopi Mandheling 250g', harga: 95000, kategori: 'Minuman'),
  };

  print('=== KATALOG PRODUK ===');
  katalog.forEach((kode, item) {
    print(
      '$kode: ${item.nama.padRight(22)} - Rp${item.harga} (${item.kategori})',
    );
  });

  stdout.write('\nMasukkan Pesanan (Format: P01x2, P02x1, P99x3): ');
  final input = stdin.readLineSync() ?? '';

  final items = input
      .split(',')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty);

  List<({String nama, int qty, int subtotal, String kategori})> pesanan = [];
  List<String> diabaikan = [];

  for (var item in items) {
    final parts = item.split('x');
    if (parts.length != 2) {
      diabaikan.add(item);
      continue;
    }

    final kode = parts[0].trim().toUpperCase();
    final qty = int.tryParse(parts[1].trim());

    // Checking null safety & keberadaan kode
    final produk = katalog[kode];
    if (produk != null && qty != null && qty > 0) {
      pesanan.add((
        nama: produk.nama,
        qty: qty,
        subtotal: produk.harga * qty,
        kategori: produk.kategori,
      ));
    } else {
      diabaikan.add(item);
    }
  }

  if (pesanan.isEmpty) {
    print('\nTidak ada pesanan valid yang diproses.');
    if (diabaikan.isNotEmpty) print('Diabaikan: ${diabaikan.join(", ")}');
    return;
  }

  // Hitung total dengan fold
  final totalAwal = pesanan.fold<int>(0, (sum, p) => sum + p.subtotal);

  // Diskon 10% jika total >= 100.000
  final diskon = totalAwal >= 100000 ? (totalAwal * 0.1).round() : 0;
  final totalAkhir = totalAwal - diskon;

  // Set kategori unik
  final kategoriTerbeli = pesanan.map((p) => p.kategori).toSet();

  print('\n=== STRUK PEMBAYARAN ===');
  for (var p in pesanan) {
    print(
      '${p.nama.padRight(22)} ${p.qty} x ${p.subtotal ~/ p.qty} = Rp${p.subtotal}',
    );
  }
  print('-' * 40);
  print('Total       : Rp$totalAwal');
  if (diskon > 0) {
    print('Diskon 10%  : Rp$diskon');
  }
  print('Bayar       : Rp$totalAkhir');
  print('Kategori    : ${kategoriTerbeli.join(", ")}');

  if (diabaikan.isNotEmpty) {
    print('Diabaikan   : ${diabaikan.join(", ")}');
  }
}
