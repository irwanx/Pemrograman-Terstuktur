uses wincrt;
var
    tanggal, nama, alamat, telp, id_tujuan, paket, kondisi : string ;
    hrg_paket1, hrg_paket2, harga_paket, jumlah_peserta, jumlah_bayar, diskon, jumlah_diskon, total_bayar, diskonku : real;
begin
{
 * BLOK TAMPILAN
}
gotoxy(10,2);write('Andra Tour & Travel');
gotoxy(10,3);write('Jl. Sriwijaya No. 80, Semarang');
gotoxy(10,4);write('Telp. 024-998 7766; Fax : 024-4567 0987');
gotoxy(10,5);write('---------------------------------------------------------------'); 
gotoxy(10,6);write('               Pendataan Peserta Tour Wisata');
gotoxy(10,7);write('---------------------------------------------------------------');
gotoxy(10,8);write('Data Konsumen');                                            
gotoxy(45,8);write('Tanggal   :');
gotoxy(10,9);write('Nama Konsumen     :');
gotoxy(10,10);write('Alamat Konsumen   :');
gotoxy(10,11);write('Telp/Hp           :');
gotoxy(10,12);write('Detail Tour');
gotoxy(10,13);write('Id Tujuan         :');
gotoxy(45,13);write('Tujuan    :');
gotoxy(10,14);write('Paket             :');
gotoxy(45,14);write('Fasilitas :');
gotoxy(10,15);write('Biaya Paket/Orang :');
gotoxy(10,16);write('Jumlah Peserta    :');
gotoxy(10,17);write('Jumlah Bayar      :'); 
gotoxy(45,17);write('Discount  :');
gotoxy(30,18);write('Total Bayar  :');    
gotoxy(10,19);write('---------------------------------------------------------------');
{
 * BLOK INPUT
}
gotoxy(57,8);readln(tanggal);                                                   
gotoxy(30,9);readln(nama);
gotoxy(30,10);readln(alamat);
gotoxy(30,11);readln(telp);
repeat
gotoxy(30,13);readln(id_tujuan);
if id_tujuan='TJN01' then
   begin
     kondisi:='F';
     gotoxy(57,13);write('Jakarta');
     hrg_paket1:=1800000;
     hrg_paket2:=2200000;
   end
else if id_tujuan='TJN02' then
   begin        
     kondisi:='F';
     gotoxy(57,13);write('Yogyakarta'); 
     hrg_paket1:=1800000;
     hrg_paket2:=160000;
   end
else if id_tujuan='TJN03' then
   begin      
     kondisi:='F';
     gotoxy(57,13);write('Bandung');
     hrg_paket1:=1800000;
     hrg_paket2:=2000000;
   end
else if id_tujuan='TJN04' then
   begin   
     kondisi:='F';
     gotoxy(57,13);write('Surabaya');
     hrg_paket1:=1800000;
     hrg_paket2:=2000000;
   end
else if id_tujuan='TJN05' then
   begin    
     kondisi:='F';
     gotoxy(57,13);write('Bali');
     hrg_paket1:=1800000;         
     hrg_paket2:=3600000;
   end
else
   begin
    gotoxy(20,20);write('ID Tujuan Yang Anda Masukkan Tidak Ada [ENTER]');readln;
    gotoxy(20,20);write('                                               ');
    gotoxy(30,13);write('     ');
   end;
until kondisi='F';
{ ------------- BATAS -------------}  
gotoxy(30,14);readln(paket);
if paket='1' then
   begin               
     gotoxy(57,14);write('Bus AC, Hotel BIntang 5');
     harga_paket:=hrg_paket1;
   end
else    
   begin                                   
     gotoxy(57,14);write('Bus AC VIP, Hotel Bintang 5');
     harga_paket:=hrg_paket2;
   end;
gotoxy(30,15);write('Rp. ', harga_paket:2:0);
{ Batass }
gotoxy(30,16);readln(jumlah_peserta);
if jumlah_peserta>=8 then
   begin
     diskon:=0.1; 
     diskonku:=10;
     jumlah_bayar:=jumlah_peserta*harga_paket;
     total_bayar:=jumlah_bayar-(jumlah_bayar*diskon);
     jumlah_diskon:=jumlah_bayar-total_bayar;
   end
else if ((jumlah_peserta<=8) and (jumlah_peserta>=3)) then
   begin   
     diskon:=0.05;
     diskonku:=5;
     jumlah_bayar:=jumlah_peserta*harga_paket;
     total_bayar:=jumlah_bayar-(jumlah_bayar*diskon);
     jumlah_diskon:=jumlah_bayar-total_bayar;
   end
else
   begin
     diskonku:=0;
     jumlah_bayar:=jumlah_peserta*harga_paket;
     total_bayar:=jumlah_bayar;
     jumlah_diskon:=0;
   end;
gotoxy(30,17);write('Rp. ',  jumlah_bayar:2:0);
gotoxy(57,17);write(diskonku:2:0,'% Rp. ', jumlah_diskon:2:0);
gotoxy(45,18);write('Rp. ', total_bayar:2:0);
readln;
end.
