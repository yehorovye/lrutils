# cp implementation.

BUFFER_SIZE = 1_048_576

if ARGV.size != 2
  STDERR.puts "crp: that's not how you use me."
  exit 1
end

begin
  File.open(ARGV[0], "rb") do |src|
    File.open(ARGV[1], "wb") do |dst|
      buf = Bytes.new(BUFFER_SIZE)
      while (n = src.read(buf)) > 0
        dst.write buf[0, n]
      end
    end
  end
rescue ex
  STDERR.puts "crp: #{ex.message}"
  exit 1
end
