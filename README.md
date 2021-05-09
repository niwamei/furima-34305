# テーブル設計

## usersテーブル

| Column              | Type    | Options                       |
| ------------------- | ------- | ----------------------------- |
| nickname            | string  | null: false                   |
| email               | string  | null: false, uniqueness: true |
| encrypted_password  | string  | null: false                   |
| last_name           | string  | null: false                   |
| first_name          | string  | null: false                   |
| last_name_kana      | string  | null: false                   |
| first_name_kana     | string  | null: false                   |
| birthday            | date    | null: false                   |

### Association
- has_many :items
- has_many :shipment_methods
- has_many :delivery_addresses

## itemsテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| name           | string     | null: false       |
| image          | integer    | null: false       |
| description    | text       | null: false       |
| category       | integer    | null: false       |
| condition      | integer    | null: false       |
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

## delivery_addressesテーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| postal_code       | string     | null: false       |
| province          | integer    | null: false       |
| city              | string     | null: false       |
| address           | string     | null: false       |
| building          | string     |                   |
| phone_number      | string     | null: false       |
| shipment_methods  | references | foreign_key: true |

### Association
- belongs_to :user