module OpenSSL
  module SSL
    remove_const :VERIFY_PEER
  end
end
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :github, ENV["RAILSCASTS_GITHUB_CLIENT_ID"], ENV["RAILSCASTS_GITHUB_CLIENT_SECRET"]
  provider :github, "f0c8dcc4c5037fc38090", "8c391d5c341f6fa360fe42119481e3394a6f6cd2"
end
