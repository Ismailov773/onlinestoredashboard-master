import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onlinestoredashboard/pages/catalogs/catalog_page.dart';
import 'package:onlinestoredashboard/pages/catalogs/product_page.dart';

import '../generated/l10n.dart';
import '../models/UiO.dart';
import '../pages/organization_page.dart';

enum Menu { Department, Menegers, News, Vacansy }

class OnlineAppBar extends StatelessWidget with PreferredSizeWidget {
  const OnlineAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Add AppBar here only
      backgroundColor: Colors.black,
      elevation: 0.0,
      actions: [
        Container(
            alignment: Alignment.center,
            child: PopupMenuButton<Menu>(
                position: PopupMenuPosition.under,
                elevation: 5,
                offset: const Offset(0, 30),
                child: Text(
                  "Справочники",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                      PopupMenuItem(
                        child: TextButton(
                            onPressed: () {
                              // Get.offAll(OrderPage());
                              Get.to(() => OrganizationPage());
                            },
                            child: Text(
                              S.of(context).organization,
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                      PopupMenuItem(
                        child: TextButton(
                            onPressed: () {
                              // Get.offAll(OrderPage());
                              Get.to(() => CatalogPage());
                            },
                            child: Text(
                              S.of(context).catalog,
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                      PopupMenuItem(
                        child: TextButton(
                            onPressed: () {
                              // Get.offAll(OrderPage());
                              Get.to(() => ProductPage());
                            },
                            child: Text(
                              S.of(context).product_page_name,
                              style: TextStyle(fontSize: 20),
                            )),
                      )
                    ])),
      ],

      title: Text(
        UiO.companyName,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
