with MediaType as (select * from {{ source ('liora_music', 'MediaType')}}),
final as ( select * from MediaType)
select * from final