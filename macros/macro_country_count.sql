
{%- set countries = ["France","Spain","Germany","United States"]*%}

select
order_id,
{% for countries in countries %}
    {%- if ' ' not in Country_Label-%}
    count(case when Country_Label = '{{countries}}' then Country_Label end) as {{country}}_amount

    {%- else  -%}
    {%- set Country_Corrected = Country_Label.replace(' ','_') -%}
    count(case when Country_Label = '{{countries}}' then Country_Corrected end) as {{country}}_amount

    {% endif -%}
    {%- if not loop.last %},{% endif -%}
    {% endfor %}
from {{ ref('macro_2') }}
group by 1