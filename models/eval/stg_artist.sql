with Artist as (select * from {{ source ('liora_music', 'Artist')}}),
final as ( select * from Artist)
select * from final