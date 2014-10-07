Utils
=====

Set of scripts.

Copy all scripts in your path.

icalview.rb
-----------

Script to parse calendar invitation from google calendar or outlook in **mutt**.

Require:

* [ruby-2.1.0](https://www.ruby-lang.org/en/installation/#package-management-systems)
* [icalendar-2.2.0](https://github.com/icalendar/icalendar)

You must add to your *.muttrc* file:

    auto_view test/calendar

And the following line to your *.mailcap* file:

    text/calendar; icalview.rb; copiousoutput

