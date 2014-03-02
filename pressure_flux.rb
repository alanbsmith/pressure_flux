# This is a project designed to calculate the approximate pressure fluctuations of nitrogen in tires, and provide feedback based on the pressure readings. 
# The approximation of 1 degree Fahrenheit causing .19 lbs of pressure change was used for the calculations.
# This model could be used for measuring the fluctuation of air as well, however it is much less consistent depending on moisture.
#
#

puts ""
puts "Welcome to the Nitrogen Fluctuation App."
puts "To calculate your tire pressure, we'll need a little input first."

print "Please input the approximate initial temperature (in F):  "
init_temp = Integer(gets.chomp)

print "Please input the initial pressure (in lbs):  "
init_pressure = Integer(gets.chomp)

print "Please input the current temperature (in F):  "
current_temp = Integer(gets.chomp)

  if init_temp > current_temp
    flux = ((init_temp - current_temp) * 0.19)
    current_pressure = (init_pressure - flux)
    percent_flux = (((init_pressure - current_pressure) / init_pressure) * 100).to_i
    puts "" 
    puts "Tires have decreased pressure by #{flux} lbs. (#{percent_flux}%)"
    puts "Your current tire pressure is: #{current_pressure} lbs."
    
    normal_pressure = (init_pressure * 0.75)
    moderate_conditions = (init_temp - (normal_pressure * 0.19)).to_i
    

      if current_pressure < (init_pressure * 0.75)
        puts ""
        puts "Your decreased tire pressure may be great enough to trigger your tire pressure sensor."
	    puts "The pressure should return to normal when the temperature increases to more moderate condiditons, (#{moderate_conditions} F)."
	    puts "If the sensor light does not go off, this may be a sign of a leak."
	    puts "Please check the tire manually for normal pressure, (#{normal_pressure} lbs), and refer to a technician if necessary."
	    puts ""
      else
        puts ""
	    puts "Your decreased tire pressure might not be enough to trigger your tire pressure sensor."
	    puts "If your low tire pressure light is on, this might be a sign of a leak."
	    puts "Please check the pressure manually to see if it is at #{normal_pressure} lbs or above, and see a technician if necessary."
	    puts ""
      end

  else
    flux = ((current_temp - init_temp) * 0.19)
    current_pressure = (init_pressure + flux)
    flux_percent = (((current_pressure - init_pressure) /init_pressure) * 100).to_i
    puts "Your tire pressure has increased by #{flux} lbs. (#{flux_percent}%) and is approximately #{current_pressure} lbs."
    puts "Be cautious of overinflation. Please check the maximum pressure capacity on the side of the tires."
  end
