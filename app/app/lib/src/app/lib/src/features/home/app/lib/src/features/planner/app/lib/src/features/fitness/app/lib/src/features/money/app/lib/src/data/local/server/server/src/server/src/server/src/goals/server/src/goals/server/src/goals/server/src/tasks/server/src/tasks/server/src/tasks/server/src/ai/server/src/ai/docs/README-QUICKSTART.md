# Quick Start
1) API
- cd server
- npm i
- npm run start:dev
- API on http://localhost:3000

2) App
- cd app
- flutter pub get
- dart run build_runner build -d
- For Android emulator: set base URL to http://10.0.2.2:3000 in Home screen
- For physical device: use http://YOUR-LAN-IP:3000
- flutter run
- Tap "Get Plan" on Home to verify end-to-end
