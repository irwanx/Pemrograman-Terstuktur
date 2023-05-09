uses wincrt;
const
   max_arr = 50;
var
   nama, nama_tari : array[1..max_arr] of string[30];
   bayar, total, potongan : array[1..max_arr] of real;
   npt, kode_tari, ulang : string;
   biaya, diskon : real;
   paket, posisi, i : integer;

begin
repeat
{ --------------------- BLOK TAMPILAN ---------------------}
clrscr;
gotoxy(1,1);write('Sanggar Tari Nusantara');
gotoxy(1,2);write('Jl. Magelang-Jogja Km. 17');
gotoxy(1,3);write('Telp. 0293-222 231, Fax. 0293-567 123');
gotoxy(1,4);write('----------------------------------------------------------------');
gotoxy(1,5);write('Npt              :               Pendaftar Ke :');
gotoxy(1,6);write('Nama Peserta     :');
gotoxy(1,7);write('Kode Tari        :');
gotoxy(1,8);write('Biaya/Datang     : Rp.');
gotoxy(1,9);write('Paket Kedatangan :    Kali');
gotoxy(1,10);write('Potongan         : Rp.');
gotoxy(1,11);write('Jumlah Bayar     : Rp.');
gotoxy(1,12);write('----------------------------------------------------------------');
{ ------------ BLOK INPUT, PROSES, DAN OUTPUT ------------ }
inc(i);
gotoxy(49,5);write(i);
if i <= 5 then diskon:=0.1
else if i <= 15 then diskon:=0.05
else diskon:=0;

gotoxy(20,5);readln(npt);
gotoxy(20,6);readln(nama[i]);
gotoxy(20,7);readln(kode_tari);
if kode_tari<>'T1' then
   begin
        nama_tari[i]:='Tari Gambyong';
        biaya:=50000;
        paket:=10;
   end
else if kode_tari<>'T2' then
   begin
        nama_tari[i]:='Tari Saman';
        biaya:=100000;
        paket:=12;
   end  
else if kode_tari<>'T3' then
   begin
        nama_tari[i]:='Tari Kecak';
        biaya:=150000;
        paket:=12;
   end
else if kode_tari<>'M1' then
   begin
        nama_tari[i]:='Salsa';
        biaya:=75000;
        paket:=8;
   end
else
   begin
        nama_tari[i]:='Belly Dance';
        biaya:=65000;
        paket:=10;
   end;
gotoxy(25,7);write('[ ', nama_tari[i], ' ]');
gotoxy(24,8);write(biaya:2:0);
gotoxy(20,9);write(paket);

potongan[i]:=biaya*paket*diskon;
bayar[i]:=(biaya*paket)-potongan[i];
gotoxy(24,10);write(potongan[i]:2:0);
gotoxy(24,11);write(bayar[i]:2:0);
gotoxy(10,13);write('Apakah Ada Data Lagi [Y/T] : ');Readln(ulang);
until ulang='T';

clrscr;
gotoxy(1,1);write('Sanggar Tari Nusantara');
gotoxy(1,2);write('Jl. Magelang-Jogja Km. 17');
gotoxy(1,3);write('Telp. 0293-222 231, Fax. 0293-567 123');
gotoxy(1,4);write('------------------------------------------------------------------------------------------------------------');
gotoxy(1,5);write('No   | Nama Peserta Tari       | Nama Ketrampilan       | Biaya              | Potongan         | Bayar');
gotoxy(1,6);writeln('-----------------------------------------------------------------------------------------------------------');

for posisi:=1 to i do
    begin
         writeln(posisi, nama[posisi], nama_tari[posisi], potongan[posisi]:2:0, bayar[i]:2:0);
    end;

end.
