import 'package:flutter/material.dart';
import 'package:movie_app/presentation/responsive/constants.dart';
import 'package:movie_app/presentation/responsive/main_menu_screen/widgets/film_card.dart';

class MenuDesktopBody extends StatelessWidget {
  MenuDesktopBody({super.key});

  final List<PosterModel> posters = [
    PosterModel(
      poster: 'assets/spiderman.png',
      title: 'Spiderman: No Way Home',
    ),
    PosterModel(poster: 'assets/eternals.png', title: 'Eternals'),
    PosterModel(
      poster: 'assets/shang.png',
      title: 'Shang - Chi And The Legend Of The Ten Rings',
    ),
    PosterModel(
      poster: 'assets/venom.png',
      title: 'Venom: Let There Be Carnage',
    ),
    PosterModel(
      poster: 'assets/spiderman.png',
      title: 'Spiderman: No Way Home',
    ),
    PosterModel(poster: 'assets/eternals.png', title: 'Eternals'),
    PosterModel(
      poster: 'assets/shang.png',
      title: 'Shang - Chi And The Legend Of The Ten Rings',
    ),
    PosterModel(
      poster: 'assets/venom.png',
      title: 'Venom: Let There Be Carnage',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'FilmKu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0,
            toolbarHeight: 110,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    'Now Showing',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: 357,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: posters.length,
                    padding: EdgeInsets.only(left: 28),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 164,
                        child: FilmCard(
                          poster: posters[index].poster,
                          title: posters[index].title,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 600,
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            Text(
                              'Most Popular',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Container(
                              width: 61,
                              height: 21,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey,
                                ),
                                color: Colors.white,
                              ),
                              child: Text(
                                'See More',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 16,
                            ),
                            child: filmCard(
                              'assets/venom.png',
                              'Venom: Let There Be Carnage',
                            ),
                          ),
                          filmCard(
                            'assets/kingsman.png',
                            'The King\'s Man',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 16,
                            ),
                      
                            child: filmCard(
                              'assets/spiderman.png',
                              'Spiderman: No Way Home',
                            ),
                          ),
                          filmCard('assets/eternals.png', 'Eternals'),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 16,
                            ),
                            child: filmCard(
                              'assets/shang.png',
                              'Shang - Chi And The Legend Of The...',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row filmCard(String image, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 85,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(7),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 147,
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: rate,
                ),
                Wrap(
                  runSpacing: 8,
                  children: [
                    filmType('HORROR'),
                    filmType('MYSTERY'),
                    filmType('THRILLER'),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 4,
                  children: [
                    Icon(Icons.watch_later_outlined, size: 12),
                    Text('1h 47m', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
