with PlaylistTrack as (select * from {{ source ('liora_music', 'PlaylistTrack')}}),
final as ( select * from PlaylistTrack)
select * from final