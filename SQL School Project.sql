select * from school;



--Data Cleaning: Create a Column name called "Type of School and change the "HS" to "High School" and "ES" to "Elemenary School" in "Elementary Middle or High School" column 
--And fix all changes inside "Type of School column.

--Changing the "HS" to "High School" and "ES" to "Elemenary School" in "Elementary Middle or High School
select Elementary_Middle_or_High_School,
       (case 
	   when Elementary_Middle_or_High_School = 'ES' then 'Elementary Middle'
	   when Elementary_Middle_or_High_School =  'HS' then 'High School'
	   else Elementary_Middle_or_High_School 
	   end)
	   as Type_of_School
	   from school;

--Fixing it all changes in Type of School column
update school
set Type_of_School = (case 
	   when Elementary_Middle_or_High_School = 'ES' then 'Elementary Middle'
	   when Elementary_Middle_or_High_School =  'HS' then 'High School'
	   else Elementary_Middle_or_High_School 
	   end);




--Deleting Unused Column 
drop table Adequate_Yearly_Progress_Made, Link, Elementary_Middle_or_High_School, Healthy_Schools_Certified, Institute;





--Generic
--Checking for unique data

--How many unique Network Manager does the data have
select distinct Network_Manager
from school

--How many unique Collaborative Name does the data have
select distinct Collaborative_Name
from school


--Checking each of the Network Manager that has each of the Collaborative Name 
select distinct 
        Network_Manager, 
		Collaborative_Name
from school;






--Which CPS Performance Policy Level is the most common and name the column as performance level and order it based on the performance level in descending order
select 
	CPS_Performance_Policy_Level,
	count(CPS_Performance_Policy_Level) as Performance_Level
	from school
	Group by CPS_Performance_Policy_Level
	order by Performance_Level desc;





--Checking the toal score based on Collaboration Name and order it by score in Descending order
select Collaborative_Name,
			sum(Safety_Score) as Score
			from school
			group by Collaborative_Name
			order by Score desc






--WHich Collaboration Name as more score than the average score and order it bt score in Descending order
select Collaborative_Name,
		sum(Safety_Score) as Score
		from school
		group by Collaborative_Name
		having sum (Safety_Score) > (select avg (Safety_Score) from school)
		order by score desc; 
		





--What is the average score of each Collaborative_Name?
select
Collaborative_Name,
		avg(Safety_Score) as Score
		from school
		group by Collaborative_Name
		order by score desc;

--Rounding it up to 2 decimal places
select
Collaborative_Name,
		round (avg(Safety_Score), 2) as Score
		from school
		group by Collaborative_Name
		order by score desc;







--Showing data where CPS_Performance_Policy_Level is on probation
select * from school
where CPS_Performance_Policy_Level= 'Probation';


















