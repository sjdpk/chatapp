# firebase_chat
"firebase base chat system"
#out project structure is
lib/src/
auth/
  • auth_repository.dart
  • auth_service.dart 
  • login_page.dart
  • signup_page.dart
chat/
  • chat_repository.dart
  • chat_service.dart
  • chat_list_page.dart
  • chat_detail_page.dart
models/
  • user.dart
  • message.dart
utils/
  • firebase_utils.dart
  • http_utils.dart 

#create folder structure
$mkdir lib/src;cd lib/src
$mkdir auth chat models utils

now create files
$touch auth/auth_repository.dart auth/auth_service.dart auth/login_page.dart auth/signup_page.dart

$touch chat/chat_repository.dart chat/chat_service.dart chat/chat_list_page.dart chat/chat_detail_page.dart

$touch models/user.dart models/message.dart

$touch utils/firebase_utils.dart utils/http_utils.dart

#Add dependency
#make alias for shotcut
alias padd="flutterpub add"
alias dadd="flutterpub add dev:"

//add normal dependency
$padd firebase_auth;padd flutter_facebook_auth;padd google_sign_in;padd mobx;padd flutter_mobx;padd cloud_firestore

//add dev dependendy
$dadd build_runner; add mobx_codegen

<!-- setup documenatation -->
#facebook auth setup : `https://facebook.meedu.app/docs/5.x.x/intro`
#Google auth setup : `https://firebase.google.com/docs/flutter/setup?platform=android`