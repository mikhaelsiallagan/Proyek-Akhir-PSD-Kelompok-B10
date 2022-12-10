# 🎰 SLOT MACHINE
> Program ini sebagai salah satu syarat pemenuhan tugas dalam praktikum Perancangan Sistem Digital Jurusan Teknik Komputer Universitas Indonesia
---
## About
Program slot machine ini merupakan program yang mengimplementasi bahasa VHDL yang berfungsi seperti layaknya slot machine pada dunia nyata. Program ini dibuat oleh kelompok B10 yang beranggotakan :

- Rezki Muhammad - 2106731516
- Muhammad Suhaili - 2106731535
- Mikhael Morris Hapataran Siallagan - 2106731491
- Nevanda Fairuz Pahlevi - 2106731541
---
## Description
Program slot machine ini terdiri dari 3 reels yang masing-masing nya mempunyai 7 angka. Saat dimainkan, maka reels akan me-_generate_ angka random yang akan ditampilkan. Saat angka di _generate_ dan ditampilkan, program akan memunculkan pesan text yang sesuai dengan hasil yang didapatkan. Pemain dapat terus memainkan slot machine sampai koin yang dipunyai habis.

---
## Features
- Layanan Top Up dan Balance

Program ini memiliki fitur yang memungkinkan pemain untuk melakukan top up dengan harga 1000 per koin sebelum memainkan slot machine. Kemudian dari koin yang didapatkan, pemain dapat menggunakan slot machine dengan 1 koin per 1 kali main. Apabila koin yang dimiliki sudah habis, maka akan muncul pesan yang menandakan bahwa pemain sudah selesai memainkan slot machine tersebut.

- Pesan Report atas Keuntungan yang didapatkan

Saat koin dimasukkan dan slot dimainkan kemudian keluar hasil dari angka yang keluar, maka program akan mengeluarkan text pesan yang menampilkan keuntungan yang didapatkan oleh pemain.

---
## Winning Mechanism
Setiap reels akan me-_generate_ angka dari 1-7. Adapun semakin tinggi nilai angka, maka value nya akan semakin besar yang akan berpengaruh kepada keuntungan yang didapatkan pemain. 

> Keuntungan yang didapatkan pemain adalah 500 * multiplier.

Jika 2 angka yang sama adalah : 

- 1, 2 atau 3 : multiplier bernilai 1
- 4 atau 5    : multiplier bernilai 2
- 6 : multiplier bernilai 3
- 7 : multiplier bernilai 4

Jika 3 angka yang sama adalah : 
- 1 atau 2 : multiplier bernilai 2
- 3 atau 4 : multiplier bernilai 3
- 5 : multiplier bernilai 4
- 6 : multiplier bernilai 10
- 7 : multiplier bernilai 100

---
## State Diagram
![Slot Machine State Diagram](statediagram.jpg)

---
## Function Snippets
```function rand(seed1, seed2 : positive) return std_logic_vector;```
> Melakukan randomisasi dari angka yang nantinya akan digunakan untuk masing-masing reels

```function checking(sym1, sym2, sym3 : std_logic_vector(2 downto 0)) return integer;```
> Melakukan pengecekan apakah ada angka yang sama pada reels setelah pemain memainkan slot

```function conclusion(checker : integer) return positive;```
> Melakukan perhitungan keuntungan yang didapatkan pemain berdasarkan nilai dari function checking serta menampilkan pesan yang berhubungan dengan keuntungan dari pemain.

---







