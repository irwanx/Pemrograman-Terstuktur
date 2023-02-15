
uses
  Crt;


var
  panjang, lebar, luas: Real;


begin
  write('Nilai Panjang : ');
  Readln(panjang);
  write('Nilai Lebar : ');
  ReadLn(lebar);
  luas := Panjang * Lebar;
  WriteLn('Luas Persegi Panjang : ', luas: 2: 0, 'M2');
  if luas <= 100 then
    write('Tanah Cukup Luas')  
  else if luas <= 300 then
    write('Tanah Luas')  
  else 
    write('Tanah Luas Sekali');
end.
