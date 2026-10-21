with Track as (select * from {{ source ('liora_music', 'Track')}}),
final as ( select * from Track)
select * from final