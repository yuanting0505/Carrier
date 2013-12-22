# encoding: utf-8

class CardsController < ApplicationController
	def new
		@card=Card.new
	end

	def create
		@card=Card.new(card_params)

		filename=@card.destination+"_"+Time.now.to_s+'.jpg'
		kit=IMGKit.new("http://#{request.host_with_port}")
		img=kit.to_img(:jpg)
		@full_filename="#{Rails.root}/app/assets/images/cards/"+filename
		file=kit.to_file(@full_filename)

		@card.filename1=filename;

		if @card.save

			Notifier.send_card(@card.destination,@card.content,time_to_date(@card.created_at),@full_filename).deliver
            redirect_to 'http://wwww.baidu.com'
		else
			render 'new'
		end
	end

	private

	def card_params
		params.require(:card).permit(:destination,:content,:created_at)
	end

	def time_to_date(time)
		DateTime.parse(time.to_s).strftime('%Y年%m月%d日').to_s
	end
end
