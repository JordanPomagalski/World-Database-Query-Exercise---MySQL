-- 1
select CountryCode Country, Count(ID) "# of Cities"
from city
where countrycode = "USA"
group by countrycode;
-- 2
select name, lifeexpectancy
from country
order by lifeexpectancy desc
limit 1;
-- 3
select *
from city
where name like "%new%";
-- 4
select *
from city
order by population desc
limit 10;
-- 5
select *
from city
where population > 2000000;
-- 6
select *
from city
where name like "be%";
-- 7
select *
from city
where population > 500000 and population < 1000000;
-- 8
select *
from city
order by name;
-- 9
select *
from city
order by population desc
limit 1;
-- 10
select distinct name "City Name", count(Name) Occurrences
from city
group by name
order by Occurrences desc;
-- 11
select *
from city
order by population
limit 1;

select name, population
from city
where population = (select min(population) from city);
-- 12
Select name, population
from country
where population = (select max(population) from country);
-- 13
select name "Capital"
from city
where ID = (select capital from country where name = "spain");
-- 14
select ci.name City, Continent
from city ci
join country co on ci.countrycode = co.code
where continent = "europe"
order by city;
-- 15 [[ASK HOW TO SHOW AVERAGE WITHOUT DECIMAL PLACES]]
select name Country, avg(population) "Average Population"
from country
group by name;
-- 16
select co.name Country, ci.name Capital, ci.population
from country co
join city ci on co.capital = ci.id
order by ci.population desc;
-- 17
select (population / surfacearea) "Population per KM²", Name, Population, SurfaceArea "Surface Area"
from country
where population != 0 and (population / surfacearea) < 100
order by (population / surfacearea);
-- 18
select *
from city;
select *
from country;

select ci.name City, (gnp / co.population * ci.population) CityGNPperCapita
from city ci
join country co on ci.countrycode = co.code
where (gnp / co.population * ci.population) > (select avg(gnp / co.population * ci.population) from country co join city ci on ci.countrycode = co.code)
order by CityGNPperCapita desc
limit 2000;

select avg(gnp / co.population * ci.population)
from country co
join city ci on ci.countrycode = co.code;
-- 19
select *
from city
order by population desc
-- limit 10 offset 30;
limit 30,10;