require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module JITM
  class Application < Rails::Application
    config.load_defaults 6.1

    # デフォルトの言語を日本語に設定
   # config.i18n.default_locale = :ja
    config.i18n.default_locale = :en
    # 利用可能なロケールを設定（必要に応じて）
    config.i18n.available_locales = [:en, :ja]
  end
end
