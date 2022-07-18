import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_test_mob/providers/cats_provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String search = "" ;
  List cats = [];
  

  @override
  Widget build(BuildContext context) {
    final catProvider = Provider.of<CatsProvider>(context);
    Widget catItem = ListView.builder(
                itemCount: cats.length,
                itemBuilder: (_, index){
                
                return  itemCat(
                 cat: cats[index]);
              });
    
    if (cats.length==0) {
      catItem = const Padding(
        padding:  EdgeInsets.all(10.0),
        child:  Text("Presiona el icono de busqueda para consultar los gatitos"),
      );
    }
    
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding:  EdgeInsets.all(10.0),
            child: Text("Catbreeds"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: TextField(
              autofocus:  true,
              decoration: InputDecoration(
                hintText: "Search",
                suffixIcon: IconButton(onPressed: (){
                
                  catProvider.getCatsFilters(search);
                  cats = catProvider.catsFilter;
                  setState(() {
                    
                  });
                }, icon: const Icon(Icons.search))
              ),
              onChanged: (value) {
                search = value;
              }
              
            ),
          ),
          Expanded(
            child: catItem,
          ),
        ],
      ),
    );
  }
}

class itemCat extends StatelessWidget {
  final cat;
 
  const itemCat({
    Key? key, this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Card(
          borderOnForeground: true,
          margin: const EdgeInsets.symmetric(horizontal: 20) ,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                      Text(cat.name),
                    TextButton(
                      onPressed: ()=> Navigator.pushNamed(context, 'detail', arguments: cat ),
                      child: const Text("Ver Más"))
                    ],
                ),
              ),
                SizedBox(
                width: 300,
                height: 300,
                child:
                  Image(image: NetworkImage(cat.image.url)) ,
                  
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cat.origin),
                    Text('Intelligence ${cat.intelligence.toString()}')
                    ],
                ),
              ),
            
            ],
          ),
        ),
        const SizedBox(height: 15,)
      ],
    );
  }
}