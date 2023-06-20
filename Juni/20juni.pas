uses wincrt;

type transaksi = record

  nama_pas, telepon, nama_poli : string[20];

  keluhan : string[30];

  alamat : string[40];

  kode_poli, jenis_pasien : string[5];

  nib : integer;

  biaya_reg, biaya_periksa, total_periksa : real;

end;

var

   pasien : array[1..50] of transaksi;

   id, tanggal, dokter_poli, namak, ada, kondisi, lagi : string;

   i, baris, posisi : integer;

   total : real;

procedure garis;

  begin

    write('-------------------------------------------------------------------------------');

  end;

procedure header;

  begin

    gotoxy(1,1);write('Poliklinik Mugi Sehat selalu');

    gotoxy(1,2);write('Jl. Panden Lamper No. 12-14, Semarang');

    gotoxy(1,3);write('Telp.0811 3232 0987');

    gotoxy(1,4);garis;

  end;

procedure main;

  begin

    lagi:='y';

    repeat

    inc(i);inc(baris);

    clrscr;

    header;

    gotoxy(1,5);write('No Induk Berobat      :         Tanggal Periksa :'); 

    gotoxy(1,6);write('Id Karyawan           :');

    gotoxy(1,7);garis;

    gotoxy(1,8);write('Data Pasien');

    gotoxy(1,9);write('Nama Pasien           :');

    gotoxy(1,10);write('Alamat Pasien         :');

    gotoxy(1,11);write('Telepon               :');

    gotoxy(1,12);write('Jenis Pasien          :');

    gotoxy(1,13);write('Keluhan               :');

    gotoxy(1,14);write('Kode Poli Yang Dituju :');

    gotoxy(1,15);write('Dokter Poli           :');

    gotoxy(1,16);garis;

    gotoxy(1,17);write('Detail Bayar');

    gotoxy(1,18);write('Biaya Pendaftaran     : Rp.');

    gotoxy(1,19);write('Biaya Periksa         : Rp.');

    gotoxy(1,20);write('TOTAL BAYAR           : Rp.');

    gotoxy(1,21);garis;

    with pasien[i] do

      begin

        gotoxy(25,5);write(i);

        gotoxy(51,5);readln(tanggal);

        repeat

        gotoxy(25,6);readln(id);

        if id='NIK01' then

          begin

            ada:='T';

            namak:='[ Erna Tri Winarsih ]';

          end

        else if id='NIK02' then

          begin           

            ada:='T';

            namak:='[ Irawati Putri ]';

          end

        else if id='NIK03' then

          begin   

            ada:='T';

            namak:='[ Ratri Damayanti ]';

          end

        else

          begin

            gotoxy(10,23);write('ID Karyawan tidak ditemukan [ENTER]');readln;  

            gotoxy(10,23);write('                                    ');

            gotoxy(25,6);write('      ');

          end;

        until ada='T';

        gotoxy(32,6);write(namak);

        gotoxy(25,9);readln(nama_pas);         

        gotoxy(25,10);readln(alamat);

        gotoxy(25,11);readln(telepon);

        gotoxy(25,12);readln(jenis_pasien);

        if jenis_pasien='1' then

          begin

            gotoxy(28,12);write('[ Pasien Umum ]');

            biaya_reg:=40000;

          end

        else

          begin

            gotoxy(28,12);write('[ Pasien BPJS ]'); 

            biaya_reg:=0;

          end;

        gotoxy(25,13);readln(keluhan);

        repeat  

        gotoxy(25,14);readln(kode_poli);

        if kode_poli='POG' then

          begin

            kondisi:='T';

            nama_poli:='Poli Gigi';

            dokter_poli:='drg. Maya';

            if jenis_pasien='1' then

              begin

                biaya_periksa:=60000;

              end

            else

              begin

                biaya_periksa:=0;

              end;

          end

        else if kode_poli='POD' then

          begin             

            kondisi:='T';

            nama_poli:='Poli Penyakit Dalam';

            dokter_poli:='dr. Bintang, Sp.PD';

            if jenis_pasien='1' then

              begin

                biaya_periksa:=80000;

              end

            else

              begin

                biaya_periksa:=0;

              end;

          end

        else if kode_poli='POA' then

          begin              

            kondisi:='T';

            nama_poli:='Poli Anak';

            dokter_poli:='dr. Mahawira, Sp.A';

            if jenis_pasien='1' then

              begin

                biaya_periksa:=60000;

              end

            else

              begin

                biaya_periksa:=0;

              end;

          end

        else if kode_poli='POT' then

          begin              

            kondisi:='T';

            nama_poli:='Poli THT';

            dokter_poli:='dr. Andra, Sp.THT';

            if jenis_pasien='1' then

              begin

                biaya_periksa:=50000;

              end

            else

              begin

                biaya_periksa:=0;

              end;

          end

        else if kode_poli='POK' then

          begin              

            kondisi:='T';

            nama_poli:='Poli Kandungan';

            dokter_poli:='dr. Alia, Sp.OG';

            if jenis_pasien='1' then

              begin

                biaya_periksa:=80000;

              end

            else

              begin

                biaya_periksa:=0;

              end;

          end

        else if kode_poli='POU' then

          begin               

            kondisi:='T';

            nama_poli:='Poli Umum';

            dokter_poli:='dr. Hani';

            if jenis_pasien='1' then

              begin

                biaya_periksa:=30000;

              end

            else

              begin

                biaya_periksa:=0;

              end;

          end

        else

          begin

            gotoxy(10,23);write('Poliklik Tidak Tersedia, kami tidak dapat melayani');readln;

            gotoxy(10,23);write('                                                      ');

            gotoxy(25,14);write('           ');

          end;

        until kondisi='T';

        total_periksa:=biaya_reg+biaya_periksa;

        gotoxy(30,14);write('[', nama_poli, ']');

        gotoxy(25,15);write(dokter_poli);

        gotoxy(28,18);write(biaya_reg:2:0);

        gotoxy(28,19);write(biaya_periksa:2:0);

        gotoxy(28,20);write(total_periksa:2:0);

      end; 

    gotoxy(10,23);write('Apakah ada data lagi [Y/T] : ');readln(lagi);

    until ((lagi='T') or (lagi='t'));

  end;

procedure report;

  begin

    clrscr;

    header;

    gotoxy(1,5);write('No   No Berobat  Nama Pasien    Keluhan     Poli         Biaya         Biaya ');

    gotoxy(1,6);write('                                            Tujuan       Pendaftaran   Periksa');

    gotoxy(1,7);garis;

    baris:=7;

    for posisi:=1 to i do

    with pasien[posisi] do

      begin

        inc(baris);

        gotoxy(1,baris);write(posisi);

        gotoxy(6,baris);write(posisi);

        gotoxy(18,baris);write(nama_pas);

        gotoxy(33,baris);write(keluhan);

        gotoxy(45,baris);write(nama_poli);

        gotoxy(58,baris);write(biaya_reg:2:0);

        gotoxy(72,baris);write(biaya_periksa:2:0);

        total:=total+biaya_periksa;

      end;

    gotoxy(1,baris+1);garis;

    gotoxy(60,baris+2);write('Total : Rp. ', total:2:0);

    readln;

  end;

begin

main;report;

readln;

end.

