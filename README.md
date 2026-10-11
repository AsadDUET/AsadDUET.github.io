# IoTBangla — Mobile Apps & Smart Solutions Portfolio

Official mobile application showcase and publisher website for **IoTBangla**, built with **Flutter Web**.

---

## ✨ Key Features

- **Interactive Mobile App Showcase**: Realistic smartphone mockups with interactive screen previews, category filters (`All Apps`, `Featured`, `Android`, `iOS`, `Open Source`), tech stack chips, and store links (`Google Play`, `App Store`, `Direct APK`, `GitHub`).
- **Store-Ready Privacy Policy & Support URLs**: Every app configured in `lib/data/portfolio_data.dart` automatically gets:
  - **App Showcase URL**: `https://asadduet.github.io/#/app/<slug>`
  - **Privacy Policy URL**: `https://asadduet.github.io/#/app/<slug>/privacy` (ready to paste into Google Play Console & App Store Connect)
  - **Official Publisher Privacy Policy**: `https://asadduet.github.io/#/privacy`
- **AdMob `app-ads.txt` Preservation**: Keeps `app-ads.txt` in both the repo root and `web/app-ads.txt` so `https://asadduet.github.io/app-ads.txt` is always served at the root domain.
- **Single-File Configuration**: Update all company info, apps, screenshots, and capabilities in a single file: [`lib/data/portfolio_data.dart`](lib/data/portfolio_data.dart).
- **Dark & Light Theme Toggle**: Sleek dark mode by default with instant switching to light mode.