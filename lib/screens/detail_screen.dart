import 'package:flutter/material.dart';
import 'package:tecnical_test_mob/models/cat_model.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    final CatModel cat = ModalRoute.of(context)?.settings.arguments as CatModel;
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
        onPressed: () => Navigator.pop(context) , icon: const Icon(Icons.arrow_back_ios, color: Colors.black,)),
        backgroundColor: Colors.white,
        title: Text(cat.name, textAlign: TextAlign.center, style: const TextStyle(color:   Colors.black),),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0.0,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            leading: Container(),
            pinned: true,
            floating: false,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background:Image(image: NetworkImage(cat.image!.url), height: 300) ,
            ),),
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 10),
                Text(cat.description, 
                textAlign: TextAlign.justify,),
                const SizedBox(height: 10),
                Text('Country: ${cat.origin}'),
                const SizedBox(height: 10),
                Text('Intelligence: ${cat.intelligence.toString()}'),
                const SizedBox(height: 10),
                Text('Adaptability: ${cat.adaptability.toString()}'),
              ]))
        ],
      )
      
   );
  }
}