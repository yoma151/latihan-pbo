import 'dart:io';
import '../lib/Toko/keranjang.dart';
import '../lib/Toko/produk.dart';
import '../lib/Toko/transaksi.dart';
import '../lib/Toko/kasir.dart';

void main() {
  // Membuat produk
  var produk1 = Produk('Sepatu', 500000, 10);
  var produk2 = Produk('Kaos', 150000, 5);
  var produk3 = Produk('Tas', 250000, 7);

  // Menyimpan produk dalam list untuk mempermudah pemilihan produk
  List<Produk> daftarProduk = [produk1, produk2, produk3];

  // Membuat keranjang
  var keranjang = Keranjang();

  // Membuat kasir
  var kasir = Kasir('Budi');

  while (true) {
    print('\n--- Menu ---');
    print('1. Tambah Produk ke Keranjang');
    print('2. Hapus Produk dari Keranjang');
    print('3. Lihat Keranjang');
    print('4. Proses Transaksi');
    print('5. Keluar');
    stdout.write('Pilih opsi: ');

    String? pilihan = stdin.readLineSync();

    if (pilihan == '1') {
      // Menambah produk ke keranjang
      print('\nPilih produk yang ingin ditambahkan ke keranjang:');
      for (int i = 0; i < daftarProduk.length; i++) {
        print('${i + 1}. ${daftarProduk[i].nama} - Rp.${daftarProduk[i].harga} (Stok: ${daftarProduk[i].stok})');
      }

      stdout.write('Masukkan nomor produk: ');
      int? produkIndex = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

      if (produkIndex >= 1 && produkIndex <= daftarProduk.length) {
        stdout.write('Masukkan jumlah produk yang ingin ditambahkan: ');
        int? jumlah = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

        if (jumlah > 0) {
          keranjang.tambahProduk(daftarProduk[produkIndex - 1], jumlah);
        } else {
          print('Jumlah tidak valid.');
        }
      } else {
        print('Produk tidak ditemukan.');
      }

    } else if (pilihan == '2') {
      // Menghapus produk dari keranjang
      print('\nPilih produk yang ingin dihapus dari keranjang:');
      for (int i = 0; i < keranjang.daftarProduk.length; i++) {
        print('${i + 1}. ${keranjang.daftarProduk[i].nama} - Rp.${keranjang.daftarProduk[i].harga}');
      }

      stdout.write('Masukkan nomor produk yang ingin dihapus: ');
      int? produkIndex = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

      if (produkIndex >= 1 && produkIndex <= keranjang.daftarProduk.length) {
        keranjang.hapusProduk(keranjang.daftarProduk[produkIndex - 1]);
      } else {
        print('Produk tidak ditemukan di keranjang.');
      }

    } else if (pilihan == '3') {
      // Melihat isi keranjang
      print('\n--- Isi Keranjang ---');
      keranjang.cetakStruk();

    } else if (pilihan == '4') {
      // Proses transaksi
      keranjang.hitungTotal();
      print('Total Belanja: Rp.${keranjang.total}');
      var transaksi = Transaksi(DateTime.now(), keranjang);
      kasir.lakukanTransaksi(transaksi);
      transaksi.cetakStruk();
      kasir.laporkanPenjualan();
      break;

    } else if (pilihan == '5') {
      // Keluar
      print('Terima kasih!');
      break;
    } else {
      print('Pilihan tidak valid.');
    }
  }
}
