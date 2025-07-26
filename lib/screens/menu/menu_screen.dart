import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:resturant_app/core/models/card_item_model.dart';
import 'package:resturant_app/core/utils/app_images.dart';
import 'package:resturant_app/core/utils/app_router.dart';
import 'package:resturant_app/core/utils/app_style.dart';
import 'package:resturant_app/widgets/all_items_list_view.dart';
import 'package:resturant_app/widgets/popular_list_view.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<CardItemModel> items = [
    CardItemModel(image: Assets.imagesPizzaImage, title: "Pizza", price: 12.00),
    CardItemModel(
      image: Assets.imagesBurgerImage,
      title: "Burger",
      price: 15.00,
    ),
    CardItemModel(
      image: Assets.imagesSalmonSushiImage,
      title: "Salmon Sushi",
      price: 15.50,
    ),
    CardItemModel(
      image: Assets.imagesCaesarSaladImage,
      title: "Caesar Salad",
      price: 8.75,
    ),
    CardItemModel(
      image: Assets.imagesPastaCarbonaraImage,
      title: "Pasta Carbonara",
      price: 14.25,
    ),
    CardItemModel(
      image: Assets.imagesChickenTacosImage,
      title: "Chiken Tacos",
      price: 11.50,
    ),
    CardItemModel(
      image: Assets.imagesVegetableCurryImage,
      title: "Vegetable Curry",
      price: 10.99,
    ),
    CardItemModel(
      image: Assets.imagesSteakFritesImage,
      title: "Steak Frites",
      price: 18.00,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List>(
      builder: (context, carditems) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,

            centerTitle: true,
            title: Text(
              "Menu",
              style: AppStyle.styleBold28.copyWith(fontSize: 18),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.go(AppRouter.kCartScreen);
                },
                icon: context.read<CartCubit>().hasCart
                    ? Icon(
                        Icons.add_shopping_cart_outlined,
                        color: Colors.green,
                      )
                    : Icon(Icons.shopping_cart),
              ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: Colors.grey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 100, horizontal: 16),
              child: Column(
                children: [
                  ClipRRect(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.height * 0.1,
                      child: Image.asset(
                        Assets.imagesUserProfile,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();

                      if (context.mounted) {
                        context.go(AppRouter.kLoginScreen);
                      }
                    },
                    child: ListTile(
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.logout, color: Colors.red),
                      ),
                      title: Text("Logout", style: AppStyle.styleMedium16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                // Title: Popular
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Text("Popular", style: AppStyle.styleBold22),
                  ),
                ),

                // Popular Horizontal List
                SliverToBoxAdapter(child: PopularListView(items: items)),

                // Spacer
                SliverToBoxAdapter(child: SizedBox(height: 16)),

                // Title: All Items
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Text("All Items", style: AppStyle.styleBold22),
                  ),
                ),

                // Grid of Items
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: AllItemsListView(items: items),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
