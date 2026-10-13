{% macro add7days(col) %}
    dateadd('day',7,{{col}})
{% endmacro %}