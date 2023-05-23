import 'package:flutter/material.dart';

import '../models/home_model.dart';

Widget getBeer({
  required BeerInfo beerInfoList,
}) {
  return InkWell(
    onTap: () {},
    child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        color: Colors.lightBlue[50],
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                // color: Colors.white,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child:
                    Image.network(beerInfoList.imageUrl, fit: BoxFit.contain)),
            SizedBox(
              height: 10,
            ),
          ],
        )),
  );
}
