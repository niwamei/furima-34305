require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品が保存できる場合' do
      it '全ての情報と画像が存在していれば保存できること' do
        expect(@item).to be_valid
      end
      it 'nameがあれば保存できること' do
        @item.name = 'test'
        expect(@item).to be_valid
      end
      it 'descriptionがあれば保存できること' do
        @item.description = 'test description'
        expect(@item).to be_valid
      end
      it 'categoryがあれば保存できること' do
        @item.category_id = '2'
        expect(@item).to be_valid
      end
      it 'conditionがあれば保存できること' do
        @item.condition_id = '2'
        expect(@item).to be_valid
      end
      it 'priceが300〜9999999の間で、半角数字の入力であれば保存できること' do
        @item.price = '1000'
        expect(@item).to be_valid
      end
      it 'delivery_feeがあれば保存できること' do
        @item.delivery_fee_id = '2'
        expect(@item).to be_valid
      end
      it 'delivery_areaがあれば保存できること' do
        @item.delivery_area_id = '2'
        expect(@item).to be_valid
      end
      it 'delivery_dateがあれば保存できること' do
        @item.delivery_date_id = '2'
        expect(@item).to be_valid
      end
    end
    context '商品が保存できない場合' do
      it 'nameが空では登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では登録できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが空では登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'categoryを選択していない場合は登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'conditionが空では登録できないこと' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'conditionを選択していない場合は登録できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円以下であれば保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceが9,999,999円以上であれば保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 1000000')
      end
      it 'priceが半角数字以外でなければ保存できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is too short (minimum is 3 characters)', 'Price is not a number')
      end
      it 'priceが英数混合では保存できないこと' do
        @item.price = '300yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英語のみでは保存できないこと' do
        @item.price = 'three hundred yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is too short (minimum is 3 characters)', 'Price is not a number')
      end
      it 'conditionを選択していない場合は登録できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it '画像が空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'delivery_feeが空では登録できないこと' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'delivery_feeを選択していない場合は登録できないこと' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it 'delivery_areaが空では登録できないこと' do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'delivery_areaを選択していない場合は登録できないこと' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
      end
      it 'delivery_dateが空では登録できないこと' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it 'delivery_dateを選択していない場合は登録できないこと' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
      end
      it '画像が空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
