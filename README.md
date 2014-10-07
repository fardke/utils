Utils
=====

Set of scripts.

Copy all scripts in your path.

icalview.rb
-----------

Script to parse calendar invitation from google calendar or outlook in **mutt**.

You must add to your *.muttrc* file:

    auto_view test/calendar

And the following line to your *.mailcap* file:

    text/calendar; icalview.rb; copiousoutput

