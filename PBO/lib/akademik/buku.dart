class Buku {
  late String judul;
  late String penulis;
  late String isbn;
  late bool _tersedia;

  Buku(this.judul,this.penulis,this.isbn): _tersedia = true;
  
  bool get tersedia => _tersedia;

  void pinjam(){
    if (_tersedia){
      _tersedia= false;
      print('buku $judul berhasil di pinjam');
    }else {
      print('maaf,buku $judul sedang di pinjam atau belum tersedia');
    }
  }
  void kembali(){
    if (!_tersedia){
      _tersedia = true;
      print('Buku $judul berhasil dikembalikan');
    }else {
      print('Buku $judul sudah ada di perpustakaan');
    }
  }
  void tampilkanInfo(){
    print('\nInformasi Buku:');
    print('judul:$judul');
    print('penulis:$penulis');
    print('ISBN:$isbn');
    print('Status: ${_tersedia ? "tersedia": "Dipinjam"}');
  }
}