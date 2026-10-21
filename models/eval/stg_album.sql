with Album as (select * from {{ source ('liora_music', 'Album')}}),

clean_album as 
    (select 
        -- PAS DE CLEANS SUR LES ALBUMID
        AlbumId,

        -- CLEAN SUR LES TITRES D'ALBUMS
        case
            -- clean_01
            when Title = 'The Final Concerts (Disc 2)' and ArtistId = 58
            then 'MK III The Final Concerts [Disc 2]'
            
            -- clean_02
            when Title ILIKE '%Frank Sinatra%' and Title ILIKE '%[Disc 1]%'
            then TRIM(REPLACE(Title, '[Disc 1]', ''))
            
            -- clean_03
            when ArtistId = 142 and Title ILIKE '%Hot Rocks%'
            then TRIM(REPLACE(Title, '(Disc 1)', ''))
            
            -- clean_04
            when Title =  'Cássia Eller - Coleção Sem Limite [Disc 2]' and ArtistId = 77
            then 'Cássia Eller - Sem Limite [Disc 2]'
            
            else Title
            end as Title,
        
        -- PAS DE CLEANS SUR LES ARTISTID
        ArtistId,
        case 
            -- CLEAN SUR LES PRODYEAR
            -- clean_01
            when Title = 'The Final Concerts (Disc 2)' and ArtistId = 58
            then 2006

            -- clean_05
            when AlbumId = 222 and ArtistId = 145
            then 2003
            
            else Prodyear
            end as Prodyear,
        
        -- PAS DE CLEANS SUR LES CDYEAR
        CdYear from Album),

final as (select
        AlbumId,
        REGEXP_REPLACE(Title, '\\((Disc|CD)\\s*([0-9]+)\\)', '[\\1 \\2]', 1, 0, 'i') as Title,
        ArtistId,
        Prodyear,
        CdYear
    from clean_album)

select * from final



