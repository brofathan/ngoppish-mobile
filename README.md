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

<hr>
<hr>

##  Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Bisa, tetapi lebih baik kita membuat model terlebih dahulu karena salah satu alasannya yaitu type safety dimana kita bisa tau lebih dahulu kesalahan pada property yang tidak ada atau penggunaan tipe yang salah.

## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

CookieRequest, berfungsi untuk mengambil cookie pada web. CookieRequest dibagikan ke semua komponen agar state setiap komponen sama.

## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

Data JSON diambil dari endpoint JSON yang sudah dibuat di website django, selanjutnya data response yang didapat di-decode ke JSON. Lalu data tersebut dimasukkan ke list item yang sudah ada di kode flutter setelah itu list tersebut ditampilkan menggunakan FutureBuilder dan ListView.builder

## Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Saat pengguna memasukkan username dan password, data ini kemudian akan disimpan. Lalu, saat user menekan login, flutter melakukan request http POST ke endpoint url yang diberikan yaitu /auth/login/ pada django. Data yang dikirimkan menjadi body dari request http tersebut lalu akan diterima oleh django. Lalu django mengecek apakah data username dan password tersebut sesuai atau sudah tersimpan di database. Jika iya, maka django akan mengirimkan response balik yang berupa sukses melakukan autentikasi.

## Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

Tambahan dari Tugas sebelumnya (Tugas 8):

- FutureBuilder: widget ini berfungsi dalam pemanggilan asinkronus dan menampilkan berdasarkan hasil pemanggilan tersebut.

- AlertDialog: widget ini adalah dialog yang muncul diatas screen.

- ListView: menampilkan produk berbentuk list

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

1. Pada project tugas django, Membuat aplikasi django baru bernama authentication
2. Menginstal django-cors-headers dengan ```pip install django-cors-headers```
3. Menambahkan corsheaders ke INSTALLED_APPS di settings.py di folder project
4. Menambahkan corsheaders.middleware.CorsMiddleware di MIDDLEWARE di settings.py folder project
5. Menambahkan beberapa variabel baru di settings.py foleder project:

```py
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```

6. Membuat method baru di views.py di authentication

```py
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```

7. Menyambungkan method tersebut dengan urls.py baik pada app maupun project

8. Sekarang pada project flutter, menginstall beberapa package:

```
flutter pub add provider
flutter pub add pbp_django_auth
```

9. Membungkus widget MaterialApp pada file main.dart dengan widget Provider, menjadi seperti ini

```dart
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_){
        CookieRequest request = new CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          primarySwatch: Colors.indigo,
        ),
        home: const LoginPage(),
      ),
    );
  }
```

10. Membuat file baru pada folder screens bernama login.dart dan mengisi file tersebut dengan kode:

```dart
import 'package:ngoppish_mobile/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                // Cek kredensial
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
}

```

URL pada request.login adalah URL endpoint JSON pada web django tugas yang sudah dibuat pada step sebelumnya

11. Mengganti properti home pada MaterialApp di main.dart dari MyHomePage menjadi LoginPage agar halaman utama aplikasi adalah login terlebih dahulu.

12. Membuat folder baru di lib bernama models, dan mengisinya dengan file product.dart

13. Membuat website quicktype untuk mengisi konten di product.dart.

Konten dari product.dart merupakan code dart yang berisikan models-models yang ada di JSON pada website django. Isi kode adalah sebagai berikut:

```dart
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int amount;
    String description;

    Fields({
        required this.user,
        required this.name,
        required this.amount,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
    };
}

```

14. Menambahkan package http pada flutter ```flutter pub add http```

15. Menambahkan kode pada ```android/app/src/main/AndroidManifest.xml```

```html
...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
...
```

16. Membuat file baru di lib/screens bernama list_product.dart

17. Mengisi file tersebut dengan kode berikut

```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ngoppish_mobile/models/product.dart';

import 'package:ngoppish_mobile/widgets/left_drawer.dart';

class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Product>> fetchProduct() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'http://127.0.0.1:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Product> list_product = [];
    for (var d in data) {
        if (d != null) {
            list_product.add(Product.fromJson(d));
        }
    }
    return list_product;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            ));
                    }
                }
            }));
    }
}
```