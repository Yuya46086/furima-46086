## usersテーブル

|Column                |Type    |Options                   |
|----------------------|--------|--------------------------|
|nickname              |string  |null: false               |
|email                 |string  |null: false, unique: true |
|encrypted_password    |string  |null: false               |
|last_name             |string  |null: false               |
|first_name            |string  |null: false               |
|last_name_kana        |string  |null: false               |
|first_name_kana       |string  |null: false               |
|birth_date            |date    |null: false               |

### Association
- has_many :products
- has_many :orders


## productsテーブル

|Column                |Type       |Options                        |
|----------------------|-----------|-------------------------------|
|name                  |string     |null: false                    |
|description           |text       |null: false                    |
|price                 |integer    |null: false                    |
|user                  |references |null: false, foreign_key: true |


### Association
- has_one :order
- belongs_to :user


## ordersテーブル

|Column         |Type       |Options                        |
|---------------|-----------|-------------------------------|
|user           |references |null: false, foreign_key: true |
|product        |references |null: false, foreign_key: true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :product


## addressesテーブル

|Column         |Type       |Options                        |
|---------------|-----------|-------------------------------|
|postal_code    |string     |null: false                    |
|city           |string     |null: false                    |
|address_line   |string     |null: false                    |
|building       |string     |                               |
|phone_number   |string     |null: false                    |
|order          |references |null: false, foreign_key: true |

### Association
- belongs_to :order