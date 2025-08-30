import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurant_app/components/app_bar.dart';
import 'package:restaurant_app/components/list_items.dart';
import 'package:restaurant_app/provider/favorite_provider.dart';
import 'package:restaurant_app/routes/app_route.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      appBar: AppBarTemplate(
        title: Text(
          'Favorite',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, value, child) {
          final favoriteList = value.favorites;
          return favoriteList.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 16,
                  ),
                  itemCount: favoriteList.length,
                  itemBuilder: (context, index) {
                    final restoFav = favoriteList[index];
                    return ListItems(
                      restaurant: restoFav,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          NavigationRoute.detailRoute.name,
                          arguments: restoFav.id,
                        );
                      },
                    );
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 80,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "No favorite yet",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
