# Tugas Rutin 2: Kasir Console Dart

## Penjelasan Variabel
* **var**: Digunakan untuk variabel yang nilainya dapat berubah selama iterasi (contoh: iterasi perulangan).
* **final**: Digunakan untuk nilai yang diinisialisasi sekali saat *runtime* dan tidak berubah lagi (contoh: hasil `readLineSync()`, daftar `pesanan`, `totalAwal`).
* **const**: Digunakan untuk nilai konstan yang sudah diketahui sejak awal saat *compile-time*.

## Penanganan Null Safety
* Menggunakan `stdin.readLineSync() ?? ''` untuk menangani input null dari `stdin`.
* Menggunakan `int.tryParse()` untuk mengonversi angka secara aman tanpa menyebabkan program *crash*.
* Mengakses `katalog[kode]` menggunakan null check `if (produk != null)` sebelum mengambil propertinya.

## Skenario Pengujian

### Skenario 1 (Input Valid & Diskon)
* **Input**: `P01x2, P02x1`
* **Output**:
  * Kopi Sidikalang 250g (2 x 90000 = 180000)
  * Bolu Meranti (1 x 80000 = 80000)
  * Total: Rp260000
  * Diskon 10%: Rp2600
  * Bayar: Rp234000

### Skenario 2 (Input Parsial / Kode Salah)
* **Input**: `P01x1, P99x2, abc`
* **Output**:
  * Kopi Sidikalang 250g (1 x 90000 = 90000)
  * Bayar: Rp90000
  * Diabaikan: P99x2, abc