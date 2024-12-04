
import '../lib/akademik/buku.dart';
import '../lib/akademik/perpustakaan.dart';
import '../lib/akademik/anggota.dart';

void main(){
  var perpus = Perpustakaan('perpustakaan kota');

  print('==Menambah Buku==');
  var buku1= Buku('Kisah Cinta', 'Arifkur',' ISBN-001');
  var buku2= Buku('Kisah Cinta', 'Arif',' ISBN-002');
  perpus.tambahBuku(buku1);
  perpus.tambahBuku(buku2);

   print('\n=== Mendaftarkan Anggota ===');
 var anggota1 = Anggota('Budi', 'A001');
 var anggota2 = Anggota('Ani', 'A002');
 perpus.daftarAnggotaBaru(anggota1);
 perpus.daftarAnggotaBaru(anggota2);

  print('\n=== Proses Peminjaman ===');
 anggota1.pinjamBuku(buku1);
 anggota2.pinjamBuku(buku2);
 perpus.tampilkanSemuabuku();

 print('\n=== Status Peminjaman ===');
 anggota1.tampilkanPinjam();
 anggota2.tampilkanPinjam();

 print('\n=== Proses Pengembalian ===');
 anggota1.kembalikanBuku(buku1);


 perpus.tampilkanSemuabuku();
}