import 'dart:io';

import '../lib/akademik/mahasiswa.dart';
import '../lib/akademik/mata_kuliah.dart';
import '../lib/akademik/nilai.dart';
import '../lib/akademik/krs.dart';

void main() {
  // Contoh Data
  Mahasiswa mahasiswa = Mahasiswa('230103269', 'ryomurphys', 3);
  MataKuliah mk1 = MataKuliah('MK001', 'Pemrograman web 2', 3);
  MataKuliah mk2 = MataKuliah('MK002', 'Basis Data', 3);

  KRS krs = KRS(mahasiswa);
  krs.tambahMataKuliah(mk1);
  krs.tambahMataKuliah(mk2);

  List<Nilai> nilaiMahasiswa = [];

  print('--- CETAK KRS ---');
  print(krs);

  print('\n--- INPUT NILAI ---');
  for (var mk in krs.daftarMataKuliah) {
    stdout.write('Masukkan nilai untuk ${mk.nama}: ');
    double nilai = double.parse(stdin.readLineSync()!);
    nilaiMahasiswa.add(Nilai(mk, nilai));
  }

  print('\n--- TRANSKRIP NILAI ---');
  double totalNilai = 0;
  int totalSKS = 0;

  for (var nilai in nilaiMahasiswa) {
    print(nilai);
    totalNilai += nilai.nilaiAkhir;
    totalSKS += nilai.mataKuliah.sks;
  }

  double ipk = totalNilai / totalSKS;
  print('\nIPK: ${ipk.toStringAsFixed(2)}');
}
