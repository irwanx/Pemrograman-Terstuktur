program sanggar_tari_nusantara;

Uses crt;
// DEKLARASI
const
  MAX_MENU = 40;

type
  Menu = record
    npt, nama_peserta, kode_tari, nama_tarian, biaya_latihan_dat: string[20];
    biaya_latihan_dtg, jumlah_pertemuan: integer;
    potongan, jml_potongan, biaya, total_biaya: real;
  end;

var 
    anggota: array[1..MAX_MENU] of Menu;
    i, posisi : integer;
    kondisi, ulang : String;
    total: real;

begin
    total:=0;
    // BLOK TAMPILAN AWAL
    ulang:='y';
    while ((ulang='Y') or (ulang='y')) do // LOOP ISI DATA ANGGOTA
    begin
    clrscr();
    gotoxy(10,5);write('Sanggar Tari Nusantara');
    gotoxy(10,6);write('Jl. Magelang-Jogja Km. 17');
    gotoxy(10,7);write('Telp. 0293-222 231, Fax. 0293-567 123');
    gotoxy(10,8);write('-----------------------------------------------------------------------------------------------------------------------');
    gotoxy(10,9);write('NPT                  : ');gotoxy(50,9);write('Pendaftar Ke  :');
    gotoxy(10,10);write('Nama Peserta         : ');
    gotoxy(10,11);write('Kode Tari            : ');
    gotoxy(10,12);write('Biaya/Datang         : ');
    gotoxy(10,13);write('Paket Kedatangan     : ');
    gotoxy(10,14);write('Potongan             : ');
    gotoxy(10,15);write('Jumlah Bayar         : ');
    gotoxy(10,16);write('-----------------------------------------------------------------------------------------------------------------------');

    inc(i); // AUTO INCREMENT
    gotoxy(33,9);Readln(anggota[i].npt);
    gotoxy(66,9);write(i);
    gotoxy(33,10);Readln(anggota[i].nama_peserta);

    repeat // LOOP KODE JENIS TARI
    gotoxy(33,11);Readln(anggota[i].kode_tari);
    // IF NESTED UNTUK MENENTUKAN KODE JENIS TARI
    if anggota[i].kode_tari='T1' then
        begin
            kondisi:='F';
            anggota[i].nama_tarian:='Tari Gambyong';
            anggota[i].biaya_latihan_dat:='50.000,00';
            anggota[i].biaya_latihan_dtg:=50000;
            anggota[i].jumlah_pertemuan:=10;
            anggota[i].biaya:=500000;
        end
    else if anggota[i].kode_tari='T2' then
        begin
            kondisi:='F';
            anggota[i].nama_tarian:='Tari Saman';
            anggota[i].biaya_latihan_dtg:=100000;
            anggota[i].biaya_latihan_dat:='100.000,00';
            anggota[i].jumlah_pertemuan:=12;
            anggota[i].biaya:=1200000;
        end
    else if anggota[i].kode_tari='T3' then
        begin
            kondisi:='F';
            anggota[i].nama_tarian:='Tari Kecak';
            anggota[i].biaya_latihan_dtg:=150000;
            anggota[i].biaya_latihan_dat:='150.000,00';
            anggota[i].jumlah_pertemuan:=12;
            anggota[i].biaya:=1800000;
        end
    else if anggota[i].kode_tari='M1' then
        begin
            kondisi:='F';
            anggota[i].nama_tarian:='Salsa';
            anggota[i].biaya_latihan_dtg:=75000;
            anggota[i].biaya_latihan_dat:='75.000,00';
            anggota[i].jumlah_pertemuan:=8;
            anggota[i].biaya:=600000;
        end
    else if anggota[i].kode_tari='M2' then
        begin
            kondisi:='F';
            anggota[i].nama_tarian:='Belly Dance';
            anggota[i].biaya_latihan_dtg:=65000;
            anggota[i].biaya_latihan_dat:='65.000,00';
            anggota[i].jumlah_pertemuan:=10;
            anggota[i].biaya:=650000;
        end
    else
        begin
            gotoxy(20,17);write('Kode Jenis Tari Tidak Ada [ENTER]');readln;
            gotoxy(20,17);write('                                      ');
            gotoxy(33,11);write('    ');
        end;
    until kondisi='F'; // END REPEAT
    // IF NESTED UNTUK MENENTUKAN BESAR POTONGAN
    if i <=15 then
        begin
            anggota[i].potongan:=0.1;
        end
    else if ((i >= 16) and (i <=25)) then
        begin
            anggota[i].potongan:=0.05;
        end
    else
        begin
            anggota[i].potongan:=0;
        end;
    // MENENTUKAN POTONGAN DAN JUMLAH YANG HARUS DIBAYARKAN
    anggota[i].jml_potongan := anggota[i].potongan * anggota[i].biaya;
    anggota[i].total_biaya := anggota[i].biaya - anggota[i].jml_potongan;
    // BLOK HASIL TAMPILAN AWAL
    gotoxy(37,11);write(anggota[i].nama_tarian);
    gotoxy(33,12);write('Rp. ', anggota[i].biaya_latihan_dat);
    gotoxy(33,13);write(anggota[i].jumlah_pertemuan, ' Kali');
    gotoxy(33,14);write('Rp. ', anggota[i].jml_potongan:2:0, ',00');
    gotoxy(33,15);write('Rp. ', anggota[i].total_biaya:2:0, ',00');
    gotoxy(20,17);write('Ada Data Peserta Tari Lagi [Y/T] :');Readln(ulang);
    end; // END WHILE
    // BLOK TAMPILAN KEDUA
    clrscr();
    gotoxy(10,5);write('Sanggar Tari Nusantara');
    gotoxy(10,6);write('Jl. Magelang-Jogja Km. 17');
    gotoxy(10,7);write('Telp. 0293-222 231, Fax. 0293-567 123');
    gotoxy(10,8);write('-----------------------------------------------------------------------------------------------------------------------');
    gotoxy(10,9);write('No   | Nama Peserta Tari       | Nama Ketrampilan       | Biaya              | Potongan         | Bayar');
    gotoxy(10,10);write('-----------------------------------------------------------------------------------------------------------------------');
    for posisi := 1 to i do
    begin
    gotoxy(10,10+posisi);write(posisi);
    gotoxy(15,10+posisi);write('| ', anggota[posisi].nama_peserta);
    gotoxy(41,10+posisi);write('| ', anggota[posisi].nama_tarian);
    gotoxy(66,10+posisi);write('| ', anggota[posisi].biaya_latihan_dat);
    gotoxy(87,10+posisi);write('| ', anggota[posisi].jml_potongan:2:0);
    gotoxy(106,10+posisi);write('| ', anggota[posisi].total_biaya:2:0);
    total := total + anggota[posisi].total_biaya;
    end;
    gotoxy(10,11+posisi);write('-----------------------------------------------------------------------------------------------------------------------');
    gotoxy(100,12+posisi);write('Total : ', total:2:0);
    readln;
end.
