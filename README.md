# テーブル設計

## usersテーブル

| Column              | Type    | Options                    |
| ------------------- | ------- | -------------------------- |
| nickname            | string  | null: false                |
| email               | string  | null: false, unique: true  |
| encrypted_password  | string  | null: false                |
| last_name           | string  | null: false                |
| first_name          | string  | null: false                |
| last_name_kana      | string  | null: false                |
| first_name_kana     | string  | null: false                |
| birthday            | date    | null: false                |

### Association
- has_many :items
- has_many :purchase_histories

## itemsテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| name           | string     | null: false       |
| description    | text       | null: false       |
| category_id    | integer    | null: false       |
| condition_id   | integer    | null: false       |
| price          | integer    | null: false       |
| delivery_fee   | integer    | null: false       |
| delivery_area  | text       | null: false       |
| delivery_date  | text       | null: false       |
| user           | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_history

## purchase_historiesテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| user           | references | foreign_key: true |
| item           | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_address

## delivery_addressesテーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| postal_code       | string     | null: false       |
| province          | integer    | null: false       |
| city              | string     | null: false       |
| address           | string     | null: false       |
| building          | string     |                   |
| phone_number      | string     | null: false       |
| purchase_history  | references | foreign_key: true |

### Association
- belongs_to :purchase_history