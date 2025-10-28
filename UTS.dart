abstract class Transportasi {
    String id, namaKendaraan;
    double _tarifDasar;
    Transportasi(this.id, this.namaKendaraan, double tarifDasar) : _tarifDasar = tarifDasar;
    double get tarifDasar => tarifDasar;
    double hitungTarif(int jumlahPenumpang);
    void tampilInfo();
}

class Taksi extends Transportasi {
    double jarak;
    Taksi(String id, String namaKendaraan, double tarifDasar, this.jarak) : super(id, namaKendaraan, tarifDasar);
    @override double hitungTarif(int jumlahPenumpang) => _tarifDasar * jarak;
    @override void tampilInfo() => print ('$namaKendaraan, Jarak: $jarak km, Tarif: ${hitungTarif(1)}');
}

class Bus extends Transportasi {
    bool adaWifi;
    Bus(String id, String namaKendaraan, double tarifDasar, this.adaWifi) : super(id, namaKendaraan, tarifDasar);
    @override double hitungTarif(int jumlahPenumpang) => (_tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 10);
    @override void tampilInfo() => print ('$namaKendaraan, Wifi: ${adaWifi ? "Ada" : "Tidak"}, Tarif: ${hitungTarif(1)}');
}

class Pesawat extends Transportasi {
    String kelas;
    Pesawat(String id, String namaKendaraan, double tarifDasar, this.kelas) : super(id, namaKendaraan, tarifDasar);
    @override double hitungTarif(int jumlahPenumpang) => _tarifDasar * jumlahPenumpang * (kelas == "Bisnis" ? 1.5 : 1.0);
    @override void tampilInfo() => print ('$namaKendaraan, Kelas: $kelas km, Tarif: ${hitungTarif(1)}');
}

class Pemesanan {
    String idPemesanan, namaPelanggan;
    Transportasi transportasi;
    int jumlahPenumpang;
    Pemesanan(this.idPemesanan, this.namaPelanggan, this.transportasi, this.jumlahPenumpang);
    void cetakStruk() {
        print('Pemesanan: $idPemesanan, Pelanggan: $namaPelanggan');
        transportasi.tampilInfo();
    }
}

void main() {
    var daftarPemesanan = [
        Pemesanan("1", "Andika", Taksi("TAXI900", "Taksi Cepat", 10000, 10), 2),
        Pemesanan("2", "Hamdani", Bus("BUS002", "Bus Maluku Utara", 5000, true), 10),
        Pemesanan("3", "Rina", Pesawat("Sriwijaya", "Garuda Indonesia", 2000000, "Bisnis"), 3),
    ];

    daftarPemesanan.forEach((p) => p.cetakStruk());
}