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
        carriage[$3] = 1
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
    }
}
