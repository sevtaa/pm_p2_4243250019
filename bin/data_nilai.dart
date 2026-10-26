void main() {
  print('=== APLIKASI DATA NILAI ===');

  // List of Record (Nama, Nilai)
  final List<({String nama, double nilai})> mahasiswa = [
    (nama: 'Andi', nilai: 85.0),
    (nama: 'Budi', nilai: 55.0),
    (nama: 'Cici', nilai: 90.0),
    (nama: 'Deni', nilai: 64.0),
    (nama: 'Eka', nilai: 45.0),
  ];

  // 1. Saring mahasiswa yang lulus (Nilai >= 60)
  final lulus = mahasiswa.where((m) => m.nilai >= 60).toList();

  // 2. Ambil nilai saja menggunakan map
  final daftarNilai = mahasiswa.map((m) => m.nilai).toList();

  // 3. Hitung total nilai dengan fold
  final total = daftarNilai.fold<double>(0, (sum, n) => sum + n);
  final rataRata = total / mahasiswa.length;

  // 4. Cari nilai tertinggi dengan reduce
  final tertinggi = daftarNilai.reduce((a, b) => a > b ? a : b);

  print('\n-----------------------------------');
  print('NAMA'.padRight(15) + '| NILAI'.padLeft(10) + '| STATUS');
  print('-----------------------------------');
  for (var m in mahasiswa) {
    final status = m.nilai >= 60 ? 'LULUS' : 'GAGAL';
    print(
      m.nama.padRight(15) +
          '| ' +
          m.nilai.toStringAsFixed(1).padLeft(8) +
          '| ' +
          status,
    );
  }
  print('-----------------------------------');
  print('Rata-rata Nilai : ${rataRata.toStringAsFixed(2)}');
  print('Nilai Tertinggi : $tertinggi');
  print('Total Lulus     : ${lulus.length} orang');
}
