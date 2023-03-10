uses
  crt;
var   nik, nama, jenis_kelompok, ulang, kondisi, haker : string;
      upah_perjam, uang_makan_perhari, upah_perminggu, uang_makan_perminggu, upah_lembur, upah_potong, total_upah_perminggu : real;
      hari_kerja, kerja_jam, jam_kerja, jam_lembur, jam_kosong, bonus_kali : integer;
begin
ulang:='y';
while ((ulang='Y') or (ulang='y')) do
begin
clrscr();
gotoxy(5,1); write('NIK                 :');
gotoxy(5,2); write('Nama Karyawan       :');
gotoxy(5,3); write('Kelompok Karyawan   :');
gotoxy(5,4); write('Upah Perjam         :');
gotoxy(5,5); write('Uang Makan/Hari     :');
gotoxy(5,6); write('Masuk Kerja/Minggu  :   hari');
gotoxy(40,6); write('Jam Kerja/Minggu   :    jam');
gotoxy(5,7); write('Lembur              :');
gotoxy(5,8); write('Total Upah Diterima :');
gotoxy(5,9); write('Upah Mingguan       :    *            = Rp.');
gotoxy(5,10); write('Uang Makan/Minggu   :    *            = Rp.');
gotoxy(5,11); write('Upah Lembur         :    *   *        = Rp.');
gotoxy(5,13); write('                                      _____________ +');
gotoxy(5,14); write('Total Upah/Minggu                     = Rp.');
gotoxy(27,1); readln(nik);
gotoxy(27,2); readln(nama);
repeat
gotoxy(27,3); readln(jenis_kelompok);
if jenis_kelompok= 'KT' then
   begin
     kondisi:='F';gotoxy(30,3); write('[ Karyawan Tetap ]');gotoxy(27,4); write('Rp. 100.000'); upah_perjam:=100000;gotoxy(27,5); write('Rp. 30.000'); uang_makan_perhari:=30000;
   end
else if jenis_kelompok= 'KK' then
   begin
     kondisi:='F';gotoxy(30,3); write('[ Karyawan Kontrak ]');gotoxy(27,4); write('Rp. 80.000'); upah_perjam:=80000;gotoxy(27,5); write('Rp. 20.000'); uang_makan_perhari:=20000;
   end
else if jenis_kelompok= 'KP' then
   begin
     kondisi:='F';gotoxy(30,3); write('[ Karyawan Paruh Waktu ]');gotoxy(27,4); write('Rp. 90.000'); upah_perjam:=90000;gotoxy(27,5); write('Rp. 20.000'); uang_makan_perhari:=20000;
   end
else
   begin
     gotoxy(10,16); write('Kode yang anda masukkan tidak ada [ENTER]');readln;
     gotoxy(10,16);write('                                          ');
     gotoxy(27,3);write('  ');
   end;
until kondisi='F';

repeat
gotoxy(27,6); readln(hari_kerja);
gotoxy(61,6); readln(jam_kerja);
if ((hari_kerja <= 7) and (jam_kerja<=168)) then
   begin
    haker:='F';
   end
else
   begin
   gotoxy(10,16); write('Hari/Jam yang anda masukkan tidak ada [ENTER]');readln;
     gotoxy(10,16);write('                                              ');
     gotoxy(27,6);write('  ');gotoxy(61,6);write('   ');
   end;
until haker='F';
if jam_kerja > 45 then
   begin
     jam_kosong:=0;upah_potong:=0;jam_lembur:=jam_kerja-45;upah_lembur:=jam_lembur*2*upah_perjam;kerja_jam:=45;bonus_kali:=2;
   end
else
    begin
    jam_kosong:=45-jam_kerja;upah_potong:=jam_kosong*40000;jam_lembur:=0;upah_lembur:=0;kerja_jam:=45-jam_kosong;bonus_kali:=0;
    gotoxy(5,12);write('Potongan Upah                         = Rp.');gotoxy(48,12);write(upah_potong:2:0);
    end;
upah_perminggu:=kerja_jam*upah_perjam;
uang_makan_perminggu:=hari_kerja*uang_makan_perhari;
total_upah_perminggu:=upah_perminggu+uang_makan_perminggu+upah_lembur-upah_potong;
    gotoxy(27,7); write(jam_lembur,' jam');
    gotoxy(27,9);write(kerja_jam);gotoxy(32,9); write(upah_perjam:2:0);gotoxy(48,9); write(upah_perminggu:2:0);
    gotoxy(27,10); write(hari_kerja);gotoxy(32,10); write(uang_makan_perhari:2:0);gotoxy(48,10); write(uang_makan_perminggu:2:0);
    gotoxy(27,11); write(jam_lembur);gotoxy(32,11);write(bonus_kali);gotoxy(36,11); write(upah_perjam:2:0);gotoxy(48,11); write(upah_lembur:2:0);
    gotoxy(48,14); write(total_upah_perminggu:2:0);
    gotoxy(10,20); write(' Apakah ada data lagi [Y/T] : '); readln(ulang);
end;
end.
