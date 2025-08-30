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
|image                 |text       |null: false                    |
|name                  |string     |null: false                    |
|description           |text       |null: false                    |
|price                 |integer    |null: false                    |
|user_id               |references |null: false, foreign_key: true |
|category_id           |references |null: false                    |
|condition_id          |references |null: false                    |
|shipping_fee_id       |references |null: false                    |
|prefecture_id         |references |null: false                    |
|shipping_date_id      |references |null: false                    |


### Association
- has_one :order
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_fee
- belongs_to :prefecture
- belongs_to :shipping_date

## ordersテーブル

|Column         |Type       |Options                        |
|---------------|-----------|-------------------------------|
|user_id        |references |null: false, foreign_key: true |
|product_id     |references |null: false, foreign_key: true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :product


## addressesテーブル

|Column         |Type    |Options                       |
|---------------|--------|------------------------------|
|postal_code    |string  |null: false                   |
|prefecture_id  |integer |null: false                   |
|city           |string  |null: false                   |
|address_line1  |string  |null: false                   |
|address_line2  |string  |null: true                    |
|phone_number   |integer |null: false                   |
|order_id       |integer |null: false, foreign_key: true|

### Association
- belongs_to :order
- belongs_to :prefecture


## categoriesテーブル

|Column         |Type    |Options                       |
|---------------|--------|------------------------------|
|name           |string  |null: false                   |

### Association
- has_many :products


## conditionsテーブル

|Column         |Type    |Options                       |
|---------------|--------|------------------------------|
|name           |string  |null: false                   |

### Association
- has_many :products

## shipping_feesテーブル

|Column         |Type    |Options                       |
|---------------|--------|------------------------------|
|name           |string  |null: false                   |

### Association
- has_many :products


## prefecturesテーブル

|Column         |Type    |Options                       |
|---------------|--------|------------------------------|
|name           |string  |null: false                   |

### Association
- has_many :products


## shipping_datesテーブル

|Column         |Type    |Options                       |
|---------------|--------|------------------------------|
|name           |string  |null: false                   |

### Association
- has_many :products

## 