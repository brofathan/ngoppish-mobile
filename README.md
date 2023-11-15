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

Widget Navigator.push() berfungsi untuk menambahkan tampilan route widget pada stack navigator. Yang berarti, tampilan yang sekarang akan ditumpuk dengan tampilan lain. Kalau Navigator.pushReplacement(), berfungsi untuk mengganti tampilan route sekarang dengan route yang baru.


##  Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

Layout widget flutter yang dipakai di tugas ini adalah:

- Container: berfungsi untuk menyimpan widget lainnya jadi lebih terstruktur. Bisa diatur juga margin dan paddingnya.

- Row: berfungsi untuk men-display widget childnya dalam tampilan baris.

- Column: berfungsi untuk men-display widget childnya dalam tampilan kolom.

- SizedBox: kita dapat mengatur ukurang widget sizedbox yang akan berfungsi untuk menambahkan gap antar widget lainnya.

- GridView: berfungsi untuk men-display widget childnya dalam tampilan grid.


## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

Elemen input yang digunakan adalah TextFormField yang berfungsi untuk menampung input dari user berupa string. TextFormField ini memiliki atribut onchanged yang akan dipanggil setiap ada perubahan pada field, lalu ada atribut validator yang berfungsi untuk men-validasi input dari user. Selanjutnya ada elemen ElevatedButton yang disini berfungsi untuk melakukan validasi sekaligus menyimpan data apabila input sudah valid.


## Bagaimana penerapan clean architecture pada aplikasi Flutter?

Penerapan clean architecture adalah pada saat tiap-tiap widget class yang kita buat pada aplikasi flutter kita memiliki file terpisah. Dengan ini, kita dapat memiliki file yang khusus untuk menampilkan widget dan memiliki file yang khusus untuk membuat class widget tersebut.


## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

1. Membuat file baru bernama shoplist_form pada folder baru screens yang berisi widget tampilan form.

2. Mengisi file tersebut dengan kode berikut:

```dart

import 'package:flutter/material.dart';
import 'package:ngoppish_mobile/widgets/left_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {

  final _formKey = GlobalKey<FormState>();
  String? _name;
  int? _amount;
  String? _desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Form Tambah Produk"
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if(value == null || value.isEmpty){
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Jumlah Produk",
                    labelText: "Jumlah Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if(value == null || value.isEmpty){
                      return "Jumlah tidak boleh kosong!";
                    }
                    if(int.tryParse(value) == null){
                      return "Jumlah harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _desc = value!;
                    });
                  },
                  validator: (String? value) {
                    if(value == null || value.isEmpty){
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Jumlah: $_amount'),
                                    Text('Deskripsi: $_desc'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _formKey.currentState!.reset();

                        SharedPreferences prefs = await SharedPreferences.getInstance(); 

                        List<String>? list = prefs.getStringList("item_list1");

                        if(list == null){
                          prefs.setStringList("item_list1", ["$_name", "$_amount", "$_desc"]);
                        }else{
                          prefs.setStringList("item_list1", list + ["$_name", "$_amount", "$_desc"]);
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

- Widget shopformpage adalah statfull widget, karena kita akan menyimpan variabel pada halaman ini.
- Layout pada input form berupa Column yang dibungkus oleh padding agar terlihat rapih.
- Terdapat validator dimana input harus ada, jika input null maka tidak bisa disubmit. Selain itu, pada field jumlah produk harus berupa integer, jika gagal di-parse ke integer maka tidak valid.
- Tombol submit form berupa ElevatedButton yang akan menjalakan fungsi validator pada tiap field input. Jika data-data valid, maka string-string input user akan disimpan di dalam ListData dan list tersebut akan disimpan di session database dari flutter yaitu SharedPreferences.
- Selain itu juga, jika data valid, akan muncul showDialog yang menunjukkan data-data yang berhasil disimpan.


3. Membuat folder baru bernama widget yang nantinya akan menyimpan class-class widget yanag kita buat. Di dalam folder ini, pertama kali buat file bernama left_drawer.dart untuk widget drawer. Isi file dengan kode berikut:

```dart

import 'package:flutter/material.dart';
import 'package:ngoppish_mobile/screens/menu.dart';
import 'package:ngoppish_mobile/screens/shoplist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
           const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  "ngoppish",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "Catat seluruh keperluan belanjamu di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Halaman Utama"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage())
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text("Tambah Produk"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShopFormPage())
              );
            },
          )
        ],
      ),
    );
  }
}

```

- Pada drawer tersebut ada ListTile yang meripakan children dari ListView, yang saat ListTile tersebut dipencet akan mengembalikan fungsi pada atribut ontap. Fungsi pada atribut onTap berupa widget Navigator.push() atau Navigator.pushReplacement() sebagai routing untuk drawer.


4. Menambahkan atribut drawer berisi left_drawer pada tiap widget Scaffold di tiap class di folder screens, agar semua tampilan pada aplikasi memiliki drawer.

5. Membuat file item_list.dart pada folder screens yang berfungsi untuk menampilkan data-data yang disimpan pada list di SharedPreferences. Isi file tersebut adalah berikut:

```dart

import 'package:flutter/material.dart';
import 'package:ngoppish_mobile/widgets/left_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListOfItems extends StatefulWidget {
  const ListOfItems({super.key});

  @override
  State<ListOfItems> createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {

  List<String> itemList = [];

  getItem() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList("item_list1")!;
    return list;
  }

  @override
  void initState() {
    super.initState();

    getItem().then((value) {
      itemList = value!;
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Daftar Produk"
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          for(int i = 0; i < itemList.length; i+=3)
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        const Text("Nama Produk:"),
                        Text(itemList[i])
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        const Text("Jumlah Produk:"),
                        Text(itemList[i+1])
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        const Text("Deskripsi Produk:"),
                        Text(itemList[i+2])
                      ],
                    ),
                    const SizedBox(width: 20,),
                  ],
                ),
              ],
            )
        ],
      ),
    );
  }
}

```

- Method getItem() berfungsi untuk mengembalikan list pada SharedPreferences berupa Future.
- Value list itemList akan di-set state menjadi return getItem() pada fungsi void initState().
- Saat itemList sudah di-set state, maka akan ditampilkan dalam bentuk widget text di widget column menggunakan for loop.