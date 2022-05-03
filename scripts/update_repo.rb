#!/usr/bin/env ruby
require 'httparty'
require 'json'

GITHUB_TOKEN = (ENV['GITHUB_TOKEN']).to_s

print 'what is the organization name? '
org_name = gets.chomp

print 'what is the repository name? '
repo_name = gets.chomp

URL = "https://api.github.com/orgs/#{org_name}/repos?per_page=100".freeze
REQUEST_HEADER = {
	Authorization: "token #{GITHUB_TOKEN}",
	Accept: 'application/vnd.github.v3+json'
}.freeze

response = HTTParty.get(
	URL,
	headers: REQUEST_HEADER
)
response_json = JSON.parse(response.to_s)

repos = []
response_json.each do |repo|
	next if repo['archived']

	repos.push(repo['name'])
end

repo_exists = false
while !repo_exists
	if repos.include?(repo_name)
		puts "Updating #{repo_name}"
		repo_exists = true
	else
		puts "Repository doesn't exist"
		repo_exists = false
		print 'what is the repository name? '
		repo_name = gets.chomp
	end
end

system("ash update_repo.sh update_repo #{repo_name}")
