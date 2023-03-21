uses wincrt;

var
   no_debitur, tanggal, nama_debitur, kode_jenis_pinjaman, kondisi, anu, sikon : string;
   jumlah_pinjaman, jangka_waktu, bunga_sebulan, hasil_bunga, jump : real;
   debitur_ke : integer ;
begin
{------Blok Tampilan------}
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

{------Blok Input------}

gotoxy(34,9);readln(no_debitur);
gotoxy(65,9);readln(tanggal);
gotoxy(34,10);readln(nama_debitur);
inc(debitur_ke);gotoxy(65, 10); write(debitur_ke);

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
repeat
gotoxy(34,14);readln(jumlah_pinjaman);
if jumlah_pinjaman<=30000000 then
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
until sikon='F';

{------ LOPPING -------}

repeat
gotoxy(67,14);readln(jangka_waktu);
if jangka_waktu<=48 then
   begin
     anu:='F';
     hasil_bunga:=jumlah_pinjaman*bunga_sebulan;
     gotoxy(70,15);write(hasil_bunga:3:0);
   end
else 
   begin
     gotoxy(20,18);write('Jangka Waktu Tidak Boleh Melebihi 48 Bulan [ENTER]');readln;
     gotoxy(20,18);write('                                                   ');
     gotoxy(67,14);write('    '); 
   end;
until anu='F';
{gotoxy(34,9);readln(no_debitur);
gotoxy(34,9);readln(no_debitur);}

readln;
end.
