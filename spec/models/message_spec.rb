require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'can save' do
      # メッセージがあれば保存できるのテスト content入れて飛ばす→ バリデーションされなかった
      it 'is valid with content' do
        expect(build(:message, image: nil)).to be_valid
      end

      # 画像がなければ保存できないのテスト バリデーションされなかった
      it 'is valid with image' do
        expect(build(:message, content: nil)).to be_valid
      end

      # メッセージと画像があれば保存できるのテスト バリデーションされなかった
      it 'is valid with content and image' do
        expect(build(:message)).to be_valid
      end
    end

    context 'can not save' do
      # メッセージも画像も無いと保存できないのテスト 含まれていなかった
      it 'is invalid without content and image' do
        message = build(:message, content: nil, image: nil)
        # ↓ 作成したインスタンスがバリデーションに引っかかるかどうかたしかめる
        message.valid?
        expect(message.errors[:content]).to include('を入力してください')
      end

      # group_idが無いと保存できないのテスト
      it 'is invalid without group_id' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include('を入力してください')
      end

      # user_idが無いと保存できないのテスト
      it 'is invaid without user_id' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include('を入力してください')
      end
    end
  end
end
