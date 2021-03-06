#!/usr/bin/env ruby
# encoding: utf-8

code = STDIN.readline.rstrip!
# tries_count unused in this implementation
STDIN.readline

code_bytes = code.bytes.to_a
code_contains = Array.new(256, false)
code_bytes.each do |bt|
  code_contains[bt] = true
end

STDIN.each do |t|
  total_right = 0
  missed_right = 0
  t.rstrip!.each_byte.with_index do |bt, i|
    if bt == code_bytes[i]
      total_right += 1
    else
      missed_right += 1 if code_contains[bt]
    end
  end
  puts "#{total_right} #{missed_right}"
end
