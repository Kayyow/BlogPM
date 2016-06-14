class Contact
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :name, :email, :subject, :message

    validates :name, :email, :subject, :message, presence: true
    validates :email, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    def initialize(attributes = {})
        attributes.each do |name, value|
            send("#{name}=", value)
        end
    end

    def persisted?
        false
    end
end