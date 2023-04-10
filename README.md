# Firebase Chat

This project is a Firebase-based chat system implemented in Flutter. 

## Add dependency

##### Make alias for shotcut
```
alias padd="flutterpub add"
```
```
alias dadd="flutterpub add dev:"
```
### Add App dependency
```
$padd firebase_auth;padd flutter_facebook_auth;padd google_sign_in;padd mobx;padd flutter_mobx;padd cloud_firestore
```
### Add dev dependency
```
$dadd build_runner; add mobx_codegen
```

<!-- setup documenatation -->
#facebook auth setup : `https://facebook.meedu.app/docs/5.x.x/intro`
#Google auth setup : `https://firebase.google.com/docs/flutter/setup?platform=android`
It has the following folder structure:
## Project Structure



```bash
.
├── main.dart
└── src
    ├── auth
    │   ├── models
    │   │   └── user.dart
    │   ├── screens
    │   │   ├── signin_page.dart
    │   │   └── userinfo_page.dart
    │   ├── services
    │   │   ├── auth_service.dart
    │   │   ├── auth_service.g.dart
    │   │   ├── user_service.dart
    │   │   └── user_service.g.dart
    │   └── widgets
    │       └── apptextfield.dart
    ├── chat
    │   ├── models
    │   │   └── message.dart
    │   ├── screens
    │   │   ├── chatlist.dart
    │   │   └── chatpage.dart
    │   └── widget
    │       ├── lastseen_widget.dart
    │       ├── messagecard_widget.dart
    │       ├── msgcard_widget.dart
    │       ├── profile_widget.dart
    │       └── recentchat_widget.dart
    ├── config
    │   └── config.dart
    ├── home
    │   ├── screens
    │   │   ├── homepage.dart
    │   │   └── search_user.dart
    │   └── widgets
    │       └── search_widget.dart
    └── utils
        ├── appstore.dart
        ├── appstore.g.dart
        ├── colors.dart
        ├── firebase_utils.dart
        ├── http_utils.dart
        ├── log.dart
        ├── snackbar.dart
        ├── textstyle.dart
        ├── timestamp.dart
        └── validator.dart
