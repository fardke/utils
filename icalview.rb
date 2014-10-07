#!/usr/bin/env ruby

require "rubygems" # apt-get install rubygems
require "icalendar" # gem install icalendar

cals = Icalendar.parse($<)
cals.each do |cal|
  cal.events.each do |event|
    puts "Organizer: #{event.organizer}"
    puts "Event:     #{event.summary}"
    puts "Starts:    #{event.dtstart.strftime("%a %d %b %Y, %H:%M")}"
    puts "Ends:      #{event.dtend.strftime("%a %d %b %Y, %H:%M")}"
    puts "Location:  #{event.location}"
    puts "Description:\n#{event.description}"
    puts "\n \n"
    puts "Contact:   "
    event.attendee.each do |contact|
        puts "#{contact.to_s}"
    end
  end
end
