Zoo Management

Repository of:
- **`sql/zoo_schema.sql`**  
  MySQL schema (tables, triggers, procedures, views).
- **`powerbi/Zoo Management.pbix`**  
  Two‑page Power BI report.

Setup

1. **Clone**  
   ```bash
   git clone https://github.com/Siddhu-0207/zoo-management.git
   cd zoo-management
# Zoo Management System 🦁🐧🦒

This project is a comprehensive **Zoo Management Database** built using **MySQL** and visualized in **Power BI**. It covers animal species, their enclosures, eateries in the zoo, menu items, distances, walking times, and more.

---

## 🔧 Technologies Used

- MySQL 8
- Power BI Desktop
- SQL Triggers, Views, Procedures
- Power BI slicers, matrix, bar, pie charts

---

## 📁 Repository Structure

zoo-management/
├── sql/
│ └── zoo_schema_clean.sql -- Clean SQL dump
├── powerbi/
│ └── zoo_management_dashboard.pbix
└── README.md

## 📊 Power BI Dashboard Highlights

- 🦓 Total animals per enclosure
- 🧭 Closest eateries to each enclosure
- 🍕 Menu items by dietary type
- 📍 Interactive filters by species, conservation status
- 🐍 Description and category of each enclosure

---

## 📦 SQL Features

- ✅ Normalized schema with 8+ tables
- ⚙️ Views for animals per enclosure, species per enclosure
- 📌 Triggers for syncing species/enclosure names
- 📈 Stored procedures for capacity and animal insertion

---

## 📤 Getting Started

1. Load the schema from `sql/zoo_schema_clean.sql` into MySQL.
2. Open the `.pbix` file in Power BI Desktop.
3. Connect using ODBC or MySQL connector.
4. Refresh data and enjoy the dashboard!

---