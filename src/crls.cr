# ls implementation, ok?
# supports multiple dirs.

# note: this code is wip as i would like to add some data from the dirs. ~elisiei

if ARGV.empty?
  begin
    Dir.open(".") { |dir| dir.each_child { |e| puts e } }
  rescue ex
    STDERR.puts "crls: .: #{ex.message}"
    exit 1
  end
else
  ARGV.each do |p|
    begin
      Dir.open(p) { |dir| dir.each_child { |e| puts e } }
    rescue ex
      STDERR.puts "crls: #{p}: #{ex.message}"
      exit 1
    end
  end
end

