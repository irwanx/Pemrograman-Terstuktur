Uses WinCrt;

var id, alamat, tgl_acara, kode_paket, nama_kons, nama_paket, lagi, kondisi : String;
    biaya, dp, kurang : Real;
    no_faktur : integer;
begin

{ ---------------- BLOK TAMPILAN ---------------- }
repeat
gotoxy(1, 1); write('EO Kirana Larasati');
gotoxy(1, 2); write('Jl. Gayam Sari No. 34, Semarang');
gotoxy(1, 3); write('Telp. 024-111 579, Fax. 024-123 321');
gotoxy(1, 4); write('-------------------------------------------------------');
gotoxy(1, 5); write('No Faktur     : NF-           Id Pegawai : ');
gotoxy(1, 6); write('Nama Konsumen : ');
gotoxy(1, 7); write('Alamat        : ');
gotoxy(1, 8); write('Tanggal Acara : ');
gotoxy(1, 9); write('Kode Paket    : ');
gotoxy(1, 10); write('Biaya Paket   : Rp.');
gotoxy(1, 11); write('Jumlah DP     : Rp.');
gotoxy(1, 12); write('Kekurangan    : Rp.');
gotoxy(1, 13); write('-------------------------------------------------------');

{ ------------- BLOK INPUT, PROSES DAN OUTPUT ------------- }
inc(no_faktur);gotoxy(21, 5); write(no_faktur);
while kondisi<>'F' do
begin
gotoxy(44, 5); readln(id);
if id='K001' then begin kondisi:='F'; gotoxy(48, 5); write('[ Riana ]'); end
else if id='K002' then begin kondisi:='F'; gotoxy(48, 5); write('[ Deasy ]'); end
else if id='K003' then begin gotoxy(48, 5); kondisi:='F'; write('[ Heni ]'); end
else begin gotoxy(10, 14); kondisi:='F'; write('Kode pegawai tidak ada.[ENTER]'); readln; end;
gotoxy(10, 14);write('                              '); 
gotoxy(44, 5);write('        ');
end;
gotoxy(17, 6); readln(nama_kons); gotoxy(17, 7); readln(alamat);
gotoxy(17, 8); readln(tgl_acara); gotoxy(17, 9); readln(kode_paket);
if kode_paket='PP1'
  then begin nama_paket:='[  Paket Pernikahan I ]'; biaya :=13500000; end
else if kode_paket='PP2'
  then begin nama_paket:='[  Paket Pernikahan 2 ]'; biaya :=25000000; end
else if kode_paket='PP3'
  then begin nama_paket:='[  Paket Pernikahan 3 ]'; biaya :=45000000; end
else if kode_paket='PU1'
  then begin nama_paket:='[  Paket Ultah 1 ]'; biaya :=1500000; end
else if kode_paket='PU2'
  then begin nama_paket:='[  Paket Ultah 1 ]'; biaya :=3000000; end
else begin nama_paket:='[  Paket Ultah 3 ]'; biaya :=5000000; end;
gotoxy(22, 9); write(nama_paket);
gotoxy(21, 10); write(biaya:2:0);
gotoxy(21, 11); readln(dp);
kurang:=biaya-dp;
gotoxy(21, 12); write(kurang:2:0);
gotoxy(10, 14); write('Apakah ada data lagi [Y/T] : '); readln(lagi);
until lagi='T';
readln;
end.
