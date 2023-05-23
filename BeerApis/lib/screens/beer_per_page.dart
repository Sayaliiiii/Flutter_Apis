import 'package:beerapis/models/suggestion_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/home_model.dart';

class Beerperpage extends StatefulWidget {
  BeerInfo beerperpage;
  Beerperpage({Key? key, required this.beerperpage}) : super(key: key);

  @override
  State<Beerperpage> createState() => _BeerperpageState();
}

class _BeerperpageState extends State<Beerperpage> {
  List<SuggestionModel> suggestion = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    suggestion.add(SuggestionModel(
        image: 'download', title: 'ABV', value: widget.beerperpage.abv));
    suggestion.add(SuggestionModel(
        image: 'download',
        title: 'Target FG',
        value: widget.beerperpage.targetFg as double));
    suggestion.add(SuggestionModel(
        image: 'download',
        title: 'EBC',
        value: widget.beerperpage.ebc as double));
    suggestion.add(SuggestionModel(
        image: 'download',
        title: 'PH',
        value: widget.beerperpage.ph as double));
    suggestion.add(SuggestionModel(
        image: 'download',
        title: 'IBU',
        value: widget.beerperpage.ibu as double));
    suggestion.add(SuggestionModel(
        image: 'download',
        title: 'Target OG',
        value: widget.beerperpage.targetOg));
    suggestion.add(SuggestionModel(
        image: 'download',
        title: 'SRM',
        value: widget.beerperpage.srm as double));
    suggestion.add(SuggestionModel(
        image: 'download',
        title: 'ATTENTION LEVEL',
        value: widget.beerperpage.attenuationLevel));
  }

  @override
  Widget build(BuildContext context) {
    BeerInfo data = widget.beerperpage;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 350,
                width: double.infinity,
                color: Colors.black,
                child: Stack(clipBehavior: Clip.none, children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 45,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          data.name,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          data.tagline,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -80,
                    left: MediaQuery.of(context).size.width * 0.4,
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width * .2,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                          data.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(data.description),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'First Brewed',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(data.firstBrewed),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Getting know your beer better',
                    style: TextStyle(fontSize: 18)),
              ),
              SizedBox(
                height: 25,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: suggestion.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 230,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 160),
                itemBuilder: (context, index) {
                  return getvalue(model: suggestion[index]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget getvalue({
  required SuggestionModel model,
}) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Image.asset(
            'asset/images/beer1.jpg',
            fit: BoxFit.contain,
            height: 50,
            width: 50,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text('${model.title}:\n${model.value}'),
      ]),
    ),
  );
}
