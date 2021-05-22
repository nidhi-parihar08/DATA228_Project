--Total cases across the World
select sum(total_cases) from "covid_world_data"."covid_19_world_cases_deaths_testing_csv" 
where location = 'World' and date in('2021-05-12')

--Total deaths
select sum(total_deaths) from "covid_world_data"."covid_19_world_cases_deaths_testing_csv" 
where location = 'World' and date in('2021-05-12')

--Percent Vaccinated
SELECT location , sum((people_fully_vaccinated) / population * 100) as Vaccinated  
FROM "covid_world_data"."covid_19_world_cases_deaths_testing_csv" 
where date in('2021-05-12') 
group by location
order by Vaccinated desc

--Percent Cases in the world
select location , round(max(total_Cases) *100 / max(population),2) as TotalPercentage
FROM "covid_world_data"."covid_19_world_cases_deaths_testing_csv" 
where date in('2021-05-12') and location = 'World'
group by location
order by TotalPercentage desc

--Total confirmed cases by country
select location, sum(total_Cases) as TotalCases 
FROM "covid_world_data"."covid_19_world_cases_deaths_testing_csv"
where date in('2021-05-12') and 
location not in('Asia', 'World', 'Europe','"North America"','"European Union"','"South America"','Oceania','Africa' )
group by location
order by TotalCases desc

