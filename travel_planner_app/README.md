# iTravel

Do you ever wish that you could have an app where you can keep track of all your travel plans? iTravel will turn that into a reality. My fiance and I are in the process of planning our honeymoon and I realized that there wasn't an app that would allow me to create a list of places that we could stop by and visit, and that is how I came up with the idea of iTravel.

## Instructions for Build and Use

Steps to build and/or run the software:

1. Open VS code
2. Install the required software above
3. Verify that flutter is installed correctly by running: flutter doctor
4. Clone the project from the git repository
5. Run: flutter pub get
6. Create a [Firebase Project](https://console.firebase.google.com)
   In the Firebase console:
   1. Go to authentication, get started, and enable email/password
   2. Go to cloud firestore, create database, and start in test mode
7. Connect Firebase to Flutter by running: flutterfire configure and selecting your created project and the desired platforms (iOS/Android)
8. Start an emulator/simulator and run: flutter run

Instructions for using the software:

1. Create an account using a email/password or log into your created account
2. Type your desired destination for your trip
3. If desired, include a brief note to describe what the trip is about
4. After you have entered your desired information, tap the "Add Trip" button
5. Made a mistake or a typo when adding a trip? No worries! Just tap the trash icon and it will get rid of the card
6. Do you want to see all the trips you have added? Tap on the heart to go to your favorites page where you will find all your saved trips
7. To log out of your account, click on the log out button on the top right corner of the app

## Development Environment

To recreate the development environment, you need the following software and/or libraries with the specified versions:

* Visual Studio Code capable of running a mobile emulator
* - [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart (included with Flutter)
- Android Emulator or iOS Simulator
- [Firebase CLI](https://firebase.google.com/docs/cli)
- FlutterFire CLI: Run '''bash dart pub global activate flutterfire_cli

## Useful Websites to Learn More

I found these websites useful in developing this software:

* [Setup and Test Flutter](https://docs.flutter.dev/install/quick)
* [Build iOS and Android apps](https://www.youtube.com/watch?v=oaZnf4p6itA)
* [Your First Flutter app](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#0)
* [Why is flutter debug mode broken?](https://www.reddit.com/r/FlutterDev/comments/1oinfrg/why_is_flutter_debug_mode_still_broken_on_ios_26/)
* [Firebase Tutorial for Beginners 2026](https://www.youtube.com/watch?v=_L8j-ZC83y4)
* [Firebase - Ultimate Beginner's Guide](https://www.youtube.com/watch?v=9kRgVxULbag)
* [Firebase Authentication](https://firebase.google.com/docs/auth)


## Future Work

The following items I plan to fix, improve, and/or add to this project in the future:

* [ ] Make the trips more descriptive (include dates)
* [ ] Have multiple images instead of just one preset one
* [ ] Be able to create groups of destinations in one trip instead of being limited to just one
* [ ] Enable authentication through google/microsoft
