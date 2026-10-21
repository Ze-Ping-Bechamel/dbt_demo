with Genre as (select * from {{ source ('liora_music', 'Genre')}}),
final as ( select * from Genre)
select * from final