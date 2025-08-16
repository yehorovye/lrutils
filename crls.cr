# ls implementation, ok?
# supports multiple dirs.

# note: this code is wip as i would like to add some data from the dirs. ~elisiei

def list(path)
  begin
    Dir.open(path) do |dir|
      dir.each_child { |e| puts e }
    end
  rescue ex
    STDERR.puts "crls: #{path}: #{ex.message}"
    exit 1
  end
end

if ARGV.empty?
  list(".")
else
  ARGV.each { |p| list(p) }
end
