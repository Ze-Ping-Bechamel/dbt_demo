-- load DEMOGRAPHICS
with demo as (select * from {{ source ('COVID19_Epidemiological_Data', 'DEMOGRAPHICS')}}),

-- load COUNTRY CODES
country as (select  * from {{ ref ('country_code')}}),

-- JOIN
final as (
SELECT
    d.ISO3166_1 as Country_ISO,
    d.ISO3166_2 as State_ISO,
    c.Name as Country_Label,
    d.FIPS as FIPS_Code,
    d.LATITUDE as Latitude,
    d.LONGITUDE as Longitude,
    d.STATE as State_Label,
    d.COUNTY as County_Name,
    d.TOTAL_POPULATION as Total_Population,
    d.TOTAL_MALE_POPULATION as Total_Male_Population,
    d.TOTAL_FEMALE_POPULATION as Total_Female_Population,
FROM
    demo d
JOIN
    country c ON c.code = d.ISO3166_1)

-- DISPLAY FINAL
select * from final