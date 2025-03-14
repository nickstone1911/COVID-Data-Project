-- Queries used for Tableau Project

-- 1. Total Cases, Total Deaths, and Death Percentage

SELECT SUM(new_cases) as total_cases, SUM(CAST(new_deaths as int)) as total_deaths, SUM(CAST(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
FROM covid-data-448023.Covid_data.Covid_Deaths covd
WHERE continent is NOT NULL
ORDER BY 1,2
;

-- 2. Total Death Count by country

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

SELECT location, SUM(cast(new_deaths as int)) as TotalDeathCount
FROM covid-data-448023.Covid_data.Covid_Deaths covd
WHERE continent is NULL
AND location NOT IN ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC
;

-- 3. Highest Infection Count and Percent of Population Infected by country

SELECT Location, Population, MAX(total_cases) as HighestInfectionCount,  MAX((total_cases/population))*100 as PercentPopulationInfected
FROM covid-data-448023.Covid_data.Covid_Deaths covd
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC
;

-- 4. Highest Infection Count and Percent of Population Infected by country and date


SELECT Location, Population, date, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
FROM covid-data-448023.Covid_data.Covid_Deaths covd
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC
;