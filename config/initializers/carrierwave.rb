CarrierWave.configure do |config|
  # Configuration for Amazon S3
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region: ENV['S3_REGION']
  }
  config.fog_directory = ENV["AWS_S3_BUCKET"]

# To let CarrierWave work on heroku
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory = "#{ENV['S3_BUCKET_NAME']}"

  # config.s3_access_policy = :public_read
  # config.fog_host = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET_NAME']}"

  #S3_ASSET_URL is the address of the server where the uploaded files are going to 
end

#in terminal to set herokus s3 keys -- example only -- 
# heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder