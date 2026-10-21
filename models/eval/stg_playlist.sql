with Playlist as (select * from {{ source ('liora_music', 'Playlist')}}),
final as ( select * from Playlist)
select * from final