# World-Database-Query-Exercise---MySQL
### There were a number specific tasks to solve within a database of country information.

---
1) Count Cities in USA: Scenario: You've been tasked with conducting a demographic analysis of cities in the United States. Your first step is to determine the total number of cities within the country to provide a baseline for further analysis. 

select CountryCode Country, Count(ID) "# of Cities"\
from city\
where countrycode = "USA"\
group by countrycode;

---
2) Country with Highest Life Expectancy: Scenario: As part of a global health initiative, you've been assigned to identify the country with the highest life expectancy. This information will be crucial for prioritising healthcare resources and interventions. 

select name, lifeexpectancy\
from country\
order by lifeexpectancy desc\
limit 1;

---
3) "New Year Promotion: Featuring Cities with 'New : Scenario: In anticipation of the upcoming New Year, your travel agency is gearing up for a special promotion featuring cities with names including the word 'New'. You're tasked with swiftly compiling a list of all cities from around the world. This curated selection will be essential in creating promotional materials and enticing travellers with exciting destinations to kick off the New Year in style. 

select *\
from city \
where name like "%new%"; 

---
4) Display Columns with Limit (First 10 Rows): Scenario: You're tasked with providing a brief overview of the most populous cities in the world. To keep the report concise, you're instructed to list only the first 10 cities by population from the database. 

select *\
from city\
order by population desc\
limit 10;
 
---
5) Cities with Population Larger than 2,000,000: Scenario: A real estate developer is interested in cities with substantial population sizes for potential investment opportunities. You're tasked with identifying cities from the database with populations exceeding 2 million to focus their research efforts. 

select *\
from city\
where population > 2000000;
  
---
6) Cities Beginning with 'Be' Prefix: Scenario: A travel blogger is planning a series of articles featuring cities with unique names. You're tasked with compiling a list of cities from the database that start with the prefix 'Be' to assist in the blogger's content creation process. 

select *\
from city\
where name like "be%";
  
---
7) Cities with Population Between 500,000-1,000,000: Scenario: An urban planning committee needs to identify mid-sized cities suitable for infrastructure development projects. You're tasked with identifying cities with populations ranging between 500,000 and 1 million to inform their decision-making process. 

select *\
from city\
where population > 500000 and population < 1000000;

---
8) Display Cities Sorted by Name in Ascending Order: Scenario: A geography teacher is preparing a lesson on alphabetical order using city names. You're tasked with providing a sorted list of cities from the database in ascending order by name to support the lesson plan. 

select *\
from city\
order by name;
  
---
9) Most Populated City: Scenario: A real estate investment firm is interested in cities with significant population densities for potential development projects. You're tasked with identifying the most populated city from the database to guide their investment decisions and strategic planning. 

select *\
from city\
order by population desc\
limit 1;
  
---
10) City Name Frequency Analysis: Supporting Geography Education Scenario: In a geography class, students are learning about the distribution of city names around the world. The teacher, in preparation for a lesson on city name frequencies, wants to provide students with a list of unique city names sorted alphabetically, along with their respective counts of occurrences in the database. You're tasked with this sorted list to support the geography teacher. 

select distinct name "City Name", count(Name) Occurrences\
from city\
group by name\
order by Occurrences desc;

---
11) City with the Lowest Population: Scenario: A census bureau is conducting an analysis of urban population distribution. You're tasked with identifying the city with the lowest population from the database to provide a comprehensive overview of demographic trends. 

select name, population\
from city\
where population = (select min(population) from city);

---
12) Country with Largest Population: Scenario: A global economic research institute requires data on countries with the largest populations for a comprehensive analysis. You're tasked with identifying the country with the highest population from the database to provide valuable insights into demographic trends. 

Select name, population\
from country\
where population = (select max(population) from country);

---
13) Capital of Spain: Scenario: A travel agency is organising tours across Europe and needs accurate information on capital cities. You're tasked with identifying the capital of Spain from the database to ensure itinerary accuracy and provide travellers with essential destination information. 

select name "Capital"\
from city\
where ID = (select capital from country where name = "spain");

---
14) Cities in Europe: Scenario: A European cultural exchange program is seeking to connect students with cities across the continent. You're tasked with compiling a list of cities located in Europe from the database to facilitate program planning and student engagement. 

select ci.name City\
from city ci\
join country co on ci.countrycode = co.code\
where continent = "europe"\
order by city;

---
15) Average Population by Country: Scenario: A demographic research team is conducting a comparative analysis of population distributions across countries. You're tasked with calculating the average population for each country from the database to provide valuable insights into global population trends. 

select name Country, avg(population) "Average Population"\
from country\
group by name;

---
16) Capital Cities Population Comparison: Scenario: A statistical analysis firm is examining population distributions between capital cities worldwide. You're tasked with comparing the populations of capital cities from different countries to identify trends and patterns in urban demographics. 

select co.name Country, ci.name Capital, ci.population\
from country co\
join city ci on co.capital = ci.id\
order by ci.population desc;

---
17) Countries with Low Population Density: Scenario: An agricultural research institute is studying countries with low population densities for potential agricultural development projects. You're tasked with identifying countries with sparse populations from the database to support the institute's research efforts. 

select (population / surfacearea) "Population per KM²", Name, Population, SurfaceArea "Surface Area"\
from country\
where population != 0 and (population / surfacearea) < 100\
order by (population / surfacearea);

---
18) Cities with High GNP per Capita: Scenario: An economic consulting firm is analysing cities with high GNP per capita for investment opportunities. You're tasked with identifying cities with above-average GNP per capita from the database to assist the firm in identifying potential investment destinations.

select ci.name City, (gnp / co.population * ci.population) CityGNPperCapita\
from city ci join country co on ci.countrycode = co.code\
where (gnp / co.population * ci.population) > (select avg(gnp / co.population * ci.population) from country co join city ci on ci.countrycode = co.code)\
order by CityGNPperCapita desc\
limit 2000; 

---
19) Display Columns with Limit (Rows 31-40): Scenario: A market research firm requires detailed information on cities beyond the top rankings for a comprehensive analysis. You're tasked with providing data on cities ranked between 31st and 40th by population to ensure a thorough understanding of urban demographics. 

select *\
from city\
order by population desc\
Limit 30,10;
