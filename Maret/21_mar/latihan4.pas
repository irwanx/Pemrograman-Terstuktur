uses
   crt;
{
* DEKLARASI
}
var
   no_debitur, ulang, tanggal, nama_debitur, kode_jenis_pinjaman, kondisi, anu, sikon, yt : string;
   jumlah_pinjaman, angsuran_pokok, jml_angsuran_perbulan, jangka_waktu, bunga_sebulan, hasil_bunga, jump : real;
   debitur_ke : integer ;
begin
{
* LOOP WHILE DO ( Y/N )
}
   ulang:='y';
   while ((ulang='Y') or (ulang='y')) do
begin
clrscr();
{
* BLOK TAMPILAN
}
gotoxy(10,5);write('BPR Syariah KONARYOSIH');
gotoxy(10,6);write('Jl. Magelang-Jogja Km. 13');
gotoxy(10,7);write('Telp. 0293-234 123, Fax. 0293-890 765');;
gotoxy(10,8);write('------------------------------------------------------------------------');
gotoxy(10,9);write('No. Debitur           :');
gotoxy(50,9);write('Tanggal      :');
gotoxy(10,10);write('Nama Debitur          :');
gotoxy(50,10);write('Debitur ke   :');
gotoxy(10,11);write('Kode Jenis Pinjaman   :');
gotoxy(10,12);write('Jenis Pinjaman        :');                          
gotoxy(10,13);write('Bunga Pinjaman        :');
gotoxy(10,14);write('Jumlah Pinjaman       :'); 
gotoxy(52,14);write('Jangka Waktu :');
gotoxy(10,15);write('Angsuran Pokok        : Rp.');
gotoxy(52,15);write('Bunga/Bulan  : RP.');
gotoxy(10,16);write('Jumlah Ngsuran/Bln    : Rp.');
gotoxy(10,17);write('------------------------------------------------------------------------');

{
* BLOCK INPUT
}

gotoxy(34,9);readln(no_debitur);
gotoxy(65,9);readln(tanggal);
gotoxy(34,10);readln(nama_debitur);
{
* AUTO INCREMENT
}
inc(debitur_ke);gotoxy(65, 10); write(debitur_ke);
{ 
* START LOOP 1 REPEAT UNTIL
}
repeat
gotoxy(34,11);readln(kode_jenis_pinjaman);
if kode_jenis_pinjaman='001' then
   begin
     kondisi:='F';
     gotoxy(34,12);write('Baiti Jannati');
     gotoxy(34,13);write('0,8% per bulan');
     bunga_sebulan:=0.008;
   end
else if kode_jenis_pinjaman='002' then
   begin
     kondisi:='F';
     gotoxy(34,12);write('Murabahan');
     gotoxy(34,13);write('0,9% per bulan');
     bunga_sebulan:=0.009;
   end
else if kode_jenis_pinjaman='003' then
   begin
     kondisi:='F';
     gotoxy(34,12);write('Akhirul Kalam');
     gotoxy(34,13);write('0,5% per bulan'); 
     bunga_sebulan:=0.005;
   end
else if kode_jenis_pinjaman='004' then
   begin
     kondisi:='F';
     gotoxy(34,12);write('Pendidikan');
     gotoxy(34,13);write('0,4% per bulan'); 
     bunga_sebulan:=0.004;
   end
else
   begin
     gotoxy(20,18);write('Kode Jenis Pinjaman Tidak Ada [ENTER]');readln;
     gotoxy(20,18);write('                                      ');
     gotoxy(34,11);write('    '); 
   end;
until kondisi='F';
{ 
* END LOOP 1 REPEAT UNTIL
* STARR LOOP 2 WHILE DO
}
while sikon<>'F' do
begin
gotoxy(34,14);readln(jumlah_pinjaman);
if ((jumlah_pinjaman<=30000000) and (jumlah_pinjaman > 0)) then
   begin
     sikon:='F';
     jump:=jumlah_pinjaman;
   end
else 
   begin
     jump:=0;
     gotoxy(20,18);write('Jumlah Pinjaman Tidak Boleh Melebihi 30.000.000 [ENTER]');readln;
     gotoxy(20,18);write('                                                       ');
     gotoxy(34,14);write('          '); 
   end;
end;
{ 
* END LOOP 2 WHILE DO
* START LOOP 3 REPEAT UNTIL
}
repeat
gotoxy(67,14);readln(jangka_waktu);
if ((jangka_waktu<=48) and (jangka_waktu >0)) then
   begin
     anu:='F';
     angsuran_pokok:=jump/jangka_waktu;
     gotoxy(34,15);write(angsuran_pokok:3:0);
     hasil_bunga:=jump*bunga_sebulan;
     gotoxy(70,15);write(hasil_bunga:3:0);
     jml_angsuran_perbulan:=angsuran_pokok+hasil_bunga;
     gotoxy(34,16);write(jml_angsuran_perbulan:3:0);
   end
else 
   begin
     gotoxy(20,18);write('Jangka Waktu Tidak Boleh Melebihi 48 Bulan [ENTER]');readln;
     gotoxy(20,18);write('                                                   ');
     gotoxy(67,14);write('    '); 
   end;
until anu='F';
{
* END LOOP 3 REPEAT UNTIL
}
gotoxy(20,18); write(' Apakah ada data lagi [Y/T] : '); readln(ulang);
end;
end.
