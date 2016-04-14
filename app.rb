require "azure"

Azure.config.storage_account_name = ENV['AZURE_ACCOUNT']
Azure.config.storage_access_key = ENV['AZURE_KEY']

azure_blob_service = Azure::Blob::BlobService.new
begin
  container = azure_blob_service.create_container("pictures")
rescue
  puts $!
end