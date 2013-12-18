# encoding: utf-8

class Notifier < ActionMailer::Base
  default from: "tomorrow.courier@gmail.com"

  def send_card(destination,content,date)
  	@date=date
  	@content=content
  	mail(to:destination,
         subject:'一封来自过去的信件'
  		)
  end
end