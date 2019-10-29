import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GridView',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Flutter GridView',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarOlahraga = new List();

  var jenis = [
    {
      "nama": "Arum Jeram",
      "detail":
          "Sebenarnya arung jeram adalah jenis olahraga yang menyenangkan untuk dilakukan meskipun lebih banyak dikenal untuk bersenang-senang.",
      "gambar": "arumjeram.jpg"
    },
    {
      "nama": "Badminton",
      "detail":
          "Menjadi salah satu cabang olahraga yang menggunakan raket dan sangat terkenal di seluruh dunia. Permainan ini menggunakan shuttlecock sebagai bola yang harus dipukul menggunakan raket melewati net yang sudah dipasang",
      "gambar": "badminton.jpg"
    },
    {
      "nama": "Panahan",
      "detail":
          "Mungkin jika dilihat sekilas melakukan olahraga panahan ini cukup mudah, tetapi sebenarnya ada berbagai teknik yang harus dipelajari dengan baik. Apalagi anda harus mengarahkan busur panah ke sasaran yang tepat.",
      "gambar": "panahan.jpg"
    },
    {
      "nama": "Anggar",
      "detail":
          "Anggar masuk dalam salah satu jenis olahraga bela diri yang memiliki keunikan tersendiri. Selain pakaian yang digunakan juga ada pedang khusus yang harus dimainkan selama melakukan olahraga ini.",
      "gambar": "anggar.jpg"
    },
    {
      "nama": "Basket",
      "detail":
          "Basket tentu saja sudah menjadi salah satu olahraga paling terkenal di dunia. Salah satu jenis olahraga permainan yang menggunakan bola ini memang dilakukan secara tim dengan berusaha memasukkan bola ke ring lawan sebanyak mungkin.",
      "gambar": "basket.jpg"
    },
    {
      "nama": "Renang",
      "detail":
          "Olahraga air satu ini memang cukup menyenangkan tetapi jika anda tidak menguasai tekniknya maka akan berujung fatal ketika terjadi kram di dalam kolam. Ada berbagai gaya renang yang bisa dicoba dan tentunya memiliki tantangannya sendiri-sendiri.",
      "gambar": "renang.jpg"
    },
    {
      "nama": "Sepak Bola",
      "detail":
          "Olahraga sepak bola ini seakan sudah menjadi jenis olahraga permainan yang bisa menyatukan hingga membuat geger seluruh dunia. Dalam satu tim akan dimainkan oleh 11 orang dan olahraga ini bahkan sudah dimainkan hingga 200 negara serta lebih dari 250 juta orang di seluruh dunia.",
      "gambar": "sepakbola.jpg"
    },
    {
      "nama": "Voli",
      "detail":
          "Olahraga bola voli dimainkan dengan satu tim terdiri dari 6 orang dengan tujuan memukul bola untuk bisa melalui net dan masuk ke area permainan lawan sehingga bisa mencetak angka",
      "gambar": "voli.jpg"
    },
    {
      "nama": "Tenis",
      "detail":
          "Pada dasarnya ada dua jenis olahraga ini yaitu tenis lapangan dan tenis meja namun dengan konsep yang hampir sama. Pemain akan memukul bola menggunakan raket untuk melalui net dan masuk le area permainan lawan.",
      "gambar": "tenis.jpg"
    },
    {
      "nama": "Catur",
      "detail":
          "Catur menjadi olahraga yang tidak banyak bergerak atau mengeluarkan keringat tetapi sangat memeras otak. Olahraga ini memiliki keunikannya sendiri karena anda harus berpikir keras mengalahkan lawan dengan mengambil langkah tepat pada setiap pion yang dijalankan.",
      "gambar": "catur.jpg"
    },
    {
      "nama": "Tinju",
      "detail":
          "Dua orang akan bertemu dalam ring dan berusaha saling mengalahkan dengan teknik tinju yang dimiliki. Kelengkapan dalam olahraga beladiri ini adalah sarung tinju dan pelindung gigi.",
      "gambar": "tinju.jpg"
    },
    {
      "nama": "Bersepeda",
      "detail":
          "Kegiatan bersepeda tentu menjadi salah satu olahraga yang sangat menyenangkan apalagi ini adalah hal yang juga biasanya suka dilakukan saat masih kecil.",
      "gambar": "bersepeda.jpg"
    },
  ];

  _listJenis() async {
    for (var i = 0; i < jenis.length; i++) {
      final jenisnya = jenis[i];
      final String gambar = jenisnya["gambar"];

      daftarOlahraga.add(
        new Container(
          padding: new EdgeInsets.all(3.1),
          child: new Column(
            children: <Widget>[
              new Card(
                child: Hero(
                  tag: jenisnya['nama'],
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return Detail(
                                  nama: jenisnya["nama"],
                                  gambar: gambar,
                                  detail: jenisnya['detail']);
                            },
                          ),
                        );
                      },
                      child: Image.asset(
                        "image/$gambar",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    _listJenis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 4,
        children: daftarOlahraga,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  final String nama;
  final String gambar;
  final String detail;

  Detail({this.nama, this.gambar, this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Olahraga "
          '$nama',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            height: 320.0,
            child: Hero(
              tag: nama,
              child: new Material(
                child: InkWell(
                  child: Image.asset(
                    "image/$gambar",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          BagianNama(
            nama: nama,
          ),
          BagianDetail(detail: detail),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  final String nama;
  BagianNama({this.nama});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      margin: EdgeInsets.only(bottom: 5),
      child: Text(
        "Olahraga "
        '$nama',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}

class BagianDetail extends StatelessWidget {
  final String detail;
  BagianDetail({this.detail});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        '$detail',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
