--Extracting the Transportation Data
select * from Transportation;





--Standardize date format 
select InvoiceDate
from Transportation;

select InvoiceDate, convert(date, InvoiceDate)
from Transportation;

update Transportation
set InvoiceDate= convert(date, InvoiceDate);





--Splitting the Weight in gms to fit in another column
select
parsename(replace(Weight_in_gms, ', ', '-'), 1)
from Transportation;





--Change M and F to Male and Female in 'Gender' field
select Gender
, case when Gender = 'M' then 'Male'
       when Gender = 'F' then 'Female'
	   else Gender
	   end
from Transportation;




--Remove Duplicates
select
     row_number () over(
	 partition by Warehouse_block,
	              Gender,
				  column13
				  order by ID)
				  row_num
from Transportation
order by Warehouse_block;





--Delete unused column
alter table Transportation 
drop column Customer_care_calls, Cost_of_the_Product, Prior_purchases;  







