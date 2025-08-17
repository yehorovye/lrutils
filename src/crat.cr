# simple as fuck "cat" replacement.
# supports multiple files.

BUFFER_SIZE = 1_048_576

if ARGV.empty?
  buf = Bytes.new(BUFFER_SIZE)
  while (n = STDIN.read(buf)) > 0
    STDOUT.write buf[0, n]
  end
else
  ARGV.each do |a|
    if a == "-"
      buf = Bytes.new(BUFFER_SIZE)
      while (n = STDIN.read(buf)) > 0
        STDOUT.write buf[0, n]
      end
    else
      begin
        File.open(a, "rb") do |f|
          buf = Bytes.new(BUFFER_SIZE)
          while (n = f.read(buf)) > 0
            STDOUT.write buf[0, n]
          end
        end
      rescue ex
        STDERR.puts "crat: #{a}: #{ex.message}"
        exit 1
      end
    end
  end
end

