import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, String> place;

  const DetailsScreen({
    super.key,
    required this.place,
  });

  // فتح موقع الوجهة في Google Maps
  Future<void> openGoogleMaps() async {
    String searchPlace =
        "${place["name"]}, ${place["location"]}, Saudi Arabia";

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

    double imageHeight =
        screenWidth < 600 ? screenWidth * 0.78 : 420.0;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF7E4C2),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,

        leading: Padding(
          padding: const EdgeInsets.all(8),

          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(190, 18, 59, 50),
              shape: BoxShape.circle,
            ),

            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },

              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFFD9B36C),
              ),
            ),
          ),
        ),
      ),

      body: ListView(
        padding: EdgeInsets.zero,

        children: [
          // صورة المكان
          SizedBox(
            width: screenWidth,
            height: imageHeight,

            child: Stack(
              fit: StackFit.expand,

              children: [
                Image.asset(
                  place["image"]!,
                  fit: BoxFit.cover,
                ),

                // تدرج داكن لإظهار النص
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,

                      colors: [
                        Colors.transparent,
                        Color.fromARGB(220, 18, 59, 50),
                      ],
                    ),
                  ),
                ),

                // اسم المكان والموقع
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 50,

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Text(
                        place["name"]!,

                        style:
                            GoogleFonts.playfairDisplay(
                          color: const Color(
                            0xFFFFF8EC,
                          ),
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),

                      const SizedBox(height: 5),

                      // الموقع القابل للضغط
                      InkWell(
                        onTap: openGoogleMaps,

                        borderRadius:
                            BorderRadius.circular(10),

                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 4,
                          ),

                          child: Row(
                            mainAxisSize:
                                MainAxisSize.min,

                            children: [
                              const Icon(
                                Icons.location_on,
                                color:
                                    Color(0xFFD9B36C),
                                size: 20,
                              ),

                              const SizedBox(width: 5),

                              Text(
                                place["location"]!,

                                style:
                                    GoogleFonts.poppins(
                                  color: const Color(
                                    0xFFFFF8EC,
                                  ),
                                  fontSize: 15,
                                  decoration:
                                      TextDecoration
                                          .underline,
                                  decorationColor:
                                      const Color(
                                    0xFFD9B36C,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 6),

                              const Icon(
                                Icons.open_in_new,
                                color:
                                    Color(0xFFD9B36C),
                                size: 15,
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
          ),

          // بطاقة الجواز
          Transform.translate(
            offset: const Offset(0, -30),

            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: Container(
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8EC),

                  borderRadius:
                      BorderRadius.circular(25),

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
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    // عنوان الجواز والطابع
                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [
                              Text(
                                "TRAVEL PASSPORT",

                                style:
                                    GoogleFonts.poppins(
                                  color: const Color(
                                    0xFFB66A3C,
                                  ),
                                  fontSize: 12,
                                  fontWeight:
                                      FontWeight.w600,
                                  letterSpacing: 2,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                place["name"]!,

                                style: GoogleFonts
                                    .playfairDisplay(
                                  color: const Color(
                                    0xFF123B32,
                                  ),
                                  fontSize: 28,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 10),

                        // طابع السفر
                        Transform.rotate(
                          angle: -0.12,

                          child: Container(
                            width: 90,
                            height: 90,
                            padding:
                                const EdgeInsets.all(6),

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              border: Border.all(
                                color: const Color(
                                  0xFFB66A3C,
                                ),
                                width: 2,
                              ),
                            ),

                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,

                                border: Border.all(
                                  color: const Color(
                                    0xFFB66A3C,
                                  ),
                                ),
                              ),

                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,

                                children: [
                                  const Icon(
                                    Icons.flight_takeoff,
                                    color: Color(
                                      0xFFB66A3C,
                                    ),
                                    size: 22,
                                  ),

                                  const SizedBox(height: 3),

                                  Text(
                                    "SAUDI",

                                    style:
                                        GoogleFonts.poppins(
                                      color: const Color(
                                        0xFFB66A3C,
                                      ),
                                      fontSize: 10,
                                      fontWeight:
                                          FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),

                                  Text(
                                    "STAMPED",

                                    style:
                                        GoogleFonts.poppins(
                                      color: const Color(
                                        0xFFB66A3C,
                                      ),
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    Container(
                      height: 1,
                      color: const Color(0xFFE7D4B7),
                    ),

                    const SizedBox(height: 20),

                    // التصنيف
                    buildInformationRow(
                      icon: Icons.category_outlined,
                      title: "Category",
                      value: place["category"]!,
                    ),

                    const SizedBox(height: 16),

                    // أفضل وقت للزيارة
                    buildInformationRow(
                      icon:
                          Icons.calendar_month_outlined,
                      title: "Best time to visit",
                      value: place["bestTime"]!,
                    ),

                    const SizedBox(height: 24),

                    Text(
                      "About this destination",

                      style:
                          GoogleFonts.playfairDisplay(
                        color: const Color(0xFF123B32),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      place["description"]!,

                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 22),

                    // التجربة المقترحة
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                          35,
                          217,
                          179,
                          108,
                        ),

                        borderRadius:
                            BorderRadius.circular(16),
                      ),

                      child: Row(
                        children: [
                          const Icon(
                            Icons.explore_outlined,
                            color: Color(0xFFB66A3C),
                            size: 28,
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                              children: [
                                Text(
                                  "Must-do experience",

                                  style:
                                      GoogleFonts.poppins(
                                    color: const Color(
                                      0xFF123B32,
                                    ),
                                    fontSize: 13,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  place["experience"]!,

                                  style:
                                      GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // زر الرجوع
                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF123B32),

                          foregroundColor:
                              const Color(0xFFFFF8EC),

                          padding:
                              const EdgeInsets.symmetric(
                            vertical: 14,
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(14),
                          ),
                        ),

                        icon: const Icon(
                          Icons.arrow_back,
                        ),

                        label: Text(
                          "Back to destinations",

                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // دالة عرض المعلومات
  Widget buildInformationRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: 43,
          height: 43,

          decoration: const BoxDecoration(
            color: Color.fromARGB(
              35,
              217,
              179,
              108,
            ),
            shape: BoxShape.circle,
          ),

          child: Icon(
            icon,
            color: const Color(0xFFB66A3C),
            size: 22,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              Text(
                title,

                style: GoogleFonts.poppins(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                value,

                style: GoogleFonts.poppins(
                  color: const Color(0xFF123B32),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}