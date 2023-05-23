// ignore_for_file: sized_box_for_whitespace

import 'dart:html';
import 'dart:js';

import 'package:beerapis/screens/beer_per_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<BeerInfo> beerInfoList;
  Future<List<BeerInfo>> apicall() async {
    var response = await http
        .get(Uri.parse('https://api.punkapi.com/v2/beers?page=1&per_page=30'));
    if (response.statusCode == 200) {
      beerInfoList = beerInfoFromJson(response.body);
      return beerInfoList;
    }
    return beerInfoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 40,
              ),
              Icon(
                Icons.contact_page,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Time to Cheers!Choose your drink..',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: apicall(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: beerInfoList.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                        mainAxisExtent: 370,
                        // childAspectRatio: 0.6,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        return getBeer(
                            beerInfoList: beerInfoList[index],
                            buildContext: context);
                      },
                    );
                  } else
                    return Center(child: CircularProgressIndicator());
                },
              ),
            ]),
          ),
        ));
  }
}

Widget getBeer(
    {required BeerInfo beerInfoList, required BuildContext buildContext}) {
  return InkWell(
    onTap: () {
      Navigator.push(buildContext, MaterialPageRoute(
        builder: (context) {
          return Beerperpage(
            beerperpage: beerInfoList,
          );
        },
      ));
    },
    child: Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(alignment: Alignment.center, children: [
          Container(
              height: 225,
              // color: Colors.white,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child:
                  Image.asset('asset/images/beer1.jpg', fit: BoxFit.fitWidth)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 100,
                  child:
                      Image.network(beerInfoList.imageUrl, fit: BoxFit.cover)),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.black,
                  ),
                  child: Text(
                    "First Brewed:${beerInfoList.firstBrewed}",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )),
            ],
          )
        ]),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  beerInfoList.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  beerInfoList.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("ABV\n${beerInfoList.abv}"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("IBU\n${beerInfoList.ibu}"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    ),
  );
}
