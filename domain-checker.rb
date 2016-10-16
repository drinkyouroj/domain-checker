#!/usr/bin/env ruby
require 'whois'

input_list = ARGV.first
input_file = open(input_list)

input_file.each_line { |domain|
	whois = Whois::Client.new(:timeout => 10)
	record = whois.lookup(domain.downcase.chomp)
	puts domain
	puts record.registrar
}

input_file.close
