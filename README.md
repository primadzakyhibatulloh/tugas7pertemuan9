# 🚀 Prima Motor Rental  
Aplikasi Flutter sederhana untuk sistem **rental motor**, dilengkapi login menggunakan SharedPreferences, dashboard motor, profil pengguna, dan navigasi menggunakan Drawer.  
Didesain untuk kebutuhan pembelajaran mobile development.

---

## 📁 Struktur Proyek
lib/
├── models/
│ ├── motor.dart
│ └── user.dart
├── services/
│ └── auth_service.dart
├── screens/
│ ├── check_auth_screen.dart
│ ├── login_screen.dart
│ ├── dashboard_screen.dart
│ └── profile_screen.dart
├── widgets/
│ └── app_drawer.dart
└── main.dart


---

# 🧠 Penjelasan Detail Per File

---

## 📌 1. `models/motor.dart`
### Fungsi:
Mewakili data motor yang ditampilkan pada dashboard.

### Penjelasan Kode:
- `id` → identitas unik motor  
- `nama` → nama motor  
- `tipe` → menentukan jenis motor (Matic / Sport / Trail)  
- `hargaSewa` → tarif sewa per hari  

Motor ini digunakan dalam `DashboardScreen` untuk menampilkan daftar kendaraan.

---

## 📌 2. `models/user.dart`
### Fungsi:
Merepresentasikan user yang login ke aplikasi.

### Penjelasan Kode:
- `toMap()` → mengubah object User ke struktur Map  
- `fromMap()` → membuat User dari Map  
- `toJson()` → serialisasi Map menjadi JSON string  
- `fromJson()` → parsing JSON menjadi object User  

JSON user ini disimpan di SharedPreferences agar aplikasi dapat melakukan **auto login**.

---

## 📌 3. `services/auth_service.dart`
### Fungsi:
Mengelola seluruh proses autentikasi.

### Fungsi Utama:
- `login(email, password)`  
  - Validasi email & password  
  - Membuat objek User  
  - Menyimpan data user ke SharedPreferences  
  - Memberi tahu UI melalui `notifyListeners()`  

- `tryAutoLogin()`  
  - Mengecek apakah user pernah login  
  - Jika ya → load JSON user dari SharedPreferences  

- `logout()`  
  - Membersihkan user dari memori dan storage  

### Catatan:
Aplikasi ini masih menggunakan **credential hardcoded**:

email: prima@rental.com
password: H1D023040

Hanya untuk simulasi — tidak untuk produksi.

---

## 📌 4. `screens/check_auth_screen.dart`
### Fungsi:
Menjadi "gerbang awal" aplikasi.

### Cara Kerja:
1. Saat aplikasi dibuka  
2. Memanggil `tryAutoLogin()`  
3. Jika user ada → langsung pindah ke Dashboard  
4. Jika tidak → ke halaman Login  

Widget ini bertindak seperti **Splash Screen Autentikasi**.

---

## 📌 5. `screens/login_screen.dart`
### Fungsi:
Halaman untuk user masuk ke aplikasi.

### Bagian Penting:
- Form validasi email & password  
- Tombol login yang berubah menjadi loading  
- Jika login berhasil → langsung ke Dashboard  
- Jika gagal → tampil pesan error dengan SnackBar  

### UX Notes:
- Controller harus di-dispose (untuk menghindari memory leak)  
- Validasi email minimal menggunakan tanda `@`  

---

## 📌 6. `screens/dashboard_screen.dart`
### Fungsi:
Halaman utama setelah login.

### Isi Dashboard:
- Sapaan personal: “Selamat datang, **Prima**”  
- Daftar motor dari list statis  
- Menampilkan:
  - nama
  - jenis motor
  - harga sewa
  - ikon berdasarkan tipe motor  

### Hal yang Bisa Ditambahkan:
- Detail motor  
- Tombol `Sewa`  
- Gambar motor  

---

## 📌 7. `screens/profile_screen.dart`
### Fungsi:
Menampilkan informasi user yang login.

### Data yang Ditampilkan:
- Nama  
- Email  
- NIM  
- ID user  

Mengambil data dari `AuthService.user`.

### Catatan Edge Case:
Jika `user.name` kosong, substring akan error.  
Disarankan menggunakan pengecekan aman.

---

## 📌 8. `widgets/app_drawer.dart`
### Fungsi:
Navigasi sidebar untuk:
- Dashboard  
- Profil  
- Logout  

### Detail:
- Menampilkan nama & email user  
- Logout akan:
  - Memanggil `AuthService.logout()`  
  - Menghapus SharedPreferences  
  - Mengarahkan kembali ke Login  

---

## 📌 9. `main.dart`
### Fungsi:
Entry point aplikasi.

### Elemen Kunci:
- Registrasi `AuthService` dengan Provider  
- Custom Dark Theme  
- Routing aplikasi  
- Default halaman awal → `AuthCheckScreen()`  

Tema menggunakan font **Poppins** untuk tampilan lebih modern.

---

# 🔁 Alur Login Aplikasi

1. Aplikasi dibuka  
2. Sistem cek SharedPreferences  
3. Jika ada user tersimpan → auto login ke Dashboard  
4. Jika tidak → user masuk ke Login  
5. User submit email dan password  
6. Jika valid → data disimpan → pindah ke Dashboard  
7. User dapat:
   - melihat motor  
   - membuka profil  
   - logout  
8. Logout menghapus data session dan kembali ke Login  

---

# 🛠️ Fitur Teknis yang Didukung
- Persistent login (SharedPreferences)
- State management sederhana (Provider)
- Navigation dengan Drawer
- Validasi form input
- Dark mode UI konsisten
- Serialisasi/Deserialisasi JSON

---

# ⚙️ Rekomendasi Pengembangan Lanjutan
- Tambahkan fitur booking motor  
- Tambahkan API backend (login & list motor)  
- Ganti SharedPreferences menjadi `flutter_secure_storage` untuk data sensitif  
- Tambahkan gambar motor pada dashboard  
- Tambahkan menu Edit Profil  
- Implementasi History Sewa  

---

# 👨‍💻 Developer
**Prima Dzaky Hibatulloh — HID023040**  
Program Studi Informatika  
Universitas Jenderal Soedirman  

---

# 📄 Lisensi
Project ini bersifat edukasi dan bebas digunakan untuk pembelajaran.

