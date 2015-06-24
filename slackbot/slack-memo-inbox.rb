#!/usr/bin/env ruby
#slack-memo-inbox.rb
#Ce script envoie un message sur slack pour rappeler les jours de gestion de inbox

require "net/http"
require "uri"
require "json"

#CLASS
class SlackMemo
  attr_accessor :team_odd_weeks
  attr_accessor :team_even_weeks
  attr_accessor :messages9
  attr_accessor :messages11

  def initialize(team1, team2, message9, message11)
    @slack_channel = '#testdev'
    @slack_username = "inbox-bot"
    @slack_emoji = ":ghost:"
    @slack_url = "https://hooks.slack.com/services/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"
    
    @team_odd_weeks = team1
    @team_even_weeks = team2
    @messages9 = message9
    @messages11 = message11
  end

  def memo_today_user
    index = self.is_day - 1 #days start at 1 but array at 0

    if(self.is_odd_week?)
      user = @team_odd_weeks[index]
    else
      user = @team_even_weeks[index]
    end

    self.send_message_to_slack(user + ' petit rappel pour inbox!')
  end
  
  def memo_lunch_user
    if ARGV[0] == "msg1"
      self.send_message_to_slack("@group" + " " + @messages9[is_day - 1])
    end
    
    if ARGV[0] == "msg2"
      self.send_message_to_slack("@group" + " " + @messages11[is_day - 1])
    end
  end
  
  def is_day
    return Time.now.wday
  end

  def is_odd_week?
    return Time.now.wday.odd?
  end

  def is_even_week?
    return Time.now.wday.even?
  end

  def send_message_to_slack(message)
    
    if (message != "")
      uri = URI.parse(@slack_url)
      
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      #http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(uri.request_uri)
      request.add_field('data-urlencode', 'playload')
      request.body = {'channel'=>@slack_channel, 'username'=>@slack_username, 'text'=>message, 'icon_emoji'=>@slack_emoji}.to_json
      response = http.request(request)
      p response.body
    end
    
  end

end


#INIT
team1 = ["@fred","@elise","@renversou","@nicolas","@laurepichot"]
team2 = ["@charlotte","@zemaud","@camille","@tony.tiratay","@acoriol"]
message9 = ["petit rappel pour le lunch à 13h! Pensez à preparez vos paniers repas!", "aaaa", "bbbb", "cccc!", "dddd", "eeee", "ffff"]
message11 = ["petit rappel pour le lunch à 13h! La réunion approche!", "aaaa", "bbbb", "cccc!", "dddd", "eeee", "ffff"]


#MAIN 

memo = SlackMemo.new(team1,team2,message9,message11);

memo.memo_today_user();
memo.memo_lunch_user();
