with 

source as (

    select * from {{ source('raw', 'products') }}

),

renamed as (

    select
        products_id,
        purchse_price

    from source

)

select * from renamed
