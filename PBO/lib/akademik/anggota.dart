import 'buku.dart';

class Anggota {
  late String nama;
  late String id;
  late List<Buku> bukuDipinjam;

  Anggota(this.nama,this.id){
    bukuDipinjam = [];
  }

  void pinjamBuku(Buku buku ){
    if (buku.tersedia){
      buku.pinjam();
      bukuDipinjam.add(buku);
      print('$nama meminjam buku ${buku.judul}');
    }
  }

  void kembalikanBuku(Buku buku){
    if (bukuDipinjam.contains(buku)){
      buku.kembali();
      bukuDipinjam.remove(buku);
      print('$nama mengembalikan buku ${buku.judul}');
    }else {
      print('$nama tidak meminjam buku');
    }
  }
  void tampilkanPinjam(){
    print('\nDaftar Buku yang Dipinjam $nama:');
    if (bukuDipinjam.isEmpty){
    }else {
      for (var buku in bukuDipinjam){
        print('-${buku.judul}(${buku.penulis})');
      }
    }
  }
}