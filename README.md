# Asad (@AsadDUET) — Flutter & Mobile App Portfolio

Personal developer portfolio and mobile application showcase hosted at **[https://asadduet.github.io](https://asadduet.github.io)**, built with **Flutter Web**.

---

## ✨ Key Features

- **Interactive Mobile App Showcase**: Realistic smartphone mockups with interactive screen previews, category filters (`All Apps`, `Featured`, `Android`, `iOS`, `Open Source`), tech stack chips, and store links (`Google Play`, `App Store`, `Direct APK`, `GitHub`).
- **Store-Ready Privacy Policy & Support URLs**: Every app configured in `lib/data/portfolio_data.dart` automatically gets:
  - **App Showcase URL**: `https://asadduet.github.io/#/app/<slug>`
  - **Privacy Policy URL**: `https://asadduet.github.io/#/app/<slug>/privacy` (ready to paste into Google Play Console & App Store Connect)
  - **General Developer Privacy Policy**: `https://asadduet.github.io/#/privacy`
- **AdMob `app-ads.txt` Preservation**: Keeps `app-ads.txt` in both the repo root and `web/app-ads.txt` so `https://asadduet.github.io/app-ads.txt` is always served at the root domain.
- **Single-File Configuration**: Update all bio details, social links, apps, screenshots, and skills in a single file: [`lib/data/portfolio_data.dart`](lib/data/portfolio_data.dart).
- **Dark & Light Theme Toggle**: Sleek dark mode by default with instant switching to light mode.

---

## 🛠️ How to Customize Your Apps & Bio

1. Open [`lib/data/portfolio_data.dart`](lib/data/portfolio_data.dart).
2. Edit `PortfolioData.profile` to update your name, email, social links, and highlight metrics.
3. Edit `PortfolioData.mobileApps` to add or update your published mobile applications:
   - Set a unique `slug` (e.g. `'my-awesome-app'`) — this automatically creates `/#/app/my-awesome-app` and `/#/app/my-awesome-app/privacy`.
   - Optional: Drop real app screenshots into `assets/apps/` and set `imageUrlOrAsset: 'assets/apps/screen1.png'` inside `AppScreenPreview`.

---

## 🚀 Running Locally

```bash
flutter pub get
flutter run -d chrome
```

## 📦 Automated GitHub Pages Deployment

A GitHub Actions workflow (`.github/workflows/deploy.yml`) automatically builds `flutter build web --release`, preserves `app-ads.txt`, and deploys to GitHub Pages on every push to `main`.

> **One-time GitHub Setup**: In your repository on GitHub, go to **Settings → Pages → Build and deployment** and set **Source** to **GitHub Actions**.