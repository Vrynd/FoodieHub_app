import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/components/favorite_icon.dart';
import 'package:restaurant_app/data/models/request/detail_request.dart';
import 'package:restaurant_app/data/models/request/request.dart';
import 'package:restaurant_app/provider/expand_description_provider.dart';

class DetailItems extends StatelessWidget {
  final RestaurantDetail restaurantDetail;
  const DetailItems({super.key, required this.restaurantDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.0),
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      restaurantDetail.name,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ),

                  // ini icon favoritenya
                  FavoriteIconButton(
                    restaurantList: RestaurantList(
                      id: restaurantDetail.id,
                      name: restaurantDetail.name,
                      city: restaurantDetail.city,
                      pictureId: restaurantDetail.pictureId,
                      rating: restaurantDetail.rating,
                      description: restaurantDetail.description,
                    ),
                  ),
                ],
              ),
              const SizedBox.square(dimension: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_city_outlined,
                    size: 24,
                    color: Colors.grey,
                  ),
                  const SizedBox.square(dimension: 6),
                  Text(
                    restaurantDetail.city,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox.square(dimension: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_on_outlined, size: 24, color: Colors.red),
                  const SizedBox.square(dimension: 6),
                  Text(
                    restaurantDetail.address,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox.square(dimension: 14),
              Consumer<ExpandDescriptionProvider>(
                builder: (context, provider, _) {
                  final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  );
                  return LayoutBuilder(
                    builder: (context, size) {
                      final span = TextSpan(
                        text: restaurantDetail.description,
                        style: style,
                      );
                      final tp = TextPainter(
                        text: span,
                        maxLines: 3,
                        textDirection: TextDirection.ltr,
                      )..layout(maxWidth: size.maxWidth);
                      final didExceed = tp.didExceedMaxLines;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedSize(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            child: ConstrainedBox(
                              constraints: provider.isExpand
                                  ? const BoxConstraints()
                                  : BoxConstraints(maxHeight: tp.height),
                              child: Text(
                                restaurantDetail.description,
                                style: style,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                          if (didExceed) const SizedBox(height: 8),
                          if (didExceed)
                            TextButton.icon(
                              onPressed: provider.toggleExpand,
                              icon: Icon(
                                provider.isExpand
                                    ? Icons.expand_less_rounded
                                    : Icons.expand_more_rounded,
                              ),
                              label: Text(
                                provider.isExpand
                                    ? "Less More"
                                    : "Read More",
                              ),
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
