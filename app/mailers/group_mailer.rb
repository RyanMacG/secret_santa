class GroupMailer < ActionMailer::Base
  default from: "santa@ryansanta.heroku.com"

  def gifting_confirmation(participant, giftee, group)
    @participant = participant
    @giftee = giftee
    @group = group
    mail to: participant.email, subject: "You've been matched!"
  end
end
