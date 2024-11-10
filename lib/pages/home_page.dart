import 'package:flut_apps/router.dart';
import 'package:flutter/material.dart';

class HomeOptionMenu {
  final String name;
  final IconData icon;
  final String? url;

  HomeOptionMenu(this.name, this.icon, this.url);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeOptionMenu> optionsMenu = [
      HomeOptionMenu("KYC WITH OCR", Icons.person, RoutesNames.kycWithOcrRoute),
      HomeOptionMenu("Comming Soon", Icons.question_mark, null),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            stretch: true,
            floating: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "WELCOME\nTO FLUTAPPS",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // background: FlutterLogo(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50.0,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 120.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        optionsMenu[index].name,
                        style: Theme.of(context).textTheme.labelMedium,
                        textScaler: const TextScaler.linear(3.0),
                      ),
                      trailing: IconButton(
                        onPressed: optionsMenu[index].url == null
                            ? null
                            : () => Navigator.pushNamed(
                                context, optionsMenu[index].url!),
                        icon: const Icon(
                          Icons.arrow_circle_right,
                          size: 48,
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: optionsMenu.length,
            ),
          ),
        ],
      ),
    );
  }
}
