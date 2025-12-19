#  Zoo Management – SQL & Power BI Project

A comprehensive Zoo Management system using **MySQL** for relational data and **Power BI** for dynamic data visualization.

---

![WhatsApp Image 2025-12-18 at 7 05 45 PM](https://github.com/user-attachments/assets/1334442c-ea3d-454f-bad6-627be8286c48)
![WhatsApp Image 2025-12-18 at 7 05 44 PM](https://github.com/user-attachments/assets/ef0a8878-90e7-482f-aeea-c5c0270151fa)


## 📊 Dashboard Highlights

- Interactive slicers for species, enclosures, and conservation status  
- Animal directory with species, diet, gender, and enclosure  
- Eatery menu items with dietary types and pricing  
- Walking distances and times between enclosures and eateries  
- Species distribution and conservation summaries

---

## 💾 Technologies Used

- **SQL**: MySQL 8  
- **BI Tool**: Power BI Desktop  
- **Database Tool**: MySQL Workbench / CLI  
- **Version Control**: Git & GitHub

---

## 🧱 Database Schema Overview

- `species`  
- `animals`  
- `enclosures`  
- `animal_placement`  
- `eateries`  
- `menu_items`  
- `eatery_enclosure_proximity`  
- Views, triggers, and stored procedures

---

## 📁 Project Structure

```bash
zoo-management/
│
├── sql/
│   └── zoo_schema.sql             # Clean database schema (DDL + triggers + procedures)
│
├── powerbi/
│   └── zoo_dashboard.pbix         # Power BI Dashboard
│
└── README.md                      # This file
