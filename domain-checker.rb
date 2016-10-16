#!/usr/bin/env ruby
require 'whois'

input_list = ARGV.first
input_file = open(input_list)

input_file.each_line { |domain|
	whois = Whois::Client.new(:timeout => 10)
	record = whois.lookup(domain.downcase.chomp)
	registrar_url = record.registrar.url
	registrar_name = record.registrar.name
	
	gd_url = false
	gd_name = false

	if registrar_url == nil then
#		puts "#{domain.chomp} registrar has no URL."
	elsif registrar_url.downcase =~ /.*godaddy.*/
		gd_url = true
	end

	if registrar_name == nil then
#		puts "#{domain.chomp} registrar has no name."
	elsif registrar_name.downcase =~ /.*godaddy.*/
		gd_name = true
	end
	
	if (gd_url || gd_name) then
		puts "#{domain.chomp} registrar is GoDaddy."
	end
}

input_file.close
