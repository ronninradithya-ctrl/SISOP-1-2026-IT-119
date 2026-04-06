
# SISOP-1-2026-IT-119
# strukdat-java-oop
=======

Soal 1 – Analisis Data Penumpang KANJ Menggunakan AWK 

### 1. Persiapan Direktori

Langkah pertama adalah membuat direktori utama untuk praktikum serta sub-direktori untuk soal 1.

```bash
mkdir praktikum-sisop-1
cd praktikum-sisop-1
mkdir soal_1
cd soal_1
```

**Penjelasan:**

* `mkdir` digunakan untuk membuat folder baru
* `cd` digunakan untuk berpindah direktori
* Folder `soal_1` berfungsi untuk mengelompokkan file agar lebih terstruktur

---

### 2. Pembuatan File Data (`passenger.csv`)

Selanjutnya dibuat file data penumpang dalam format CSV.

```bash
nano passenger.csv
```

Isi file:

```csv
id,nama,gerbong,usia,kelas
1,Andi,1,25,Ekonomi
2,Budi,2,40,Business
3,Citra,1,30,Ekonomi
4,Dewi,3,55,Business
5,Eka,2,22,Ekonomi
6,Fajar,3,60,Business
7,Gina,1,28,Ekonomi
8,Hadi,2,35,Business
```

CSV (Comma-Separated Values) digunakan untuk menyimpan data dalam bentuk tabel yang mudah dibaca oleh program seperti AWK. Setiap baris pada file ini merepresentasikan satu penumpang, sedangkan setiap kolom dipisahkan oleh tanda koma untuk membedakan atribut seperti id, nama, gerbong, usia, dan kelas. Baris pertama berfungsi sebagai header yang menjelaskan isi dari setiap kolom sehingga memudahkan proses pengolahan data.

---

### 3. Pembuatan Script AWK (`KANJ.sh`)

Script ini digunakan untuk memproses data berdasarkan opsi yang diberikan.

```bash
nano KANJ.sh
```

Perintah `nano` digunakan untuk membuka dan mengedit file teks langsung di terminal. Dalam hal ini, `nano KANJ.sh` digunakan untuk membuat atau mengedit file script bernama `KANJ.sh`. Ekstensi `.sh` menunjukkan bahwa file tersebut adalah script shell (script yang dapat dijalankan di terminal Linux), yang nantinya berisi perintah atau program untuk memproses data menggunakan AWK.

Isi script:

```awk
BEGIN {
    FS=","
    option = ARGV[2]
    delete ARGV[2]
}

NR==1 { next }

{
    if (option == "a") {
        count++
    }

    else if (option == "b") {
        carriage[$3]=1
    }

    else if (option == "c") {
        if ($4 > max_age) {
            max_age = $4
            oldest = $2
        }
    }

    else if (option == "d") {
        total_age += $4
        count++
    }

    else if (option == "e") {
        if ($5 == "Business") {
            business++
        }
    }
}

END {
    if (option == "a") {
        print "Jumlah seluruh penumpang KANJ adalah", count, "orang"
    }

    else if (option == "b") {
        for (i in carriage) total++
        print "Jumlah gerbong penumpang KANJ adalah", total
    }

    else if (option == "c") {
        print oldest, "adalah penumpang kereta tertua dengan usia", max_age, "tahun"
    }

    else if (option == "d") {
        avg = int(total_age / count)
        print "Rata-rata usia penumpang adalah", avg, "tahun"
    }

    else if (option == "e") {
        print "Jumlah penumpang business class ada", business, "orang"
    }

    else {
        print "Soal tidak dikenali. Gunakan a, b, c, d, atau e."
        print "Contoh penggunaan: awk -f KANJ.sh passenger.csv a"
    }
}
```

Penjelasan:

Bagian di atas merupakan isi dari script AWK yang digunakan untuk memproses data pada file CSV. Script ini mengatur pemisah kolom menggunakan tanda koma, membaca opsi yang diberikan oleh pengguna, serta mengabaikan baris header agar tidak ikut diproses. Selain itu, script juga memanfaatkan nomor kolom untuk mengambil data tertentu seperti nama, usia, dan kelas penumpang, serta menggunakan struktur array untuk menyimpan data unik seperti nomor gerbong.

---

### 4. Pengujian Program

pengjalanan prongram menggunakan perintah:

```bash
awk -f KANJ.sh passenger.csv a
awk -f KANJ.sh passenger.csv b
awk -f KANJ.sh passenger.csv c
awk -f KANJ.sh passenger.csv d
awk -f KANJ.sh passenger.csv e
```
Hasil dari penginputan ke program tersebut:

#### a. Total Penumpang

```
Jumlah seluruh penumpang KANJ adalah 8 orang
```

#### b. Jumlah Gerbong

```
Jumlah gerbong penumpang KANJ adalah 3
```

#### c. Penumpang Tertua

```
Fajar adalah penumpang kereta tertua dengan usia 60 tahun
```

#### d. Rata-rata Usia

```
Rata-rata usia penumpang adalah 36 tahun
```

#### e. Business Class

```
Jumlah penumpang business class ada 4 orang
```

<img width="813" height="233" alt="image" src="https://github.com/user-attachments/assets/5dd19379-d1b0-47ef-92a9-39c74a0deff3" />

---

### 5. Pengujian Error Handling

Untuk memastikan program aman dari input yang salah:

```bash
awk -f KANJ.sh passenger.csv f
```

Output:

```
Soal tidak dikenali. Gunakan a, b, c, d, atau e.
```

<img width="806" height="50" alt="image" src="https://github.com/user-attachments/assets/34165830-25a3-4898-898e-473587556748" />
>>>>>>> 2c724b5d8fc2979cf99399b96405c3729d41f17c
