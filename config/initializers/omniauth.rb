OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '833700523388750', '07256ee1d2f638a5038e40cdfe09a0a9'
end