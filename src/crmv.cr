# mv implementation.

if ARGV.size != 2
  STDERR.puts "crmv: that's not how you use me."
  exit 1
end

src = ARGV[0]
dst = ARGV[1]

begin
  File.rename(src, dst)
rescue ex
  STDERR.puts "crmv: #{ex.message}"
  exit 1
end
