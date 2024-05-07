--Extract the superstore data

select * from superstore;





--Select the data we are going to be using and Order it Alphabetically by Country

select InvoiceNo, Description, 
Quantity, CustomerID, 
Country, Sales
from superstore
order by Country;





--Showing list of the countries contained in the data
select distinct (Country)
from superstore;





--Showing Countries with highest sales
select Country, 
max(Sales) as TotalSales 
from superstore
group by Country;





--Showing the list of items bought by each customer, the unit price and their country
select InvoiceNo, Description, 
Quantity, UnitPrice, 
Country from superstore;





--Showing the amount of sales made on each date in the data
select InvoiceDate, 
sum(Sales) as SalesPerDate
from superstore
group by InvoiceDate;





--Showing the list of things that was sold on this date (2010-12-01) in the data
select * from superstore 
where InvoiceDate= '2010-12-01 13:23:00.0000000';




--How many quantity of goods was sold on this date (2010-12-01)
select count(Quantity)
from superstore
where InvoiceDate= '2010-12-01 13:23:00.0000000';





--Checking Unique Value
select distinct(InvoiceNo) from superstore
select distinct(StockCode) from superstore
select distinct(Description) from superstore
select distinct(Quantity) from superstore
select distinct(InvoiceDate) from superstore
select distinct(UnitPrice) from superstore
select distinct(CustomerID) from superstore
select distinct(Country) from superstore
select distinct(Sales) from superstore





--Adding another row of data to the Data
insert into superstore (InvoiceNo, StockCode, 
Description, Quantity, InvoiceDate, 
UnitPrice, CustomerID, Country, Sales)
values('536530', '21626', 
'Balenciaga Bag', '2', '2010-12-01 13:54:00.0000000', 
'1.64999997615814', '14594', 
'United kingdom', '9.89999961853027');





--Extracting data which shows detailes of "Fancy Font Birthday Card" and "Wrap Red Apples"
select * from superstore
where Description= 'FANCY FONT BIRTHDAY CARD,' or Description= 'WRAP RED APPLES';





--Case Study: you forgot the name of specific data and you only remember the first spelling letter which is "E" . This is how you extract it in SQL
select * from superstore
where Description like 'E%';

--In a case you only remeber the last letter which is "L"
select * from superstore
where Description like '%L';

--In a case you only remeber the second letter which is "D"
select * from superstore
where Description like '_D%';

--In a case you only remeber the first and last letter which is "E" and "L"
select * from superstore
where Description like 'E%L';





--Showing the Total sales, Average sales and Minimum sales in the data 
select sum(Sales) as Totalsales, 
avg(Sales) as avaeragesales, 
min(Sales) as lowestsales
from superstore;





--Showing the goods that the unit price is between 50$ and 100$
select * from superstore
where UnitPrice
between 50 and 100;





--Showing data where the Quantity is 12 and the Description is EDWARDIAN PARASOL NATURAL
select * from superstore
where Quantity= '12' and Description= 'EDWARDIAN PARASOL NATURAL';





--Extract Delivery data from the Tables and the extract invoiceno from superstore table and ID from Delivery table then left Join delivery ID on Superstore customerID
select * from Delivery;

select superstore.InvoiceNo, Delivery.ID
from superstore
left join Delivery on superstore.CustomerID= Delivery.ID
order by superstore.InvoiceNo;





--Join Superstore Table CustomerID and Delivery ID in one column
select CustomerID from superstore
union
select ID from Delivery;





--Count each IDs by the Mode of Shipment with have been granted discount greater than 10 times
select count(ID), Mode_of_Shipment
from Delivery
group by Mode_of_Shipment 
having count(Discount_offered) > 10;


























