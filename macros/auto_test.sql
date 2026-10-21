{% macro auto_test(number) %}
insert into DEMO_DBT.PUBLIC.MY_FIRST_DBT_MODEL values ({{number}});
commit;
{% endmacro %}