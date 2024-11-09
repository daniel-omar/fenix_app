import 'package:fenix_app/infrestructure/entities/page_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PageMenu> pagesMenus = [];

  @override
  void initState() {
    super.initState();
    _inicializarPages();
  }

  _inicializarPages() {
    pagesMenus.add(PageMenu(
        nombrePage: "Materiales", rutaPage: "/producto", icon: Icons.bento));
    pagesMenus.add(PageMenu(
        nombrePage: "Materiales", rutaPage: "/producto", icon: Icons.bento));
    pagesMenus.add(PageMenu(
        nombrePage: "Materiales", rutaPage: "/producto", icon: Icons.bento));
    pagesMenus.add(PageMenu(
        nombrePage: "Materiales", rutaPage: "/producto", icon: Icons.bento));
    pagesMenus.add(PageMenu(
        nombrePage: "Materiales", rutaPage: "/producto", icon: Icons.bento));
    pagesMenus.add(PageMenu(
        nombrePage: "Materiales", rutaPage: "/producto", icon: Icons.bento));
    pagesMenus.add(PageMenu(
        nombrePage: "Materiales", rutaPage: "/producto", icon: Icons.bento));
    pagesMenus.add(PageMenu(
        nombrePage: "Materiales", rutaPage: "/producto", icon: Icons.bento));
    pagesMenus.add(PageMenu(
        nombrePage: "Materiales", rutaPage: "/producto", icon: Icons.bento));
    pagesMenus.add(PageMenu(
        nombrePage: "Materiales", rutaPage: "/producto", icon: Icons.bento));
    pagesMenus.add(PageMenu(
        nombrePage: "Materiales", rutaPage: "/producto", icon: Icons.bento));
    pagesMenus.add(PageMenu(
        nombrePage: "Pendientes",
        rutaPage: "/instalacionesPendientes",
        icon: Icons.list_alt));
    pagesMenus.add(PageMenu(
        nombrePage: "Instalaciones finalizadas",
        rutaPage: "/instalacionesFinalizadas",
        icon: Icons.list_alt));
  }

  @override
  Widget build(BuildContext context) {
    Color colorTheme = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTheme,
        title: const Text("Menú principal"),
        actions: [
          IconButton(
            icon: const Icon(Icons.assignment_return_rounded),
            tooltip: 'Cerrar',
            onPressed: () async {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: _crearListado(),
      ),
    );
  }

  _crearListado() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      itemCount: pagesMenus.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 2),
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
      ),
      itemBuilder: (context, index) {
        return _MenuItemCard(pageMenu: pagesMenus[index]);
      },
    );
  }
}

// ignore: unused_element, must_be_immutable
class _MenuItemCard extends StatelessWidget {
  PageMenu pageMenu;

  _MenuItemCard({required this.pageMenu});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color colorTheme = Theme.of(context).secondaryHeaderColor;

    return Card(
      color: colorTheme,
      child: InkWell(
        splashColor: const Color.fromARGB(255, 222, 161, 62),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              pageMenu.icon,
              size: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                textAlign: TextAlign.center,
                pageMenu.nombrePage,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
