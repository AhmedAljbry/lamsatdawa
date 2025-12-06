![LamsatDawa Platform](Gemini_Generated_Image_oqhssuoqhssuoqhs.png)

# LamsatDawa – Product Authenticity Verification Platform  
### Flutter Web + Firebase + Admin Dashboard  
### Developed by **Ahmed Aljbry**

**LamsatDawa** is a professional web platform built using **Flutter Web** and **Firebase**, designed to help users verify the authenticity of pharmaceutical and cosmetic products through QR codes or product serial numbers.

The system includes:
- A **public website** for users to verify products  
- A **multi-website structure** for different brands  
- A **secure admin dashboard** to manage products, batches, and verification logs  

This project demonstrates real-world production architecture and end-to-end system design.

---

## 🌟 Core Features

### 🧪 Product Authenticity Verification
- Verify product via:
  - QR code scanning  
  - Manual serial/Batch number input  
- Real-time Firestore lookup  
- Returns:
  - Product name  
  - Batch number  
  - Expiry date  
  - Verification status  
  - First verification time  
  - Verification count  
- Detects fake/tampered/invalid codes  
- Alerts for reused codes  

### 🏷 Multi-Brand / Multi-Website System
- Supports multiple brands under one umbrella  
- Each brand has:
  - Dedicated theme  
  - Logo  
  - Product database  
  - URL/website entry  

### 🛠 Admin Dashboard
- Add, edit, delete products  
- Batch & serial number generation  
- Export CSV/Excel  
- Real-time verification logs  
- Dashboard statistics:
  - Total scans  
  - Fake attempts  
  - Geo-locations (if enabled)  

### 🔔 Optional Customer Features
- Contact form  
- Product details  
- Usage instructions  

### 💡 Extra Features (If implemented)
- Product images  
- Promotions  
- Latest news  
- Multi-language: Arabic + English  

---

## 🚀 Tech Stack

| Layer | Technology |
|-------|------------|
| **Frontend** | Flutter Web |
| **Backend** | Firebase Functions (optional) |
| **Database** | Firebase Firestore |
| **Authentication** | Firebase Auth |
| **Hosting** | Firebase Hosting |
| **Admin Panel** | Flutter Web |
| **QR System** | qr_flutter / custom generator |

---

## 🧱 Project Structure (Suggested)

```txt
lib/
  core/
    theme/
    utils/
    constants/
    services/
  features/
    verification/
      presentation/
      data/
      domain/
    product/
    dashboard/
    authentication/
  widgets/
  main.dart
  app.dart
