import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp ({super.key});

  static const showCard = true;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Center(child: showCard ? _buildCard() : _buildStack()),
      ),
    );
  }
  Widget _buildCard(){
    return SizedBox(
      height:210,
      child: Card(
        child:Column(
          children: [
            ListTile(
              title: const Text(
                '1625 Main Street',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: const Text('My City, CA 99984'),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                '(408) 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStack(){
    return Stack(
      alignment: const Alignment(0.6,0.6),
      children:[
        const CircleAvatar(
          backgroundImage: AssetImage('images/pic0.jpg'),
          radius: 100,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
          child:const Text(
            'Mia B',
            style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}