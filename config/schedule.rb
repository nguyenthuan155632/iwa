# frozen_string_literal: true

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

require_relative 'environment'

env :PATH, ENV['PATH']

set :environment, Rails.env

set :output, standard: "log/cron_job_#{@environment}.log", error: "log/cron_job_error_#{@environment}.log"

# every 1.day, at: '0:00 am' do
#   rake 'schedules:crawl_latest_articles'
# end
