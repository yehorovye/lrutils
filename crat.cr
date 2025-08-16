# simple as fuck "cat" replacement.
# supports multiple files.

BUFFER_SIZE = 1_048_576

def copy(src, dst)
  buf = Bytes.new(BUFFER_SIZE)
  while (n = src.read(buf)) > 0
    dst.write buf[0, n]
  end
end

if ARGV.empty?
  copy(STDIN, STDOUT)
else
  ARGV.each do |a|
    if a == "-"
      copy(STDIN, STDOUT)
    else
      begin
        File.open(a, "rb") { |f| copy(f, STDOUT) }
      rescue ex
        STDERR.puts "crat: #{a}: #{ex.message}"
        exit 1
      end
    end
  end
end

