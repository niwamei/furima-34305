# テーブル設計

## usersテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| last_name        | string  | null: false |
| first_name       | string  | null: false |
| last_name_kana   | string  | null: false |
| first_name_kana  | string  | null: false |
| birth_day        | integer | null: false |
| birth_month      | integer | null: false |
| birth_year       | integer | null: false |

### Association
- has_many :items
- has_many :shipment_methods
- has_many :delivery_addresses
- has_many :credit_cards

## itemsテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| name           | string     | null: false       |
| description    | text       | null: false       |
| category       | string     | null: false       |
| condition      | string     | null: false       |
| price          | integer    | null: false       |
| user           | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :shipment_method

## shipment_methodsテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| fee            | integer    | null: false       |
| area           | text       | null: false       |
| date           | text       | null: false       |
| user           | references | foreign_key: true |
| item           | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## credit_cardsテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| number         | integer    | null: false       |
| exp_day        | integer    | null: false       |
| exp_month      | integer    | null: false       |
| security_code  | string     | null: false       |
| user           | references | foreign_key: true |

### Association
- belongs_to :user

## delivery_addressesテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | integer    | null: false       |
| province      | string     | null: false       |
| city          | string     | null: false       |
| address       | string     | null: false       |
| building      | string     | null: false       |
| phone_number  | integer    | null: false       |
| user          | references | foreign_key: true |

### Association
- belongs_to :user