module Departure
  module LogSanitizers
    class PasswordSanitizer
      PASSWORD_REPLACEMENT = '[filtered_password]'

      def initialize(config)
        @config = config
      end

      def execute(log_statement)
        return log_statement if password_argument.blank?
        log_statement.gsub(password_argument, PASSWORD_REPLACEMENT)
      end

      private

      def password_argument
        @config.with_indifferent_access[:password]
      end
    end
  end
end
