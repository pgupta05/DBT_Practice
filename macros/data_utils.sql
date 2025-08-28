{% macro get_day_type(passTimestamp) %}

    case
        when dayname(to_timestamp({{ passTimestamp }})) in ('Sat', 'Sun')
        then 'Weekend'
        else 'BusinessDay'
    end

{% endmacro %}

{% macro get_session(passTimestamp) %}

    case
        when month(to_timestamp({{ passTimestamp }})) in (12, 1, 2)
        then 'Winter'
        when month(to_timestamp({{ passTimestamp }})) in (3, 4, 5)
        then 'Spring'
        when month(to_timestamp({{ passTimestamp }})) in (6, 7, 8)
        then 'Summer'
        when month(to_timestamp({{ passTimestamp }})) in (9, 10, 11) then 'Autumn' 
        else 'N/a'
        end

{% endmacro %}
