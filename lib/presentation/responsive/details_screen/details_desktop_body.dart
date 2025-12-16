import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/presentation/responsive/constants.dart';
import 'package:movie_app/presentation/responsive/main_menu_screen/widgets/film_card.dart';

class DetailsDesktopBody extends StatefulWidget {
  const DetailsDesktopBody({super.key});

  @override
  State<DetailsDesktopBody> createState() => _DetailsDesktopBodyState();
}

class _DetailsDesktopBodyState extends State<DetailsDesktopBody> {
  List<PosterModel> cast = [
    PosterModel(poster: 'assets/cast/tom.png', title: 'Tom Holland'),
    PosterModel(poster: 'assets/cast/zendaya.png', title: 'Zendaya'),
    PosterModel(
      poster: 'assets/cast/benedict.png',
      title: 'Benedict Cumberbat',
    ),
    PosterModel(poster: 'assets/cast/jacon.png', title: 'Jacon Batalon'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/trailer.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.play_circle,
                              color: Colors.white,
                              size: 65,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Play Trailer',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: MediaQuery.of(context).size.height * 0.28,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            'Spiderman: No Way Home',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 16),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 4,
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC319),
                                size: 16,
                              ),
                              Text(
                                '9.1/10 IMDb',
                                style: TextStyle(
                                  color: Color(0xFF9C9C9C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Wrap(
                          runSpacing: 8,
                          children: [
                            filmType('ACTION'),
                            filmType('ADVANTURE'),
                            filmType('FANTASY'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 24),
                          child: Wrap(
                            spacing: 54,
                            children: [
                              description('Lenght', '2h 28min'),
                              description('Language', 'English'),
                              description('Rating', 'PG-13'),
                            ],
                          ),
                        ),
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 24),
                          child: SizedBox(
                            width: 430,
                            child: Text(
                              'With Spider-Man\'s identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF9C9C9C),
                                height: 1.8,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              Text(
                                'Cast',
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
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: cast.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  castView(cast[index].poster, cast[index].title),
                                  const SizedBox(width: 14),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column castView(String image, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 78,
          height: 78,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(width: 80, child: Text(name, style: TextStyle(fontSize: 12))),
      ],
    );
  }

  Column description(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 12, color: Color(0xFF9C9C9C))),
        Text(
          description,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}