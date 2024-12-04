class MataKuliah {
  String kode;
  String nama;
  int sks;

  MataKuliah(this.kode, this.nama, this.sks);

  @override
  String toString() => 'Kode: $kode, Nama: $nama, SKS: $sks';
}
