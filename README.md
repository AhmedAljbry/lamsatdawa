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
- Users can verify any product by:
  - Scanning QR code  
  - Entering serial number manually  
- Firebase checks the product ID in real-time  
- Returns full product details:
  - Product name  
  - Batch number  
  - Expiry date  
  - Verification status  
  - First verification time  
  - Number of verifications  
- Fake / tampered code detection  
- Warning for reused or invalid codes  

### 🏷 Multi-Brand / Multi-Website System
- Supports multiple company websites under one platform  
- Each brand has:
  - Its own logo  
  - Its own color theme  
  - Its own product database  

### 🛠 Admin Dashboard
- Add / edit / delete products  
- Upload batches  
- Generate unique serial numbers  
- Export CSV / Excel  
- Track verification logs  
- Real-time dashboard statistics  
  - Total scans  
  - Fake attempts  
  - Locations of scans (if enabled)  

### 🔔 Optional Customer Features
- Contact form  
- Product information page  
- Instructions for product usage  

### 💡 Extra (If implemented)
- Product images  
- Promotions  
- Latest updates  
- Multi-language (Arabic + English)

---

## 🚀 Tech Stack

| Layer | Technology |
|-------|------------|
| **Frontend** | Flutter Web |
| **Backend** | Firebase Functions (optional) |
| **Database** | Firebase Firestore |
| **Auth** | Firebase Authentication |
| **Hosting** | Firebase Hosting |
| **Admin Panel** | Flutter Web (separate module) |
| **QR Code** | qr_flutter / custom generator |

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

