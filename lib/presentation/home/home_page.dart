import 'package:fic6_ecommerce/bloc/checkout/checkout_bloc.dart';
import 'package:fic6_ecommerce/common/global_variables.dart';
import 'package:fic6_ecommerce/presentation/cart/cart_page.dart';
import 'package:fic6_ecommerce/presentation/home/widget/banner_widget.dart';
import 'package:fic6_ecommerce/presentation/home/widget/list_category_widget.dart';
import 'package:fic6_ecommerce/presentation/home/widget/list_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: Colors.purpleAccent),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Container(
                height: 42,
                margin: const EdgeInsets.only(left: 15),
                child: Material(
                  borderRadius: BorderRadius.circular(7),
                  elevation: 1,
                  child: TextFormField(
                    onFieldSubmitted: (_) {},
                    decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 18),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide.none),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17)),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          ListCategoryWidget(),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BannerWidget(),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'List Product',
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(child: ListProductWidget())
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: GlobalVariable.selectedNavBarColor,
        unselectedItemColor: GlobalVariable.unselectedNavBarColor,
        backgroundColor: GlobalVariable.backgroundColor,
        iconSize: 28,
        onTap: (index) {},
        items: [
          //Home
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariable.selectedNavBarColor
                        : GlobalVariable.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 1
                          ? GlobalVariable.selectedNavBarColor
                          : GlobalVariable.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(Icons.person_outline_outlined),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 2
                          ? GlobalVariable.selectedNavBarColor
                          : GlobalVariable.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                    if (state is CheckoutLoaded) {
                      return badges.Badge(
                        badgeStyle: const badges.BadgeStyle(
                            elevation: 0, badgeColor: Colors.white),
                        badgeContent: Text('${state.items.length}'),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const CartPage();
                            }));
                          },
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                          ),
                        ),
                      );
                    }
                    return const badges.Badge(
                      badgeStyle: badges.BadgeStyle(
                          elevation: 0, badgeColor: Colors.white),
                      badgeContent: Text('0'),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                      ),
                    );
                  },
                ),
              ),
              label: '')
        ],
      ),
    );
  }
}
