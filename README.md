# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user



### usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|bigint|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false|

### Association
- has_many :groups, through: :group_users
- has_many :group_users
- has_many :messages



## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|id|bigint|null: false|
|name|string|null: false|

### Association
- has_many :users, through: :group_users
- has_many :group_users
- has_many :messages



## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|id|bigint|null: false|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
|text|text||
|image|string||

### Association
- belongs_to :group
- belongs_to :user