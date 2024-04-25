import "package:flutter/material.dart";

import "package:flutter_gen/gen_l10n/local_flutter.dart";
import "package:local_flutter/l10n/provider/languange_change_provider.dart";
import "package:provider/provider.dart";
import 'package:intl/intl.dart';
enum SampleItem { itemOne, itemTwo , itemThree }
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 SampleItem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          Consumer<AppLanguage>(
              builder: (context, provider, child){
                return PopupMenuButton<SampleItem>(
                  initialValue: selectedMenu,
                  // Callback that sets the selected popup menu item.
                  onSelected: (SampleItem item) {

                    if(SampleItem.itemOne.name == item.name){
                      provider.changeLanguage(const Locale('es'));
                    }else if (SampleItem.itemTwo.name == item.name){
                      provider.changeLanguage(const Locale('en'));
                    
                    }
                    else {
                      provider.changeLanguage(const Locale('zh'));
                    }
                    // provider.changeLanguage(const Locale('en'));

                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Spanish'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text('English'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemThree,
                      child: Text('Chiness'),
                    ),
                  ]);
              }
          ),

                  ],
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100,),
            Text(AppLocalizations.of(context)!.login.toString()),
            SizedBox(height: 30,),
            TextFormField(
              decoration:  InputDecoration(
                  hintText: AppLocalizations.of(context)!.email.toString() ,
                enabledBorder: OutlineInputBorder()
              ),
            ),
            const  SizedBox(height: 20,),
            TextFormField(
              decoration:  InputDecoration(
                  hintText: AppLocalizations.of(context)!.password.toString() ,
                  enabledBorder: OutlineInputBorder()
              ),
            ),
            const  SizedBox(height: 50,),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green
              ),

              child: Center(child: Text(AppLocalizations.of(context)!.login.toString())),
            )
          ],
        ),
      ),
    );
    
  }
}
