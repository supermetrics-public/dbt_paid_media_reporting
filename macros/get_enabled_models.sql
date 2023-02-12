{% macro get_enabled_models(usable_models=[]) %}


{% set enabled_models = [] %}


{% for model in usable_models %}
        {% if var('paid_media_reporting__' ~ model ~ '_enabled', True) %}
            {{ enabled_models.append(model) }}
        {% endif %}
    {% endfor %}


{{ return(enabled_models) }}

{% endmacro %}