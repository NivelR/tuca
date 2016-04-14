class Record < ApplicationRecord
  belongs_to :user

  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png",
    storage: :azure,
    azure_credentials: {
      storage_account_name: ENV['AZURE_ACCOUNT'],
      access_key:           ENV['AZURE_KEY'],
      container:            ENV['AZURE_CONTAINER_NAME']
    }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
