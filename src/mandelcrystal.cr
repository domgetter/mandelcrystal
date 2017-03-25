require "./mandelcrystal/*"

module Mandelcrystal
  def self.main
    max_iterations = 1e6
    total_iteration_count = 0
    19.downto(-20) do |pix_imag|
      c_imag = pix_imag / 20.0
      line = ""
      -40.upto(39) do |pix_real|
        bailout = false
        c_real = pix_real / 40.0 - 0.5
        z_real = 0.0
        z_imag = 0.0

        iteration = 0
        while(!bailout && iteration < max_iterations)
          w_real = z_real**2 - z_imag**2 + c_real
          w_imag = 2.0 * z_real * z_imag + c_imag
          z_real = w_real
          z_imag = w_imag
          bailout = z_real**2 + z_imag**2 >= 4.0
          total_iteration_count += 1
          iteration += 1
        end
        print compute_character(iteration)
      end
      puts
    end
    puts "Total iteration: #{total_iteration_count}"
  end

  def self.compute_character(dwell)
    case dwell
    when 0..4 then "O"
    when 5..8 then "o"
    when 9..16 then "°"
    when 17..32 then "."
    else " "
    end
  end
end

Mandelcrystal.main
