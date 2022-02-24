import 'package:flutter/material.dart';
import 'package:travel_app/main_screen.dart';
import 'package:travel_app/model/tourism_place.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Staycation',
      theme: ThemeData(),
      debugShowCheckedModeBanner: (false),
      home: MainScreen(),
    );
  }
}

class DetailScreen extends StatelessWidget {
  late final TourismPlace placedetail;
  DetailScreen({required this.placedetail});
  var fontOxygen = const TextStyle(fontFamily: 'Oxygen');
  var fontStaatliches = const TextStyle(fontFamily: 'Staatliches');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //mengikuti setiap status bar di setiap device
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(placedetail.imageAsset,width: 200,height: 300),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,

                          ),
                          IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),
                  ),
                        ],
                      ),
                    ),
                  ),
                  FavButton(
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: Text(
                    placedetail.name,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30.0,fontFamily: 'Staatliches'),
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8),
                        Text(placedetail.openDays,style: fontStaatliches),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.timer),
                        SizedBox(height: 8),
                        Text(placedetail.openTimes),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.monetization_on),
                        SizedBox(height: 8),
                        Text(placedetail.ticketPrice),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Text(
                  placedetail.description,
                  textAlign: TextAlign.center,
                  style: fontOxygen,
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: placedetail.imageUrls.map((urlgambar){
                    return Padding(padding: EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(urlgambar),
                    ),
                    );
                  }).toList()
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class FavButton extends StatefulWidget {
  const FavButton({Key? key}) : super(key: key);

  @override
  _FavButtonState createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon (isFavorite? Icons.favorite : Icons.favorite_border,color: Colors.red,),
        onPressed: (){
      setState(() {
      isFavorite = !isFavorite;
    });}
    );
  }
}

