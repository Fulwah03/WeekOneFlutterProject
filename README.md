# Around Saudi 🇸🇦

Around Saudi is a Flutter tourism application that introduces users to some of the most beautiful destinations in Saudi Arabia.

The application is designed with a travel passport and ticket theme. Users can explore different destinations, view their details, discover recommended experiences, and open each location directly in Google Maps.

---
## 💡 Project Story

Around Saudi is a continuation of a tourism project I first created four years ago during a C++ bootcamp at (Twuaiq academey).
The original version was a simple console-based program without a user interface. In this Flutter version, I revisited the same idea and transformed it into an interactive mobile experience with a new visual identity inspired by Saudi tourism, travel passports, tickets, and stamps.

This project represents my progress from writing basic console logic to designing and building an interactive mobile application. 

---

## ✨ Features

- Displays four Saudi tourist destinations.
- Unique travel ticket design for every destination.
- Responsive interface using `MediaQuery`.
- Scrollable destinations using `ListView`.
- Detailed travel passport screen.
- Dynamic destination data using `List<Map>`.
- Navigation between screens using `Navigator`.
- Direct connection to Google Maps.
- Custom fonts and Saudi-inspired color palette.
- Destination search field interface.

---

## 📍 Destinations

- AlUla
- Farasan Islands
- Rijal Almaa
- Edge of the World

---

## 📱 Application Screens

### Home Screen

The Home Screen displays the application header and a collection of travel tickets. Each ticket contains the destination name, location, category, image, description, and an Explore button.

<img width="862" height="1150" alt="image" src="https://github.com/user-attachments/assets/72ced331-421e-47e2-9d85-65f7c0e053b3" />

### Tourist Destinations

The destinations are generated dynamically from a `List<Map<String, String>>` and displayed inside a scrollable `ListView`.

<img width="860" height="1148" alt="image" src="https://github.com/user-attachments/assets/8e8af206-5f55-469e-a0fe-ea5058ce31dc" />


### Destination Details

When the user taps the Explore button, the application sends the selected destination data to the Details Screen using `Navigator` and `MaterialPageRoute`.

<img width="864" height="1154" alt="image" src="https://github.com/user-attachments/assets/b48ee3f7-5ce6-4adf-91b3-4e30b9ff8d37" />

### Travel Passport Information

The Details Screen presents the destination as a travel passport page, including its category, best visiting time, description, recommended experience, and a custom travel stamp.

<img width="858" height="1154" alt="image" src="https://github.com/user-attachments/assets/4a3635b5-5c69-4a79-a27e-1fc945a95bd5" />

---

## 🗺️ Google Maps Integration

Users can tap the location icon or location name from either screen to open the selected destination directly in Google Maps.

This feature is implemented using the `url_launcher` package.

---

## 🧩 Flutter Widgets Used

The project includes the required Flutter widgets:

- `Scaffold`
- `AppBar`
- `ListView`
- `Column`
- `Row`
- `Container`
- `SizedBox`
- `Image`
- `Text`
- `TextField`
- `ElevatedButton`
- `InkWell`
- `MediaQuery`
- `Navigator`
- `Stack`
- `Positioned`
- `Expanded`

---

## 📦 Packages Used

- `google_fonts`
- `url_launcher`

---

## 📂 Project Structure

```text
lib/
├── main.dart
├── home_screen.dart
└── details_screen.dart

assets/
└── images/





