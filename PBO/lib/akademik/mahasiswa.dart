class Mahasiswa {
  String nim;
  String nama;
  int semester;

  Mahasiswa(this.nim, this.nama, this.semester);

  @override
  String toString() => 'NIM: $nim, Nama: $nama, Semester: $semester';
}
