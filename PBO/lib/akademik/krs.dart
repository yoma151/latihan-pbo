import 'mahasiswa.dart';
import 'mata_kuliah.dart';

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah = [];

  KRS(this.mahasiswa);

  void tambahMataKuliah(MataKuliah mk) {
    daftarMataKuliah.add(mk);
  }

  @override
  String toString() {
    String mataKuliahList = daftarMataKuliah.map((mk) => mk.toString()).join('\n');
    return 'KRS untuk ${mahasiswa.nama} (NIM: ${mahasiswa.nim})\n$mataKuliahList';
  }
}
