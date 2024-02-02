import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:GeekGather/src/ui/setting/view/setting_page.dart';
import 'package:GeekGather/src/ui/top/view/TopPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'rss reader',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        ),
        home: HomePage(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = TopPage();
        break;
      case 1:
        page = setting_page();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(),
        drawer: SafeArea(
          bottom: false,
          child: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('user name'),
                  accountEmail: Text('email_example@email.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://flutter.salon/wp-content/uploads/2021/11/IMGP7872.jpg'),
                  ),
                ),
                ListTile(
                  title: Text('Home'),
                  selected: selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    _scaffoldKey.currentState!.openEndDrawer();
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  selected: selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                    _scaffoldKey.currentState!.openEndDrawer();
                  },
                ),
              ],
            ),
          ),
        ),
        body: page,
      );
    });
  }
}
