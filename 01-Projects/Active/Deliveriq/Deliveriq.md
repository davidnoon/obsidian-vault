
ongoing coding project.

- Objective 1: a full solution for me to ingest and process all expense records for the past 3 years of DoorDash driving part time. Vehicle kilometer logbook for ATO purposes, Earnings records. 

- Objective 2: learning with a real project - getting back into programming and learning the vibe coding with AI approach. 

- Objective 3: possibility to launch it as a full featured platform for drivers and power multiple 'front-end' offerings. for food, grocery and parcel delivery. building supply, cold chain focused on last mile. 

- Objective 4: a marketplace and community for drivers ahead of the new legislation coming into effect in July 2026. Bargaining power, buying power etc.  

### For more go to:
coding progressed - link to plans, code base on github. 
should create a few more design notes to guide the development of "next step" in the path.

### Other:
waitlist approach to marketing. 
figure out and promote a killer feature no one else is doing. (like it just uses an AI to process everything and prep your tax return!) MYOB might be doing that already with their new system.

on the CSV imports for expenses. 
current optional values:
Optional columns

Description

What the expense was for

Accepted headers: Description, Detail, Memo, Item, Name, Title, What

Example: `Fuel – BP Parramatta`

Category

Expense category — must match a category name in DeliverIQ exactly

Accepted headers: Category, Cat, Type, Category Name, Expense Type, Kind

Example: `Fuel`

Business %

Percentage of this expense used for work (0–100). Defaults to 100% if not provided.

Accepted headers: Business %, Business Use, Biz %, Deductible %, Work %

Example: `100 or 75`

Notes

Any additional notes

Accepted headers: Notes, Note, Comment, Remark, Extra

Example: `Receipt #1234` 

For the import csv - what are the expense category names / values ?

We need to add optional values for fuel price per litre ('l' or 'ltr') in cents, number of litres, ABN number of the vendor, name of vendor,  address (street, suburb and postcode and state), payment method, card number-last four digits, GST (tax) amount. 

- `Fuel`, `Vehicle Maintenance`, `Phone & Data`, `Insurance`, `Registration`, `Parking`, `Tolls`, `Equipment`, `Delivery Bags`, `Safety Gear`, `Uniform`, `Accounting Fees`, `Bank Fees`, `Other`

Full list: 
The full value lists are now shown inline in each relevant field's description row in all three guides:

- **Expenses → Category**: `Fuel · Vehicle Maintenance · Phone & Data · Insurance · Registration · Parking · Tolls · Equipment · Delivery Bags · Safety Gear · Uniform · Accounting Fees · Bank Fees · Other`
- **Earnings → Platform**: `DoorDash · Uber Eats · Menulog · Deliveroo · Instacart · Grubhub · SkipTheDishes · Postmates`
- **Logbook → Platform**: same list as Earnings