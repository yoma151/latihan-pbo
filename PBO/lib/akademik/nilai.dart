import 'mata_kuliah.dart';

class Nilai {
  MataKuliah mataKuliah;
  double nilai; // Asumsikan nilai tidak boleh null, harus ada validasi sebelumnya.

  Nilai(this.mataKuliah, this.nilai);

  // Getter untuk menghitung bobot nilai
  double get bobot {
    if (nilai >= 85) return 4.0;
    if (nilai >= 70) return 3.0;
    if (nilai >= 55) return 2.0;
    if (nilai >= 40) return 1.0;
    return 0.0;
  }

  // Getter untuk menghitung nilai akhir berdasarkan SKS dan bobot
  double get nilaiAkhir => bobot * mataKuliah.sks;

  @override
  String toString() {
    return '${mataKuliah.nama} (SKS: ${mataKuliah.sks}): Nilai $nilai, Bobot $bobot';
  }
}
