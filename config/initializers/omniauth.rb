Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '542611419255784', 'e2ef2ade43ba9a6797b96e6dc66ba91c'
end