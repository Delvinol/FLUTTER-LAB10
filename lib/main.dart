import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menú'),
        ),
        body: ObjectListView(),
      ),
    );
  }
}

class Object {
  final String name;
  final String info;
  final String image;
  final String category;

  Object({required this.name, required this.info, required this.image, required this.category});
}

List<Object> objectList = [
  Object(
    name: "Ajiaco", 
    info: "Platillo de los andes colombianos",
    image: "https://mojo.generalmills.com/api/public/content/lWuocevZmkK6Iq3JG_OZUw_gmi_hi_res_jpeg.jpeg?v=c23ac952&t=16e3ce250f244648bef28c5949fb99ff",
    category: "dish"
  ),
  Object(
    name: "Arepa de Choclo", 
    info: "Platillo de Venezuela",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFtRY2xJ63FaHgWcpWMGH5M47GZdGQR6OV7uK7uF0NQ&s",
    category: "dish"
  ),
  Object(
    name: "Jaguar", 
    info: "El jaguar también se conoce como otorongo",
    image: "assets/images/jaguar.JPG",
    category: "animal"
  ),
  Object(
    name: "Caniche", 
    info: "El caniche es un perro blanco y peludo",
    image: "assets/images/caniche.jpg",
    category: "animal"
  ),
  Object(
    name: "Paracas", 
    info: "Paracas es un lugar limeño",
    image: "assets/images/paracas.jpg",
    category: "place"
  ),
  Object(
    name: "Bera", 
    info: "Berna es la capital de Suiza",
    image: "assets/images/berna.jpg",
    category: "place"
  ),
];

class ObjectListView extends StatelessWidget {
  TextStyle getTextStyle(String category) {
    switch (category) {
      case 'dish':
        return TextStyle(fontFamily: 'OpenSans', fontSize: 18, fontWeight: FontWeight.bold);
      case 'place':
        return TextStyle(fontFamily: 'Ubuntu', fontSize: 18);
      case 'animal':
        return TextStyle(fontFamily: 'Lato', fontSize: 18, fontStyle: FontStyle.italic);
      default:
        return TextStyle(fontSize: 18);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: objectList.length,
      itemBuilder: (context, index) {
        final object = objectList[index];
        return Card(
          child: ListTile(
            leading: Image.network(
              object.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(
              object.name,
              style: getTextStyle(object.category),
            ),
            subtitle: Text(
              object.info,
              style: getTextStyle(object.category),
            ),
          ),
        );
      },
    );
  }
}
