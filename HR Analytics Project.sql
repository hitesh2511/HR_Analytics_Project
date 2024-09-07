/*
1.Query Employee Performance:

Retrieve the list of employees along with their latest performance ratings, including their self-rating and manager's rating.

*/

with temcte as (Select emp.EmployeeID,emp.FirstName,emp.LastName,max(rat.ReviewDate) as reviewdate from Employee as emp
Left join PerformanceRating as rat on emp.EmployeeID=rat.EmployeeID
where ReviewDate is not null
group by emp.EmployeeID,emp.FirstName,emp.LastName
)

select temcte.*,rat.SelfRating,rat.ManagerRating  from temcte 
join PerformanceRating as rat on temcte.EmployeeID=rat.EmployeeID and temcte.reviewdate=rat.ReviewDate

/*
2.Attrition Analysis:

Write a query to find the total number of employees who have left the company and group them by department.
*/
select Sum( Attrition) as Attrition_count, Department from Employee
group by Department

/*
3.Training Opportunities:

Calculate the average number of training opportunities taken by employees, grouped by department, who have been with the company for more than 5 years.
*/

Select emp.Department,Avg(cast(rat.TrainingOpportunitiesTaken as float)) as AVG_training from Employee as emp
Left join PerformanceRating as rat on emp.EmployeeID=rat.EmployeeID and emp.YearsAtCompany>5 
group by Department

/*
4.Job Satisfaction by Age Group:

Write a query to find the average job satisfaction score for employees within different age brackets (e.g., 18-30, 31-40, etc.).

*/

select  Avg(cast(rat.JobSatisfaction as float)) avg_jobSatisfied,
			case when emp.age between 18 and 30 then '18-30'
	        when emp.Age between 31 and 40 then '31-40'
			when emp.Age between 41 and 50 then '41-50'
			when emp.age between 51 and 58 then '51-58' 			
			end as Age_group
from Employee as emp
Left join PerformanceRating as rat on emp.EmployeeID=rat.EmployeeID
group by case when emp.age between 18 and 30 then '18-30'
	        when emp.Age between 31 and 40 then '31-40'
			when emp.Age between 41 and 50 then '41-50'
			when emp.age between 51 and 58 then '51-58' end
order by Avg(cast(rat.JobSatisfaction as float)) desc 			

/*
5.Promotion Impact:

List the employees who have received a promotion in the last 3 years and compare their performance ratings before and after the promotion.
*/

with tempcte as(select Employee.EmployeeID,Employee.FirstName,Employee.LastName,Employee.YearsAtCompany,Employee.YearsSinceLastPromotion,Employee.HireDate,year(HireDate)+YearsAtCompany as afterpromotion,year(HireDate)+YearsSinceLastPromotion as beforepromotion  from Employee
where YearsAtCompany<=3 and YearsSinceLastPromotion>1 and YearsAtCompany<>YearsSinceLastPromotion),
tempcte2 as (select tempcte.*, rat.ManagerRating as afterpromotionrating from tempcte
join PerformanceRating as rat on tempcte.EmployeeID=rat.EmployeeID and tempcte.afterpromotion=year(rat.ReviewDate))

select tempcte2.*,rat.ManagerRating as beforepermotion from tempcte2
join PerformanceRating as rat on tempcte2.EmployeeID=rat.EmployeeID and tempcte2.beforepromotion=year(rat.ReviewDate)

/* 
6.Overtime and Attrition:

Identify employees who work overtime and determine the percentage of those employees who have left the company.
*/

select (100*sum(case when Attrition=1 and OverTime=1 then 1 else 0 end)/sum(OverTime)) as Overtime_Attration from Employee

/*
7.Salary Distribution:

Write a query to display the salary distribution of employees across different departments, including the average salary per department.
*/

select sum(Salary) as Total_Salary_Department, Avg(Salary) as Avg_Salary_Department ,Department from Employee
group by Department

/*
8.Years with Current Manager:

Identify the relationship between the number of years an employee has been with their current manager and their job satisfaction rating.

*/

select emp.YearsWithCurrManager,AVG(rat.JobSatisfaction) AS Avg_JobSatisfaction from Employee as emp
join PerformanceRating rat on emp.EmployeeID=rat.EmployeeID
group by emp.YearsWithCurrManager

/* 
9.Performance and Education Level:

Compare the average performance ratings of employees based on their education level.

*/
select emp.Education,AVG(rat.ManagerRating) as Avg_Rating from Employee as emp
join PerformanceRating rat on emp.EmployeeID=rat.EmployeeID
group by emp.Education

/*
10.Distance from Home Analysis:

Find out the average distance from home for employees who are currently with the company (Attrition = 0) versus those who have left (Attrition = 1).

*/
select AVG(case when Attrition=1  then DistanceFromHome_KM end) as AVG_distancefromhome_Attrition,
	 AVG(case when Attrition=0  then DistanceFromHome_KM end) as AVG_distancefromhome_NoAttrition
from Employee
 
