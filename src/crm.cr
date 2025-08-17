# rm implementation.

if ARGV.empty?
  STDERR.puts "crm: that's not how you use me."
  exit 1
end

begin
  ARGV.each do |path|
    if Dir.exists?(path)
      Dir.delete(path)
    else
      File.delete(path)
    end
  end
rescue ex
  STDERR.puts "crm: #{ex.message}"
  exit 1
end
