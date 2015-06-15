#!/usr/bin/env ruby
#slack-memo-inbox.rb
#Ce script envoie un message sur slack pour rappeler les jours de gestion de inbox

#CLASS
class SlackMemo
	attr_accessor :team_odd_weeks
	attr_accessor :team_even_weeks

	def initialize(team1, team2)
		@slack_channel = '#team'
		@slack_username = "inbox-bot"
		@slack_emoji = ":ghost:"
		@slack_url = "https://hooks.slack.com/services/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"
		
		@team_odd_weeks = team1
		@team_even_weeks = team2
	end

	def memo_today_user
		index = self.get_day - 1 #days start at 1 but array at 0

		if(self.is_odd_week?)
			user = @team_odd_weeks[index]
		else
			user = @team_even_weeks[index]
		end

		self.send_message_to_slack(user + ' petit rappel pour inbox!')

	end

	def get_day
		return Time.now.strftime('%u').to_i
	end

	def is_odd_week?
		return Time.now.strftime('%W').to_i.odd?
	end

	def is_even_week?
		return Time.now.strftime('%W').to_i.even?
	end

	def send_message_to_slack(message)
		if(message)
			cmd = 'curl -X POST --data-urlencode \'payload={"channel": "' + @slack_channel  + '", "username": "' + @slack_username + '", "text": "' + message + '", "icon_emoji": "'+ @slack_emoji + '"}\' ' + @slack_url
			system(cmd)
		end
	end

end


#INIT
team1 = ["@fred","@elise","@renversou","@nicolas","@laurepichot"]
team2 = ["@charlotte","@zemaud","@camille","@tony.tiratay","@acoriol"]


#MAIN 

memo = SlackMemo.new(team1,team2);

memo.memo_today_user();
