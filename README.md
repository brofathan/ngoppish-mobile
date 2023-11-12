## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

Stateless widget adalah sebuah widget pada flutter yang tidak menerapkan perubahan (update state) atau widget tersebut bersifat statis. Stateful widget adalah sebuah widget yang memungkinkan diterapkan perubahan pada statenya, maka stateful widget ini bersifat dinamis.

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

- MyApp

Sebagai widget utama tempat untuk menginisialisasi widget MaterialApp

- ShopCard

Stateless widget parent

- ShopItem

Stateless widget

- MaterialApp

Widget utama yang mewakili flutter. Widget ini mengatur atribut-atribut seperti theme, title, dll

- ThemeData

Widget ini berfungsi untuk menentukan tema dari aplikasi.

- Material

Berfungsi untuk mengimplementasikan Material Design 

- Scaffold

Berfungsi sebagai layout atau struktur dari Material Design

- AppBar

Berfungsi untuk menampilkan potongan aplikasi di bagian atas layout.

- Text

Widget yang berfungsi untuk menampilkan string text dengan style.

- TextStyle

Untuk mendekorasi widget Text.

- Colors

Untuk memberi warna pada widget.

- SingleChildScrollView

Widget yang berbentuk box yang dapat di-scroll.

- Padding

Untuk memberikan padding pada widget lain.

- Column

Untuk memberikan layout secara vertikal.

- GridView

Untuk menampilkan widget berbentuk grid.

- Icon

Widget untuk menampilkan icon.

- Center

Widget yang men-center childnya.

- InkWell

Sebuah area widget material yang merespons sentuhan.

- Container

Sebuah widget yang menggabungkan painting, positioning, dan sizing widgets lain.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

1. Membuat file baru yaitu menu.dart untuk memisahkan widget-widget pada menu dan main widget.

2. Pada menu.dart, membuat class baru bernama ShopItem sebagai barang-barang yang akan dijual.

```dart
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}
```

String name untuk nama, icondata untuk icon pada tombol, color untuk menentukan warna. Setelah itu, ada juga constructor di bawahnya

3. Membuat stateless widget bernama MyHomePage sebagai parent untuk widget-widget pada homepage

```dart
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Shopping List',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.indigo,
          ),
          body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Set padding dari halaman
              child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                      'PBP Shop', // Text yang menandakan toko
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Grid layout
                  GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ShopItem item) {
                      // Iterasi untuk setiap item
                      return ShopCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
    }
}
```

4. Menambahkan list item ShopItem pada class MyHomePage

```dart
  final List<ShopItem> items = [
    ShopItem("Lihat Produk", Icons.checklist, Colors.purple),
    ShopItem("Tambah Produk", Icons.add_shopping_cart, Colors.red),
    ShopItem("Logout", Icons.logout, Colors.green),
  ];
```

5. Membuat stateless widget berupa ShopCard untuk mem-build ShopItem dan menambahkan style-style pada ShopItem

```dart
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

6. Pada file ```main.dart```, import file ```menu.dart ``` dengan kode

```dart
import 'package:ngoppish_mobile/menu.dart';
```

7. Menambahkan fungsi main sebagai tempat fungsi memulai aplikasi

```dart
void main() {
  runApp(const MyApp());
}
```

Fungsi ini me-run widget MyApp yang merupakan widget aplikasi utama.

8. Membuat class MyApp

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}
```

Widget MyApp ini memanggil MyHomePage() yang ada di file ```menu.dart``` agar MyHomePage menjadi child dari MyApp.

<hr>
<hr>

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!


##  Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!


## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!


## Bagaimana penerapan clean architecture pada aplikasi Flutter?

Penerapan clean architecture adalah pada saat tiap-tiap widget class yang kita buat pada aplikasi flutter kita memiliki file terpisah. Dengan ini, kita dapat memiliki file yang khusus untuk menampilkan widget dan memiliki file yang khusus untuk membuat class widget tersebut.


## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

