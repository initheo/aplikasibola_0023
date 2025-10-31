# Aplikasi Persib Bandung Official - 0023

Aplikasi Flutter untuk manajemen data pemain dan informasi Persib Bandung. Dikembangkan sebagai bagian dari tugas mata kuliah Pemrograman Mobile.

## Deskripsi

Aplikasi mobile berbasis Flutter yang menyediakan fitur lengkap untuk mengelola informasi klub sepak bola Persib Bandung, termasuk sistem autentikasi, manajemen data pemain, jadwal pertandingan, dan berita terbaru.

## Fitur Utama

### 1. 🔐 Halaman Login

- Validasi email dengan domain spesifik (@gmail.com)
- Password minimal 6 karakter
- Toggle show/hide password
- Navigasi ke halaman registrasi

### 2. 📝 Halaman Registrasi

- Form lengkap: Nama, Alamat, No. Telepon, Email, Password
- Validasi nomor telepon (10-13 digit, hanya angka)
- Pilihan jenis kelamin (Radio button)
- Validasi password dan konfirmasi password
- Email dengan domain tertentu (@gmail.com)

### 3. 🏠 Halaman Home

- Jadwal pertandingan Persib Bandung
- Menu navigasi (Player, Jadwal, Klasemen, Merchandise)
- Berita terbaru
- Tombol logout

### 4. ➕ Halaman Tambah Pemain

- Form input data pemain lengkap
- Validasi untuk semua field:
  - Nama Pemain
  - Posisi Pemain
  - Nomor Punggung (hanya angka)
  - Kewarganegaraan
  - Usia (10-50 tahun)
  - Tinggi Badan (cm)
  - Jenis Kelamin (Radio button)
- Floating label dengan animasi
- Navigasi ke halaman detail setelah validasi sukses

### 5. 📋 Halaman Detail Data Pemain

- Menampilkan semua informasi pemain
- Konversi otomatis tinggi badan dari cm ke meter (contoh: 180 cm → 1.80 m)
- Tombol Cancel → kembali ke halaman Tambah Pemain
- Tombol Save → kembali ke halaman Home

## Prerequisites

Sebelum menjalankan proyek ini, pastikan Anda telah menginstal:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (versi 3.9.2 atau lebih baru)
- [Dart SDK](https://dart.dev/get-dart)
- Android Studio atau VS Code dengan ekstensi Flutter & Dart
- Emulator Android atau perangkat fisik
- Git untuk version control

## Instalasi

1. Clone repository ini:

   ```bash
   git clone https://github.com/initheo/aplikasibola_0023.git
   ```

2. Masuk ke direktori proyek:

   ```bash
   cd aplikasibola_0023
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

## Menjalankan Aplikasi

1. Pastikan emulator atau perangkat terhubung:

   ```bash
   flutter devices
   ```

2. Jalankan aplikasi:

   ```bash
   flutter run
   ```

3. Untuk build release:
   ```bash
   flutter build apk --release
   ```

## Struktur Proyek

```
lib/
├── main.dart                  # Entry point aplikasi
├── login_screen.dart          # Halaman login
├── register_screen.dart       # Halaman registrasi
├── home_screen.dart           # Halaman utama/beranda
├── add_player_screen.dart     # Halaman tambah pemain
└── detail_player_screen.dart  # Halaman detail pemain

android/                       # Konfigurasi Android
ios/                           # Konfigurasi iOS
```

## Teknologi & Package

- **Flutter SDK**: Framework utama
- **Material Design**: UI/UX design system
- **Dart**: Bahasa pemrograman

### Fitur Teknis:

- StatefulWidget & StatelessWidget
- Form validation dengan GlobalKey
- TextEditingController untuk input management
- Navigator untuk routing
- AutovalidateMode untuk real-time validation
- Regular Expression untuk validasi email & nomor
- Radio buttons untuk pilihan jenis kelamin
- SingleChildScrollView untuk scrollable content
- Horizontal ListView untuk news cards

## Validasi Form

### Email

- Format: `name@domain.com`
- Domain yang diterima: `@gmail.com`
- Regex: `^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$`

### Password

- Minimal 6 karakter
- Tidak ada karakter khusus yang diwajibkan

### Nomor Telepon

- Hanya angka (0-9)
- Panjang: 10-13 digit

### Usia Pemain

- Rentang: 10-50 tahun
- Hanya angka

### Tinggi Badan

- Input dalam centimeter (cm)
- Konversi otomatis ke meter di halaman detail

## Screenshots/Demo Aplikasi

screen_record.mov

## Testing

Untuk menjalankan test:

```bash
flutter test
```

## Troubleshooting

### Error: No devices found

- Pastikan emulator sudah running atau perangkat terhubung
- Jalankan `flutter doctor` untuk cek konfigurasi

### Error: pubspec.yaml

- Jalankan `flutter clean` kemudian `flutter pub get`

### Logo tidak muncul

- Pastikan file `persib_logo.png` ada di folder `assets/images/`
- Jalankan `flutter pub get` setelah menambahkan asset

## Kontributor

- **Muqoffin** - Developer

## Lisensi

Distributed under the MIT License. See `LICENSE` for more information.

## Link

Proyek: [https://github.com/initheo/aplikasibola_0023](https://github.com/initheo/aplikasibola_0023)
