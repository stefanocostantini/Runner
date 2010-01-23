# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

# convert "09:30" to 9.5 or "9:45" to 9.75 etc
def self.time_to_numeric(hours)
  return 0 if hours.blank?
  left = hours[0,hours.index(":")].to_i
  right = hours[hours.index(":")+1,2].to_i
  return left + (((right * 5) / 3) / 100.to_f)
end


# convert 9.5 to 9:30 or 8.75 to 8:45 etc
def numeric_to_hours(hours)
  return "0:00" if hours.nil? || hours == 0
  hrs_i = hours.to_i
  hrs_f = hours.to_f
  units = hrs_f % hrs_i
  units = ((units / 5) * 300)
  hrs_s = "#{hours.to_i.to_s}:#{units.to_i.to_s}"
  hrs_s += "0" if hrs_s =~ /:0$/
  return hrs_s
end

def simple_date(time = Time.now)
	time.strftime("%d.%m.%Y")
end 


end
