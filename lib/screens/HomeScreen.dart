import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/around_saudi_data.dart';
import '../models/around_saudi_model.dart';
import 'details_screen.dart';


 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
   
  List<AroundSaudiModel> placesList = [];


   
  void getData() {
    for (var item in aroundSaudiData) {
      AroundSaudiModel placeModel =
          AroundSaudiModel.fromJson(item);

      placesList.add(placeModel);
    }
  }


   
  @override
  void initState() {
    super.initState();

     
    getData();
  }


   
  Future<void> openGoogleMaps(
    AroundSaudiModel place,
  ) async {
    String searchPlace =
        "${place.name}, ${place.location}, Saudi Arabia";

    Uri googleMapsUrl = Uri.https(
      "www.google.com",
      "/maps/search/",
      {
        "api": "1",
        "query": searchPlace,
      },
    );

    await launchUrl(
      googleMapsUrl,
      mode: LaunchMode.externalApplication,
    );
  }


  @override
  Widget build(BuildContext context) {
     
    double screenWidth =
        MediaQuery.sizeOf(context).width;

     
    double cardHeight;

    if (screenWidth < 400) {
      cardHeight = 350;
    } else {
      cardHeight = 330;
    }

     
    double cardWidth = screenWidth - 32;

     
    double separatorPosition =
        cardWidth * 11 / 21;


    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF7E4C2),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        elevation: 0,

        leading: Padding(
          padding: const EdgeInsets.all(9),

          child: Image.asset(
            "assets/images/around_saudi_logo.png",
            fit: BoxFit.contain,
          ),
        ),

        title: Text(
          "AROUND SAUDI",

          style: GoogleFonts.playfairDisplay(
            color: const Color(0xFFD9B36C),
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),


       
      body: ListView.builder(
        padding: EdgeInsets.zero,

         
        itemCount: placesList.length + 2,

        itemBuilder: (context, index) {
           
          if (index == 0) {
            return buildHeader(screenWidth);
          }

           
          if (index == 1) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),

                  child: Text(
                    "Where will your next stamp be?",

                    style: GoogleFonts.playfairDisplay(
                      color: const Color(0xFF123B32),
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            );
          }

           
          int placeIndex = index - 2;

           
          AroundSaudiModel place =
              placesList[placeIndex];

           
          return buildTicket(
            context: context,
            place: place,
            cardHeight: cardHeight,
            separatorPosition: separatorPosition,
          );
        },
      ),
    );
  }


   
  Widget buildHeader(double screenWidth) {
    return Container(
      width: screenWidth,

      height: screenWidth < 600
          ? screenWidth * 0.90
          : 480,

      padding: const EdgeInsets.fromLTRB(
        20,
        0,
        20,
        25,
      ),

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/saudi_header_landscape_v3.png",
          ),
          fit: BoxFit.cover,
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "Your Saudi Travel Passport",

            style: TextStyle(
              color: Color(0xFFD9B36C),
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            decoration: InputDecoration(
              hintText: "Search destinations...",

              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xFF123B32),
              ),

              filled: true,
              fillColor: const Color(0xFFFFF8EC),

              contentPadding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),

                borderSide: const BorderSide(
                  color: Color(0xFFD9B36C),
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


   
  Widget buildTicket({
    required BuildContext context,

     
    required AroundSaudiModel place,

    required double cardHeight,
    required double separatorPosition,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        0,
        16,
        22,
      ),

      child: SizedBox(
        height: cardHeight,

        child: Stack(
          clipBehavior: Clip.none,

          children: [
            Positioned.fill(
              child: Container(
                clipBehavior: Clip.antiAlias,

                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8EC),

                  borderRadius: BorderRadius.circular(22),

                  border: Border.all(
                    color: const Color(0xFFE7D4B7),
                  ),

                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(
                        35,
                        0,
                        0,
                        0,
                      ),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                     
                    Expanded(
                      flex: 11,

                      child: Padding(
                        padding: const EdgeInsets.all(18),

                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,

                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [
                             
                             
                            Text(
                              place.name!,

                              style:
                                  GoogleFonts.playfairDisplay(
                                color:
                                    const Color(0xFF123B32),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),


                             
                            InkWell(
                              onTap: () {
                                openGoogleMaps(place);
                              },

                              borderRadius:
                                  BorderRadius.circular(8),

                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),

                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color:
                                          Color(0xFFB66A3C),
                                      size: 19,
                                    ),

                                    const SizedBox(width: 5),

                                    Expanded(
                                      child: Text(
                                        place.location!,

                                        style:
                                            const TextStyle(
                                          color:
                                              Color(0xFFB66A3C),
                                          fontSize: 14,

                                          decoration:
                                              TextDecoration
                                                  .underline,

                                          decorationColor:
                                              Color(0xFFB66A3C),
                                        ),
                                      ),
                                    ),

                                    const Icon(
                                      Icons.open_in_new,
                                      color:
                                          Color(0xFFB66A3C),
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),


                             
                            Row(
                              children: [
                                const Icon(
                                  Icons.category_outlined,
                                  color: Color(0xFF123B32),
                                  size: 19,
                                ),

                                const SizedBox(width: 5),

                                Expanded(
                                  child: Text(
                                    place.category!,

                                    style: const TextStyle(
                                      color:
                                          Color(0xFF123B32),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),


                             
                            Container(
                              width: 105,
                              height: 1,
                              color: const Color(0xFFC7AE88),
                            ),


                             
                            Text(
                              place.description!,
                              maxLines: 3,

                              overflow:
                                  TextOverflow.ellipsis,

                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                height: 1.4,
                              ),
                            ),


                             
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,

                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsScreen(
                                       
                                      place: place,
                                    ),
                                  ),
                                );
                              },

                              style:
                                  ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xFF123B32),

                                foregroundColor:
                                    const Color(0xFFFFF8EC),

                                padding:
                                    const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 11,
                                ),
                              ),

                              child: const Text(
                                "Explore",

                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                     
                    Container(
                      width: 1,

                      margin: const EdgeInsets.symmetric(
                        vertical: 18,
                      ),

                      color: const Color(0xFFC7AE88),
                    ),


                     
                    Expanded(
                      flex: 10,

                      child: Image.asset(
                        place.image!,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),


             
            Positioned(
              left: -11,
              top: cardHeight / 2 - 11,

              child: buildTicketHole(22),
            ),


             
            Positioned(
              right: -11,
              top: cardHeight / 2 - 11,

              child: buildTicketHole(22),
            ),


             
            Positioned(
              top: -11,
              left: separatorPosition - 11,

              child: buildTicketHole(22),
            ),


             
            Positioned(
              bottom: -11,
              left: separatorPosition - 11,

              child: buildTicketHole(22),
            ),


             
            Positioned(
              left: separatorPosition - 6,
              top: 28,
              bottom: 28,

              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,

                children: List.generate(
                  6,
                  (index) => buildTicketHole(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


   
  Widget buildTicketHole(double size) {
    return Container(
      width: size,
      height: size,

      decoration: const BoxDecoration(
        color: Color(0xFFF7E4C2),
        shape: BoxShape.circle,
      ),
    );
  }
}