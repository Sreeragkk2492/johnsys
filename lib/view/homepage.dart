import 'package:flutter/material.dart';
import 'package:johnsys/controller/apihelper.dart';
import 'package:johnsys/controller/counter.dart';
import 'package:johnsys/model/johnsys.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Johnsys>> johnsysproducts;

  @override
  void initState() {
    johnsysproducts = ApiHelper.fetchproduct();

    super.initState();
  }

  List<Johnsys> Productslist = [];

  // void readproduct()async{
  //  var products=await ApiHelper.fetchproduct();
  //  if(products!=null){
  //   Productslist =products;
  //  }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          centerTitle: true,
        ),
        body: Consumer<CounterProvider>(
          builder: (context, value, child) {
            return FutureBuilder<List<Johnsys>>(
                future: johnsysproducts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  // if(snapshot.hasError){
                  //   return Text()
                  // }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (snapshot.hasData) {
                    List<Johnsys> products = snapshot.data! as List<Johnsys>;
                    return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Container(
                                height: 250,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            products[index].imgUrl!),
                                        fit: BoxFit.cover)),
                              ),
                              title: Text(products[index].itemName!),
                              subtitle: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(products[index].mrp.toString()),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(products[index].discRate.toString()),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(products[index].total.toString()) 
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      width: 30,
                                      child: IconButton(
                                          onPressed: () {
                                            value.increment(products[index]);
                                          },
                                          icon: Icon(Icons.add))),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(products[index].count.toString()),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 30,
                                    child: IconButton(
                                        onPressed: () {
                                          value.decrement(products[index]);
                                        },
                                        icon: Icon(Icons.minimize)),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return Center();

                  // body:   ListView.builder(
                  //     itemCount: Productslist.length,
                  //     itemBuilder: (context,index)=>ListTile(
                  //       title: Text(produ),
                  //     ))
                });
          },
        ));
  }
}
