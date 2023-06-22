import 'package:flutter/material.dart';
import 'package:hashtag/screens/views/home_view.dart';
import 'package:hashtag/screens/views/list_hashtag_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _currentIndex);
  }

  void _modal(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'HashTags Creator',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Enter your hashtag"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'.toUpperCase())),
                      TextButton(
                          onPressed: () {}, child: Text('Add'.toUpperCase())),
                    ],
                  )
                ],
              ))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
        children: const <Widget>[HomeView(), ListHashtagView()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _modal(context),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _pageController.jumpToPage(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Hashtags")
          ]),
    );
  }
}
