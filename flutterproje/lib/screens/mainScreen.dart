import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/menuItem.dart';

class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("Menu"),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[700], // Arka plan rengi burada değiştirildi
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/profile");
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.5),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Sola hizalama eklendi
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 224, 209, 209),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color.fromARGB(179, 128, 8, 8),
                              ),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/dr.jpg'),
                                radius: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(children: [
                  Divider(),
                  MenuItem(
                      title: "Ana Ekran",
                      icon: Icon(
                        Icons.home,
                        size: 60,
                      ),
                      onTap: () {}),
                  MenuItem(
                      title: "Favoriler",
                      icon: Icon(
                        Icons.favorite,
                        size: 60,
                      ),
                      onTap: () {}),
                  MenuItem(
                      title: "Ekstra",
                      icon: Icon(
                        Icons.info,
                        size: 60,
                      ),
                      onTap: () {}),
                  Divider(),
                  MenuItem(
                    title: "İletişim",
                    icon: Icon(
                      Icons.contact_page,
                      size: 60,
                    ),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/iletisim', (route) => false);
                    },
                  ),
                  MenuItem(
                      title: "Ayarlar",
                      icon: Icon(Icons.settings, size: 60),
                      onTap: () {}),
                  Divider(),
                  MenuItem(
                    icon: Icon(Icons.logout, size: 60),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/welcome', (route) => false);
                    },
                    title: "Çıkış",
                  ),
                ]),
              ),
              Text("Version 0.2",
                  style: TextStyle(color: Colors.grey, fontSize: 15)),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[900],
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMovieSection(
                'Popüler Filmler',
                [
                  _buildMovieCard(
                    'Fight Club',
                    'https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'The Dark Knight',
                    'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Inglourious Basterds',
                    'https://m.media-amazon.com/images/M/MV5BOTJiNDEzOWYtMTVjOC00ZjlmLWE0NGMtZmE1OWVmZDQ2OWJhXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'The Prestige',
                    'https://m.media-amazon.com/images/M/MV5BZGQ3MTAyYzAtZjVkMy00MDM0LTg1ZTQtNWU5MmVlZjIwZmVlXkEyXkFqcGdeQXVyNzU3Nzk4MDQ@._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'Watchmen',
                    'https://m.media-amazon.com/images/M/MV5BY2IzNGNiODgtOWYzOS00OTI0LTgxZTUtOTA5OTQ5YmI3NGUzXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'Kingdom Of Heaven',
                    'https://m.media-amazon.com/images/M/MV5BMjZiNWRkZWMtMjE2Yy00OWJlLWFjZTItNmMyOTVjNDYyNmQxL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'Spider Man 2',
                    'https://m.media-amazon.com/images/M/MV5BMzY2ODk4NmUtOTVmNi00ZTdkLTlmOWYtMmE2OWVhNTU2OTVkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Pulp Fiction',
                    'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Blade Runner (1982)',
                    'https://m.media-amazon.com/images/M/MV5BNzQzMzJhZTEtOWM4NS00MTdhLTg0YjgtMjM4MDRkZjUwZDBlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Seven Samurai',
                    'https://m.media-amazon.com/images/M/MV5BOGNiY2QzOTAtOWNlZC00NjAwLWFmMTAtNTJhYTBiNTY4ODU0XkEyXkFqcGdeQXVyMTQyMTMwOTk0._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'Se7en',
                    'https://m.media-amazon.com/images/M/MV5BZDgyZmY5MmItY2I3Ny00NjA4LWFhNmItMGQ4ZGJhZDk5YjU3XkEyXkFqcGdeQXVyMTAzMDM4MjM0._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'OldBoy',
                    'https://m.media-amazon.com/images/M/MV5BMTI3NTQyMzU5M15BMl5BanBnXkFtZTcwMTM2MjgyMQ@@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Dune',
                    'https://m.media-amazon.com/images/M/MV5BN2FjNmEyNWMtYzM0ZS00NjIyLTg5YzYtYThlMGVjNzE1OGViXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Uncut Gems',
                    'https://m.media-amazon.com/images/M/MV5BZDhkMjUyYjItYWVkYi00YTM5LWE4MGEtY2FlMjA3OThlYmZhXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'Babam ve Oğlum',
                    'https://m.media-amazon.com/images/M/MV5BNzEzMWYyYjEtNmVjZS00YTAyLWIyOTgtMzEzNzQxMTQzZTgwXkEyXkFqcGdeQXVyMTA0MTM5NjI2._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'Man of Steel',
                    'https://m.media-amazon.com/images/M/MV5BMTk5ODk1NDkxMF5BMl5BanBnXkFtZTcwNTA5OTY0OQ@@._V1_.jpg',
                  ),
                  // Diğer popüler filmler buraya gelecek
                ],
              ),
              _buildMovieSection(
                'Popüler Diziler',
                [
                  _buildMovieCard(
                    'True Dedective',
                    'https://m.media-amazon.com/images/M/MV5BMmRlYmE0Y2UtNDk2Yi00NzczLWEwZTEtZmE2OTcyYzcxYmU5XkEyXkFqcGdeQXVyNTMxMjgxMzA@._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'Breaking Bad',
                    'https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'Spartacus',
                    'https://m.media-amazon.com/images/M/MV5BZWQ4MjA2YzEtOTQzYi00NWQ1LWI0ZDEtN2VkZjhmYTc3MzU0XkEyXkFqcGdeQXVyNDIzMzcwNjc@._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'Game of Thrones',
                    'https://m.media-amazon.com/images/M/MV5BN2IzYzBiOTQtNGZmMi00NDI5LTgxMzMtN2EzZjA1NjhlOGMxXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'OZ',
                    'https://m.media-amazon.com/images/M/MV5BYjY3N2M2YjgtZTFjZS00ODA1LWJjMDgtNDgxZDllZWFiMmYyXkEyXkFqcGdeQXVyNDIzMzcwNjc@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Better Call Saul',
                    'https://m.media-amazon.com/images/M/MV5BZDA4YmE0OTYtMmRmNS00Mzk2LTlhM2MtNjk4NzBjZGE1MmIyXkEyXkFqcGdeQXVyMTMzNDExODE5._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'Vikings',
                    'https://m.media-amazon.com/images/M/MV5BZWNlZmNiNzItYWMwNC00ODYxLThlNjYtMjU3NzlmNDQxMTY2XkEyXkFqcGdeQXVyMTA3MzQ4MTc0._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Westworld',
                    'https://m.media-amazon.com/images/M/MV5BZDg1OWRiMTktZDdiNy00NTZlLTg2Y2EtNWRiMTcxMGE5YTUxXkEyXkFqcGdeQXVyMTM2MDY0OTYx._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'The Blacklist',
                    'https://m.media-amazon.com/images/M/MV5BNDFkZDI5ZGUtYTdkOC00YTFiLWJjNjMtNTQ3ZjIxMTY2ZjMyXkEyXkFqcGdeQXVyODUxOTU0OTg@._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'The Boys',
                    'https://m.media-amazon.com/images/M/MV5BZGUyNzM0M2EtMjA1Zi00MWJhLWI2ZWEtNzE3OTgyMTBkN2IzXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Mindhunter',
                    'https://m.media-amazon.com/images/M/MV5BNWNmYzQ1ZWUtYTQ3ZS00Y2UwLTlkMDctZThlOTJkMGJiNzBiXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Mr.Robot',
                    'https://m.media-amazon.com/images/M/MV5BM2QyNDIzOGMtNThhNS00NmUwLWI0ZjUtZjdkN2I1OTRjZWQ3XkEyXkFqcGdeQXVyNzQ1ODk3MTQ@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Black Mirror',
                    'https://m.media-amazon.com/images/M/MV5BZTgyNTBkNzctN2I3NC00NTA1LWJiMDMtYzA2MmYyZjc1NWQzXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Blue Mountain State',
                    'https://m.media-amazon.com/images/M/MV5BMTYyODE5MTUwNV5BMl5BanBnXkFtZTgwMjk2MjM4NzE@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'The Terminal List',
                    'https://m.media-amazon.com/images/M/MV5BNmNkYmZjZDMtNjVmZC00OWVkLWI1MzEtYjI0ZDc2MjExYWY2XkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg',
                  ),
                  // Diğer yakında çıkacak filmler buraya gelecek
                ],
              ),
              _buildMovieSection(
                'Popüler Animeler',
                [
                  _buildMovieCard(
                    'Hunter x Hunter ',
                    'https://m.media-amazon.com/images/M/MV5BNGM0YTk3MWEtN2JlZC00ZmZmLWIwMDktZTMxZGE5Zjc2MGExXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Monster',
                    'https://m.media-amazon.com/images/M/MV5BM2ZkYTAwMGMtOGEwOS00MzBjLTgxOGYtZTYwY2E1ZjMyZmY4XkEyXkFqcGdeQXVyNTgyNTA4MjM@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Cowboy Bebop',
                    'https://m.media-amazon.com/images/M/MV5BZDEzMjlkNDgtZjhkNi00N2RlLWFhZTYtNDE5OTc2NjZkODJlXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Evangelion',
                    'https://m.media-amazon.com/images/M/MV5BMTc4YTY0MDUtYWNmMi00NTRiLWE4NmItM2JiMmIzYmEwNGQzXkEyXkFqcGdeQXVyNTkwNzYyODM@._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'Naruto',
                    'https://m.media-amazon.com/images/M/MV5BZmQ5NGFiNWEtMmMyMC00MDdiLTg4YjktOGY5Yzc2MDUxMTE1XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'FMAB',
                    'https://m.media-amazon.com/images/M/MV5BZmEzN2YzOTItMDI5MS00MGU4LWI1NWQtOTg5ZThhNGQwYTEzXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'LOGH',
                    'https://m.media-amazon.com/images/M/MV5BMDg2MGY1OGYtN2E2Zi00OTA4LTllYjAtMTQ5MWYzYjFiMmFjXkEyXkFqcGdeQXVyNTI4NzA1OTk@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Hajime no Ippo',
                    'https://m.media-amazon.com/images/M/MV5BNmFkNWQ2ZGQtNGY2NS00ZWM3LWEwZDEtZDMwODhjODI1ZmUxXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'Vinland Saga',
                    'https://m.media-amazon.com/images/M/MV5BNzQwODI4Y2YtNjFmNC00NTExLWE0NzYtMTUzNjA0YzBhY2YyXkEyXkFqcGdeQXVyMTMxMTYzNDkz._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'One Outs',
                    'https://m.media-amazon.com/images/M/MV5BYTY2N2NjYTctZmY3Mi00MTQxLWI2NmItMTUxZDM3ODk2OWExXkEyXkFqcGdeQXVyNjQwNzI5MDA@._V1_.jpg',
                  ),
                  _buildMovieCard(
                    'Ashita no Joe',
                    'https://m.media-amazon.com/images/M/MV5BN2U1ZmM3ZjYtZWZkMi00ZGYwLTgwODQtODRjZDY2YTQ4YjgxXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Berserk',
                    'https://m.media-amazon.com/images/M/MV5BYmJmMzAzNWItMmMyZi00ZjYzLWJjZmItYmFlMzUzZTRjNWRhXkEyXkFqcGdeQXVyNTgyNTA4MjM@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Steins Gate',
                    'https://m.media-amazon.com/images/M/MV5BMjUxMzE4ZDctODNjMS00MzIwLThjNDktODkwYjc5YWU0MDc0XkEyXkFqcGdeQXVyNjc3OTE4Nzk@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Kiseijuu',
                    'https://m.media-amazon.com/images/M/MV5BZTViMTZlMjgtNjVmZC00NjEzLWJlN2QtMjQ4ZTYxNzBiZmMyXkEyXkFqcGdeQXVyNjc2NjA5MTU@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'Made in Abyss',
                    'https://m.media-amazon.com/images/M/MV5BYWY3MTliMWYtMmQ1Zi00NDE0LTkzYmUtZDI4MDM1MTgwZTc4XkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'JoJo',
                    'https://m.media-amazon.com/images/M/MV5BZDc3NGQ3ZWQtYjNkOC00MjhiLTg2N2YtNmZlOGNiZTFkOWNhXkEyXkFqcGdeQXVyNjc2NjA5MTU@._V1_FMjpg_UX1000_.jpg',
                  ),
                  _buildMovieCard(
                    'GTO ',
                    'https://m.media-amazon.com/images/M/MV5BYzVmNmM0N2EtNTA3MS00NjE5LWFhMDMtMjZhZjlmMjE3OTUyXkEyXkFqcGdeQXVyMTA0MTM5NjI2._V1_FMjpg_UX1000_.jpg',
                  ),
                  // Diğer eski filmler buraya gelecek
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieSection(String sectionTitle, List<Widget> movies) {
    return Column(
      children: [
        if (sectionTitle.isNotEmpty)
          Container(
            color: Colors.grey[900],
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Text(sectionTitle,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                )),
          ),
        SizedBox(height: 0),
        Container(
          height: 270,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: movies,
          ),
        ),
      ],
    );
  }

  Widget _buildMovieCard(String movieTitle, String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(
            imageUrl,
            height: 500,
          ),
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.5).withOpacity(0.2),
            padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
            child: Text(
              movieTitle,
              style: TextStyle(
                color: Color.fromARGB(0, 253, 253, 253).withOpacity(1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    blurRadius: 10,
                    offset: Offset(1, 1),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
