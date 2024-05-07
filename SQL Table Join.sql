--Extracting the Dataframe data and Continuation data from the table
select * from dataframe;
select * from continuation;



--Inner Join continuation data on dataframe data
--This means joining everything that is common from dataframe table and continuation table together
select * from dataframe
inner join continuation
on dataframe.ID = continuation.ID



--Inner Join ID, firstname and age column from dataframe data on skills column in continuation data
select d.ID, d.firstname, d.age, c.skills 
from dataframe as d
inner join continuation as c
on d.ID = c.ID



--Outer Join dataframe data with continuation data
--This means joining continuation data to the right side of datafreame data
select * from dataframe
full outer join continuation
on dataframe.ID = continuation.ID




--Left outer Join dataframe data with continuation data
--This means joining matched rows from left to right from continuation table to dataframe table
select * from dataframe
left outer join continuation
on dataframe.ID = continuation.ID



--Right outer Join dataframe data with continuation data
--This means joining matched rows from right to left from dataframe table to continuation table 
select * from dataframe
Right outer join continuation
on dataframe.ID = continuation.ID



--Join all matched data and unmatched from right to left with skils column from continuation table
select * from dataframe
right outer join continuation
on dataframe.ID = continuation.ID




----Join all data from dataframe and continuation table together with skils column from continuation table
select * from dataframe
full outer join continuation
on dataframe.ID = continuation.ID












