class ContactMailer < ApplicationMailer
    default from: 'no-reply@kayyow.fr',
            to: 'contact@kayyow.fr'

    def contact_email(contact)
        @contact = contact
        mail(from: @contact.email, subject: @contact.subject)
    end
end
