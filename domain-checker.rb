#!/usr/bin/env ruby
require 'whois'

input_list = ARGV.first
input_file = open(input_list)

input_file.each_line { |domain|
	record = Whois.whois(domain.downcase.chomp)
	puts record.registrar.name
}

input_file.close
