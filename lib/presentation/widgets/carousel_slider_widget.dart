import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/bloc/movie_bloc.dart';
import 'package:movie_db/core/common/func.dart';
import 'package:movie_db/core/util/constants.dart';
import 'package:movie_db/presentation/widgets/custom_rouded_button.dart';
import 'package:shimmer/shimmer.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return CarouselSlider(
          options: CarouselOptions(
            height: 350.0,
            autoPlay: true,
            viewportFraction: 1,
          ),
          items: state.nowPlayingMovies.map((movie) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: Api.getImageUrl(movie.backdropPath),
                      fit: BoxFit.cover,
                      height: 350.0,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                    Positioned(
                      bottom: 24,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          Row(
                            children: [
                              showRelease(movie: movie, context: context),
                              Text(
                                "  |  ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                              Text(
                                movie.voteAverage.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Row(
                            children: [
                              CustomIconButton(
                                border: false,
                                text: 'play',
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomIconButton(
                                  border: true,
                                  icon: Icons.add_rounded,
                                  width: 100,
                                  text: "My List"),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
