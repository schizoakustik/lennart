OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '667420572036-jqsvv843m36u9n0a9tbjpfv348brk30v.apps.googleusercontent.com', '_dNXZSEieCG5sjhxIsGzbCvs', {       client_options: { ssl: { ca_file: Rails.root.join("cacert.perm").to_s }}}
end