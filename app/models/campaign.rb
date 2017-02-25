class Campaign < ApplicationRecord

  validates :cid, presence:true
  validates :form_template, presence:true
  validates :result_template, presence:true

  after_initialize :set_default, if: :new_record?

  private

    def set_default
      self.cid ||= Hashids.new("this is my salt", 0, 'abcdefghijklmnopqrstuvwxyz').encode(Time.now.to_i)
    end

end